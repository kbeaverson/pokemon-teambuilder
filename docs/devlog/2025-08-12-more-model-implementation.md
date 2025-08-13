# 2025-08-12 - Models
Today I continued implementing my domain models and helper classes. I completed ability, item, slot, movePoolEntry, abilityPoolEntry, and started work on team, regulation, and clauses, before finding myself bogged down in the logistics of loading/storing/updating/validating with respect to teams and regulations. I think I've identified a possible solution:
- Store regulations and clauses in local json files
- To load: design a manager class for both regulations and clauses which will
    - Load the regulation from its json, then load the respective clauses.
- Clauses will be stored with their "type" and their parameters (e.g. "banned-pokemon" with a list of pokemon names)
- The Clause class will be abstract, and extended by each type of Clause
- Could provide some sort of "registry" class for clauses to load the appropriate type when found in json

## Realtime Notes
- Removed UUID from Nature as it can readily be implemented as an enum and won't be stored in the database
- Refactoring the move fields for slots to be a json list of move_id/index pairs to allow for flexibility in the number of possible moves for a pokemon
- Refactoring ev/iv fields for slots in db to be json list of stat/int pairs, similar treatment for Pokemon base stats
- Slot, required override of toString/==/hashCode
- ~~Too tired, will clean up daily log in the morning~~