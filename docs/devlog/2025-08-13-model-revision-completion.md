# 2025-08-13 - Model Revision/Completion

## Models
I have finally completed my domain models. I modified the calculator/side to have many boolean/int attributes rather than try to manage those separately, and I introduced a few more enums. Weather, Terrain, Status, SideName were all created to help track what effects are effecting damage calculation, as well as who is attacking. Now I press on to the ViewModels, where I will define all the functionality I need with contracts.

### 10 Minutes Later Update
I was reading up on different change notification techniques and found that one popular practice is to build all model types as immuntable, then use methods like copyWith to "update" the states of the model. I had implemented the static game data as immutable types, but I think it may be prudent to do the same for the others.

This task has made it clear to me that I had been using freezed slightly incorrectly and I'm going back and fixing my implementations to use the factory constructor in addition to converting my user-customizeable models.

Done.

## Realtime Notes
- Need to implement manager classes to load json data of regulations/clauses
- Need to implement method to save json data of a new regulation/clauses
- Renamed Clause.message -> Clause.descriptionMessage to make clear that it communicates what the rule is
- Repurposing ClauseType to convey which type of clause to load
- Building ClauseTypes:
    - Banned Pokemon: requires list of pokemon names (ids?) that are banned, checks to make sure none are present in any slot
    - Species Clause: enforces that there are no duplicate pokemon species on a team (enforceable through dexNum)
    - Item Clause: enforces that there are no duplicate items on a team (enforceable via ID)
    - Restricted Clause: requires list of restricted pokemon, int indicating how many restricted pokemon are allowed
    - Banned Move: requires list of move names (ids?) that are banned, checks to make sure none are present in any slot
    - Banned Ability: requires list of ability names (ids?) that are banned, checks to make sure none are present in any slot
- Added new to do: "Build default regulation flow"