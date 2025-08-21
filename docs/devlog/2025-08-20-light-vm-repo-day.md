# 2025-08-20 - Minor ViewModel/Repo work

## Tasks Completed
It was a rather light day in which I had sporadic time available throughout the day to work. One of the things I'm interested in getting better at is "guerilla coding" as I call it. I want to be flexible in my ability to sit down and code when I have spare moments, as up to now my coding process has involved long time spans where I "lock-in" and work. Over the course of a collection of moments that total up to around two hours I managed to navigate a tough design decision as well as implemented several of my viewmodel methods.

## Realtime Notes
- Modified storage of MovePoolEntry ids for slots to be a map of int, movePoolEntyrId pairs to allow for move selection ordering
- Encountering issue with updating movepoolentry selection for a slot. The issue:
    - When selecting a move for a slot, it is selected from the Movedex screen, which provides a Move object. Since slots expect movepoolentries, this move needs to be wrapped in a MovePoolEntry (hence, requires an Id) to be able to be stored for the slot. But actually, it needs to be wrapped into a MovePoolEntryViewModel (which isn't really the difficult part, its mainly the id being needed). Perhaps a solution could be storing each move in a pokemon-less MPE in the table, then add a method to get an MPE with no pokemon
- Elected to implement a getNoPokemonEntry method for the movepoolrepo and include pokemon-less MPE in db.