# 2025-08-18 - ViewModels, Repos, and Data Sync

## Foreword
The changes that I made within this log were actually developed over the course of 3-4 days. Working on the ViewModels and Repositories made clear that I needed to decide on my synchronization strategy before I made too much progress. What followed was a few days worth of research into different synchronization methods and packages.

## Sync Method
I first encountered a few packages in the vein of `offline sync kit`. I did a bit of research into the implementation of it and began work to bring a couple of my models into standard with it before I discovered tools like `Brick` and `Powersync`. After further reading, I elected to give `Powersync` a go because I like the easy integration it offers with Supabase. It creates and manages a local sqlite database that it automatically synchronizes with the remote database based around the preferences/settings you create. 
Implementing Powersync required two major changes:
- Powersync does not support join tables at present, so I had to refactor my tables to work without them in Supabase.
- In addition to the repo methods I anticipated making, I had to add an additional factory constructor to all of my methods that takes an sqlite.Row parameter and decodes it into the model from there (though this may have been an elegant solution even if I hadn't decided on powersync).

## New Tools
I played around with multi-cursor mode in VSCode to fill out fields that are assigned by indexing into an sqlite row. (Used multi-cursor to modify all parameters simultaneously, it was pretty neat!) Doing so really opened my eyes to the possibilities of accelerating my pace when writing code, so I decided to give GitHub Copilot a go for the first time, and I was generally impressed by what it had to offer. It was able to autocomplete some of my factory fromRow constructors for my models after I had made a couple by hand, and it also assisted in writing out the decoding logic for some of my model attributes that are custom enum types.

## ViewModels
I didn't make it too far into developing ViewModel logic before I found myself in the thick of the sync problem, but I have the basis done for several of my domain model types. I found and added some (potentially placeholder) pngs for use with my move/abilitypool entries.

## Repos
I've written rough drafts for each of the repo contracts and taken a stab at implementing one using my powersync database. I have yet to test it, but I followed along with a few video tutorials and the documentation closely. The core repo crud logic will rely on the powersync_util methods that I wrote according to powersyncs flutter + supabase + powersync tutorial.

## Realtime notes
- Should move viewmodel exist? Probably for longevity reasons...
- Need to credit here for arrow png: <a href="https://www.flaticon.com/free-icons/arrow" title="arrow icons">Arrow icons created by Dave Gandy - Flaticon</a>

- As I begin to implement ViewModels and Repositories, I find that the question of handling offline/remote synchronization requires immediate addressing. I have found this package: https://pub.dev/packages/offline_sync_kit which manages synchronization of data automatically when implemented with the domain models. Slightly unfortunate that I discovered it after implementing the models, but I hadn't progressed too far and the modifications don't pose and major rework challenges. Here's my current game plan:
    - Maintain immutability pattern for user-generated data models in the form of "~Data" classes
    - Extend the SyncModel from the offline_sync_kit package in new model classes, which will have the respective "~Data" class as an attribute
    - This allows me to have the best of both worlds from the perspective of maintaining clear separation between domain concerns and sync concerns
    - Offers efficiency with updates, syncing only changed data rather than entire objects
- Pursuing the above path has me considering whether static game data should still be stored remotely, or if it should be local with changes being made in updates. I think I like the idea of maintaining remote storage with a push-message style for updates to those tables, which otherwise won't be queried on device? Something like that...
- Scratch the above implementation with `offline_sync_kit`, I'm going to try using `powersync`.
- Considering refactoring user_teams, team_members, movepools, abilitypools, and bank tables; powersync does not support join tables well, and so the following modifications are being considered:
    - slots has had a team_id and user_id foreign reference column to allow for use of bank and team_members join table
    - movepools and abilitypools has been given an id primary key column, with the foreign references to pokemon and moves/abilities being retained but no longer functioning as a primary key
- Workarounds to achieve powersync compatibility ^
- Refactored AbilityPoolEntry and MovePoolEntry to have only the ids of pokemon and move/abilities to support lazy loading
    - Similar for slots
- Got sprites for abilitypool and movepool stuff
- Added position field to slot table to allow for lazy initialization of slots within a team object (now can assign position to slots rather than having fixed slot ordering)