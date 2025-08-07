# 2025-08-07 - Screen Flows and Framework Models

## Screens, Widgets, and Screen Flows
I finished off the last of the screens and widgets for the Damage Calculator use cases, and with that I am ready to proceed to the next step. I sketched up a quick [(I am not an artist)](../ood_process/flow-diagram.pdf) screen flow diagram that shows how a user navigates through the app, based on my described use cases and screen compositions.

## Framework Models
As I hinted at yesterday, I have elected to use Supabase as my online database service for this app. It seems like it may be even simpler to work with in Dart than it was in Swift (there are no mandated conformities to policies like Codability in Swift), so I'm looking forward to that. For local storage I plan to use SQFlite, but I'm not sure what the implications of the mismatch between SQFlite locally vs PostgreSQL online might be. I need to look more into this.

## Relational Database Model
I'm considering my data in two pieces: static game data, and user related data. 
Static game data will include all the index information and the join tables relating them to each other. I plan to use other freely available APIs to get this data and fill out my database. There are several sources online that have aggregated this data. I am leaning towards using the dex data from Pokemon Showdown as it is already formatted json data and I know it is up to date (https://play.pokemonshowdown.com/data/).
User related data includes user profile information, user created slots (bank and teams), and user created teams.
The tables I have identified a need for today are:
**Static data**
- Pokemon
- Moves
- Abilities
- Items
- Movepools (join between Pokemon + Moves)
- Abilitypools (join between Pokemon + Abilities)
- Regulations?
- Clauses?
**User data**
- Profile
- Slots
- Teams
- Bank (join between users + Slots?)
- Team members (join between Teams + Slots)
This is by no means comprehensive or complete, but it's as far as I'll get today. I hope to have this rounded out by tomorrow.

## Realtime Notes
- I forgot to add a use case for editing a team (tap on team or tap edit team from My Teams)
- I also neglected home -> my teams flow initially. I'm still undecided as to whether or not I'd like My Teams to be the home screen with the other navigation elements in some sort of sidebar menu. The heart of the app is the teambuilding, so I think I like that idea.
- Added base pp, isZmove, isMax to move attributes
- Changed weight attribute from int -> double for pokemon, as weights are stored in kg
- Added isMax and isMega attributes to pokemon so that those forms can be automatically hidden from presentation in pokemon select lists
- I completely forgot to implement stat stage changes for the calculator. Need to fix.