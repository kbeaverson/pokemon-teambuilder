## Movepools table composition
- pokemon_id: foreign key [(Pokemon)](../database_table_composition/pokemon-table.md)
- move_id: foreign key [(Moves)](../database_table_composition/moves-table.md)
- isEggMove: bool
- isTMMove: bool
- isLevelupMove: bool
- levelupMoveLevel: int?