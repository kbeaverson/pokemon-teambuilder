# 2025-08-19 - ViewModels and Repos again

## ViewModels and Repos
I spent the majority of the day working on ViewModels and their utility methods. The game data types were predictably straightforward, but I added in some methods for sprite and color retrieval. Now types, learn methods, and categories all have sprites that can be accessed through their respective enums. One minor addition was included: an extension of the String class that converts Strings to title case, for presentation of names in views. I reused a pokedex colors class that I had from my first go around with the app, since its certainly still useful. I had to spend some time working out the flow of data between different screens to minimize the amount of times that I expose pure data. Specifically I was considering the times when a user would long-press a MovePoolEntry to view more info about a move. Would I pass the move object from the MovePoolEntryViewModel? When should I encapsulate it into a MoveViewModel? Before or after arrival in the MoveDetailView? I elected to only allow exposure of raw pokemon/move/ability data from within their respective view models. The PoolEntry view models will only be capable of providing the respective ViewModel types of pokemon/move/ability. One major design decision I made today was the use of optimistic updates of the UI rather than reactive updates. I chose this for the sake of perceived performance, generally, but also simply "because". I'm kinda just experimenting on that front. If I have to go back and implement reactive updates I will, because with the structure of my project the changes would be localized to my viewmodel classes and those would be straightforward to modify. 

## On the Horizon
Tomorrow I hope to finish up my ViewModel and Repo implementations based on the contracts I have written. I haven't written it out yet, but I need to iron out the initial retrieval of static data for the list (dex) views, as I anticipate this being the birthplace of essentially all of the data that users are interacting with from the database. I'm beginning to identify categories of tasks that the project can be broken into. Right now I see: 
- dex functionality (core to the whole thing)
- the teambuilder
- the calculator
- regulation logic/enforcement
Dex functionality and the teambuilder are my highest priorities at present.

## Other Notes
Copilot has been toggled off after the first half of my work today, as I felt that some of the methods it was using were alien enough to me that I wanted to try writing the functionalities by hand to be sure that I understood them. 

## Realtime Notes
- Move/AbilityPoolEntry pokemon and move/ability attributes need to be optional to allow users to select an ability before selecting a pokemon or vice-versa
- Wanted to change Team initializer to initialize 6 empty slots with respective positions/user_id/team_id, but I can't recall why.
- ~~Will pass move objects to MoveDetailView and then wrap them in MoveViewModels for formatting~~ Can just wrap move into MoveViewModel before passing, right? I think the simplest option might just be to make a getter that returns the move in a viewmodel, then it can be passed easily between screens without ever being exposed. I like the idea of raw move data being exposable only from a MoveViewModel. I'll do the same with Pokemon.
- Elected to have viewmodel attributes for the static game data types be non-nullable, opting to have slot viewmodel contain nullable viewmodel attributes for each of the customizable elements.
- Fixed multihithigh and multihitlow: now both are nullable ints
- Added pokedex color class to utils to allow for color logic for pokemon and moves
- I have no idea how I overlooked this, but I added the description field to the item class implementation on both supabase, the schema, and the class definition.
- Made string extension to capitalize first letter of each word for presentation formate of names
- Realized today that I haven't designed this in a way that moves can be reliably ordered with empty slots between filled slots
- Opting for an optimistic update pattern for viewmodel-repo updates to favor perceived performance