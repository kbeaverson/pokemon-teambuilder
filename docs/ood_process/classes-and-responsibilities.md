# Classes and Responisbilities
Below I've outlined all classes, their attributes and responsibilities that I have identified at this stage in development.

## User
### Attributes
- id: UUID
- username: String
- passwordHash: String
- email: String
### Responsibilities
- CRUD Slot
- CRUD Team
- Share Team
- Authenticate/Manage account

## Team
### Attributes
- id: UUID
- name: String
- description: String
- members: List<Slot>
- regulation: Regulation?
- rentalCode: String?
- isDirty: bool
### Responsibilities
- Maintain ordered list of Slots (with reordering)
- Store metadata about purpose/strategy
- Enforce legality via regulation
- Trigger save/sync operations
- Export as detailed/tournament sheet or Pokepaste
- Duplicate, delete, rename

## Slot
### Attributes
- id: UUID
- pokemon: Pokemon?
- moves: List<Move?>
- ability: Ability?
- item: Item?
- nature: Nature
- ivs: Map<Enum (Stat), int>
- evs: Map<Enum (Stat), int>
- teraType: Type?
- gigantamax: bool
- notes: String
- isDirty: bool
### Responsibilities
- Represent a fully customized Pokémon set
- Participate in Team or exist in Bank
- Be copied, edited, saved, and deleted
- Display as editable or immutable slot views
- Participate in calculations and legality checks
- Clone safely (deep copy)
- Sync with DB
- Participate in reordering and build flows

## Regulation
### Attributes
- id: String
- name: String
- clauses: List<Clause>
### Responsibilities
- Validate legality of Teams and Slots
- Define what is allowed per generation or tournament format

## Clause
### Attributes
- type: Enum (Pokemon, Move, Ability, Item, Gimmick)
- rule: Function(Slot) → bool
- message: String
### Responsibilities
- Validate one field of a Slot or Team
- Generate warnings for invalid elements

Side should have the field effects for its side, as well as the Slot for its side. Tapping a move for a slot on one side should designate that side as the attacking side and the other as the defending side, as well as set that move as the attacking move, then calculate

## Calculator
### Attributes
- left: Side
- right: Side
- attackingMove: Move?
- criticalHit: bool
- guaranteedCrit: bool
- attacker: Side
- defender: Side
- globalFieldEffects: Set<FieldEffect>
- damageRange: List<int>
- resultString: String
### Responsibilities
- Compute and display damage results
- Allow ad-hoc Side editing
- Provide toggleable field states
- Provide toggleable critical hit status *(Disable toggle if critical hit is guaranteed by move or ability of attacker)*

## Side
### Attributes
- pokemon: Slot
- sideConditions: Set<SideConditions>
- statusCondition: StatusCondition?
- healthPercent: int
### Responsibilities
- Allow ad-hoc Slot editing
- Save temporary or persistent Sets
- Provide toggleable gimmicks and side/status conditions
- Provide stat manipulation UI and logic
- Provide healthPercent manipulation UI and logic

## Pokemon
### Attributes
- id: UUID
- name: String
- dexNum: int
- type: List<Enum (pokemon types)>
- baseHp: int
- baseAtk: int
- baseDef: int
- baseSpA: int
- baseSpD: int
- baseSpe: int
- preEvolution: bool
- weight: int
- genderRatio: int
- isMythical: bool
- isLegendary: bool
- sprite: Image
- movePool: List<Move>?
- abilityPool: List<Ability>?
- mandatoryItemName: String?
*The pools are optionals to facilitate lazy loading of this data, which will be in separate tables*
### Responsibilities
- Provide immutable, canonical data about a species
- Serve as a reference model for Slot customization
- Enable stat calculation by exposing base stats and typing
- Facilitate Pokédex queries and info screen population
- Support legality checks via static ability/move lists

## Move
### Attributes
- id: UUID
- name: String
- dexNum: int
- type: Enum (pokemon types)
- category: Enum (Physical, Special, Status)
- target: Enum (Ally, Single target, Enemies, etc.)
- power: int
- accuracy: int
- priority: int
- shortDescription: String
- longDescription: String
- hasSecondaryEffect: bool
- isMultiHit: bool
- multiHitHigh: int?
- multiHitLow: int?
- ignoresSubstitute: bool
- ignoresProtect: bool
- bounceable: bool
- bite: bool
- bullet: bool
- contact: bool
- dance: bool
- heal: bool
- powder: bool
- pulse: bool
- punch: bool
- slice: bool
- sound: bool
- wind: bool
- boostedBySheerForce: bool
- ohko: bool
### Responsibilities
- Provide immutable, canonical data about a move
- Serve as a reference model for Slot customization
- Facilitate Movedex queries and info screen population
- Support damage calculation by exposing damage stats and move typing

## Ability
### Attributes
- id: UUID
- name: String
- dexNum: int
- description: String
- blockedByNeutGas: bool
- ignored: bool *whether or not the ability is ignored by ability ignoring effects*
### Responsibilities
- Provide immutable, canonical data about an ability
- Serve as a reference model for Slot customization
- Facilitate Abilitydex queries and info screen population
- Support damage calculation by exposing ability traits

## HeldItem
### Attributes
- id: UUID
- name: String
- dexNum: int
- flingPower: int
- ignoredByKlutz: bool
- sprite: Image
- category: Enum (recovery, boosting, defense)
### Responsibilities
- Provide immutable, canonical data about an item
- Serve as a reference model for Slot customization
- Facilitate Itemdex queries and info screen population
- Support damage calculation by exposing item traits

## Nature
### Attributes
- id: UUID
- name: String
- increasedStat: Enum (Stat)
- decreasedStat: Enum (Stat)
### Responsibilities
- Support stat and damage calculation by exposing nature traits
