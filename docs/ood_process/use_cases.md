# Use Cases

## User Auth

### User creates account
1. User taps "Create Account" from login screen
2. User enters email
3. User enters password
4. User enters password confirmation
5. User taps "Create"
6. User returns to login screen

### User logs in
1. User opens app to login screen
2. User enters email
3. User enters password
4. User taps "Log In"
5. User is taken to home screen

### User logs out
1. User taps hamburger menu
2. User taps settings cog
3. User clicks "Log Out"
4. User is taken to login screen

### User deletes account
1. User taps hamburger menu
2. User taps "Account Settings"
3. User is taken to account screen
4. User taps "Delete Account"
5. User is shown account deletion warning
6. User is prompted to confirm by entering account password
7. User taps "Delete"
8. User is taken to login screen

### User resets password from login screen
1. User taps "Forgot Password"
2. User is taken to account recovery screen
3. User is prompted for account email
4. Account recovery email with unique code sent to account email
5. User enters code into code field
6. User is presented with new password fields (in new password screen?)
7. User enters password and confirmation of password
8. User taps "Confirm New Password"
9. User is returned to login screen

### User changes password while logged in
1. User taps hamburger menu
2. User taps "Account Settings"
3. User is taken to account screen
4. User taps "Change Password"
5. User is prompted to enter current password
6. User enters current password
7. User is presented with new password fields (in new password screen?)
8. User enters password and confirmation of password
9. User taps "Confirm New Password"
10. User is returned to account screen

## Index Functionalities (From Home Screen)

### User views list of all pokemon with overview data
*Overview data includes name, type(s), base stats, base stat total, and the pokemon's sprite*
1. User taps "Pokedex"
2. User is taken to Pokedex screen
3. All pokemon are displayed in a scrollable list

### User searches list of all pokemon in Pokedex screen
1. User taps search field at top of list of pokemon
2. User enters search text
3. Pokemon list is filtered using search entry in realtime

### User filters list of all pokemon in Pokedex screen
*Example filter types might include: Type (Fire, Water), Pre-evolution status, Base Stat Total, etc.*
1. User taps "filter"
2. User is taken to Filter screen
3. User selects one or more of the pre-made filter options
4. User taps "back"
5. User is returned to Pokedex screen
6. Pokemon list is filtered according to the selected filter options
7. Filter selection is cleared only when the user **fully exits** the Pokedex screen (e.g., returns to home or Teambuilder), not when navigating to Pokémon detail screens

### User clears all active filters from Pokedex screen
1. User taps "filter"
2. User is taken to filter screen
3. User taps "clear filters"
4. All selected filters are disabled
5. User taps "back"
6. User is returned to Pokedex screen

### User selects a pokemon from the Pokedex screen for more details
*"More details" includes extra information like weight, gender stats, pre-evolution status, type defenses, type offenses, movepool, and abilitypool*
1. User taps a pokemons list item
2. User is taken to a Pokemon Info screen that is populated with the selected pokemon's information

### User selects a pokemon to build around from the Pokedex screen
1. User long-presses a pokemon to open context menu
2. User taps "Build around"
3. User is taken to Teambuilder screen
4. New team object is created
5. Selected pokemon is placed in the first team member slot
6. Perform pokemon into slot flow
7. Perform team save flow

### User selects a pokemon to build around from the Pokemon Info screen
1. User taps "Build Around" (as a main component of the Pokemon Info screen)
2. User is taken to Teambuilder screen
3. New team object is created
4. Selected pokemon is placed in the first team member slot
5. Perform pokemon into slot flow
6. Perform team save flow

### User views list of all moves with overview data
*Overview data includes name, type, category, power, accuracy, priority, description, targets, and tags*
1. User taps "Movedex"
2. User is taken to Movedex screen
3. All moves are displayed in a scrollable list

### User selects a move from the Movedex screen for more details
*"More details" includes extra information like game-interaction info and the pokemon that can learn the move (and how they learn it?)*
1. User taps a move's list item
2. User is taken to Move Info screen that is populated with the selected moves information

### User selects a pokemon + move combo to build around from the Move Info screen
1. User long-presses pokemon in list of pokemon that can learn the move
2. User taps "Build around"
3. User is taken to Teambuilder screen
4. New team object is created
5. Selected pokemon is placed in the first team member slot
6. The selected pokemon's slot's first move is set to the move from the info screen
7. Perform pokemon into slot flow
8. Perform team save flow

### User views list of all abilities with overview data
*Overview data includes name and short description of ability*
1. Users taps "Abilitydex"
2. User is taken to Abilitydex screen
3. All abilities are displayed in scrollable list

### User selects an ability from the Abilitydex screen for more details
*"More details" includes game-interaction info and the pokemon that can have the ability (and whether its natural or hidden?)*
1. User taps an ability's list item
2. User is taken to Ability Info screen that is populated with the selected ability's information

### User selects a pokemon + ability combo to build around from the Ability Info screen
1. User long-presses the pokemon in list of pokemon that can have the ability
2. User taps "Build around"
3. User is taken to Teambuilder screen
4. New team object is created
5. Selected pokemon is placed in the first team member slot
6. The selected pokemon's slot's ability is set to the ability from the info screen
7. Perform pokemon into slot flow
8. Perform team save flow

### User views list of all battle items with all data
*All data includes name, sprite, fling power, klutz interaction, and battle effect description*
1. User taps "Itemdex"
2. User is taken to Itemdex screen
3. All items are displayed in a scrollable list

## Team Functions

###**Pokémon into Slot Flow**
When a new Pokémon is inserted into a team slot (via Build Around, Add, or Replace), the following steps occur:
1. **Base Stat Setup**
   - Set the slot’s base stats to match the newly inserted Pokémon’s base stats
   - Set all IVs to 31 (maximum value)
   - Set all EVs to 0
   - Set nature to "Quirky" (neutral nature)
2. **Derived Stat Calculation**
   - Calculate total stats using:
     - Base stats
     - Level (default=50)
     - Nature
     - IVs and EVs
   - Update the slot’s displayed stats accordingly
3. **Held Item Assignment**
   - If the Pokémon has a required held item (e.g., Ogerpon-Hearthflame requires the Hearthflame Mask), automatically assign it to the slot’s held item field
4. **Gimmick Reset**
   - Reset generational gimmick fields (e.g., Terastallization, Dynamax) to their default values:
     - Terastallization: selected pokemons primary type (first type that appears in type list)
     - Dynamax: toggle gigantamax off by default

### **Team save flow**
1. App inserts/updates team in local DB immediately
2. App marks team as "dirty" (unsynced with server)
3. When user **fully exits** Teambuilder (e.g. when navigating to My Teams screen or Home screen), not when navigating to team member selection screens (like Pokedex, Movedex, etc.):
    - App checks for unsynced changes
    - App writes updated team data to online DB
4. App clears "dirty" flag after successful synchronization

### User views list of all teams they have created
1. User taps "My teams"
2. User is taken to My Teams screen
3. All teams are displayed in a scrollable list

### User creates a team from My Teams screen
1. User taps "Create team"
2. User is taken to Teambuilder screen
3. New team objects is created
4. New team object is automatically saved to DB (local and online)

### User deletes a team from My Teams screen
1. User opens context menu for a team by long-pressing the team in list of teams
2. User taps "Delete team"
3. User is presented with confirmation dialogue warning "This cannot be undone"
4. User taps "Delete"
5. Team object is deleted from local and online DB

### User renames a team
1. User taps the team name field in the Teambuilder screen
2. User enters new team name and submits
3. Perform team save flow

### User adds pokemon to a team
1. User taps empty pokemon slot in the Teambuilder screen
2. User is taken to Pokedex screen
3. User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the formerly empty slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User replaces a pokemon on a team
1. User taps an occupied pokemon slot in the Teambuilder screen
2. User is taken to Pokedex screen
    - Pokemon list is filtered to display only those pokemon with the selected moves, abilities in its movepool/abilitypool
    - User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the former pokemon's slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User deletes a pokemon from a team
1. User long-presses the pokemon in it's slot in the Teambuilder screen
2. User taps "Remove"
3. App clears the pokemon field for that slot
4. App clears the gimmick and stat fields for that slot (all others are left unchanged)
5. Perform team save flow

### User clears a slots selections from a team
1. User taps the slot's hamburger menu in the Teambuilder screen
2. User taps "Clear"
3. All fields for that slot are cleared
4. Perform team save flow

### User adds a pokemon to a team based on its knowing a move
1. User adds a move to a move field of the slot in the Teambuilder screen
2. User taps the pokemon field of the slot
3. User is taken to Pokedex screen
    - Pokemon list is filtered to display only those pokemon with the selected move in its movepool
    - User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the pokemon field of the slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User adds a pokemon to a team based on its knowing a series of moves
1. User adds moves to move fields of the slot in the Teambuilder screen
2. User taps the pokemon field of the slot
3. User is taken to Pokedex screen
    - Pokemon list is filtered to display only those pokemon with the selected moves in its movepool
    - User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the pokemon field of the slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User adds a pokemon to a team based on its having access to an ability
1. User adds an ability to the ability field of the slot in the Teambuilder screen
2. User taps the pokemon field of the slot
3. User is taken to Pokedex screen
    - Pokemon list is filtered to display only those pokemon with the selected ability in its abilitypool
    - User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the pokemon field of the slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User selects an ability for a slot
1. User taps the ability field for the slot in the Teambuilder screen
2. User is taken to Abilitydex screen
    - If a pokemon is selected for the slot: ability list is filtered to display only those abilities that the selected pokemon can have
    - If a pokemon is not selected for the slot: ability list is presented in its entirety
3. User can optionally search/filter to locate the desired ability
4. User taps an ability's list item to select
5. User is returned to Teambuilder screen
6. Selected ability is placed in the ability field of that slot
7. Perform team save flow

### User de-selects an ability for a slot
1. User long-presses the ability field for the slot in the Teambuilder screen
2. User taps "Remove"
3. App clears the ability field for that slot
4. Perform team save flow

### User selects a move for a slot
1. User taps a move field for the slot in the Teambuilder screen
2. User is taken to Movedex screen
    - If a pokemon is selected for the slot: move list is filtered to display only those moves that the selected pokemon can learn
    - If a pokemon is not selected for the slot: move list is presented in its entirety
3. User can optionally search/filter to locate the desired move
4. User taps a move's list item to select
5. User is returned to Teambuilder screen
6. Selected move is placed in the tapped move field of that slot
7. Perform team save flow

### User de-selects a move for a slot
1. User long-presses the move field for the slot in the Teambuilder screen
2. User taps "Remove"
3. App clears that move field for that slot
4. Perform team save flow

### User selects a move for a slot
1. User taps a move field for the slot in the Teambuilder screen
2. User is taken to Movedex screen
    - If a pokemon is selected for the slot: move list is filtered to display only those moves that the selected pokemon can learn
    - If a pokemon is not selected for the slot: move list is presented in its entirety
3. User can optionally search/filter to locate the desired move
4. User taps a move's list item to select
5. User is returned to Teambuilder screen
6. Selected move is placed in the tapped move field of that slot
7. Perform team save flow

### User de-selects a move for a slot
1. User long-presses the move field for the slot in the Teambuilder screen
2. User taps "Remove"
3. App clears that move field for that slot
4. Perform team save flow

### User selects an item for a slot
1. User taps the item field for the slot in the Teambuilder screen
2. User is taken to Itemdex screen
3. User can optionally search/filter to locate the desired item
4. User taps an item's list item to select
5. User is returned to Teambuilder screen
6. Selected item is placed in the item field of that slot
7. Perform team save flow

### User de-selects an item for a slot
1. User long-presses the item field for the slot in the Teambuilder screen
2. User taps "Remove"
3. App clears the item field for that slot
4. Perform team save flow

### User edits EVs for a pokemon
1. User taps the stats field for the slot while the slot has a pokemon selected in the Teambuilder screen
2. User is taken to Stats screen
3. When a user taps + or - to adjust an EV:
    - Update the in-memory model (not the DB)
    - Immediately reflect the change in the UI
4. Start or reset a debounce timer (2 seconds)
5. When the user stops tapping for the debounce duration:
    - Perform team save flow
6. The slots stats field will reflect the changes when returning from the Stats screen

### User edits IVs for a pokemon
1. User taps the stats field for the slot while the slot has a pokemon selected in the Teambuilder screen
2. User is taken to Stats screen
3. When a user taps + or - to adjust an IV:
    - Update the in-memory model (not the DB)
    - Immediately reflect the change in the UI
4. Start or reset a debounce timer (2 seconds)
5. When the user stops tapping for the debounce duration:
    - Perform team save flow
6. The slots stats field will reflect the changes when returning from the Stats screen

### User edits nature for a pokemon
1. User taps the stats field for the slot while the slot has a pokemon selected in the Teambuilder screen
2. User is taken to the Stats screen
3. User taps the "Nature" fields dropdown button
4. User selects a nature from the dropdown list
5. Update nature field to the selected nature
6. Perform team save flow
7. The slots stats field will reflect the changes when returning from the Stats screen

### User edits tera type for a pokemon
1. User taps the tera field for the slot while the slot has a pokemon selected and the regulation for the team allows it (the tera field shouldn't be visible if those two conditions aren't met anyhow) in the Teambuilder screen
2. A dropdown menu is presented to the user
3. User selects a type from the dropdown
4. Selected type is placed in the tera field for that slot
5. Perform team save flow

### User edits dynamax status for a pokemon
1. User taps the dynamax field for the slot while the regulation for the team allows dynamax and there is a selected pokemon in the slot that has a gigantamax form in the Teambuilder screen
2. The dynamax field toggles to indicate the pokemon will be gigantamax
3. Perform team save flow

### User selects a regulation for the team
*Note: the regulation/ruleset will default to an empty field (national dex, essentially), so that initialization of a team doesn't require a regulation be selected beforehand*
1. User taps the regulation field for a team in the Teambuilder screen
2. A dropdown appears that lists all possible competitive rulesets
3. User selects a ruleset
4. The selected ruleset is placed in the ruleset field for the team
5. Ruleset validity indicators are enabled, flagging any pokemon/item/move/etc. that is not allowed in the format
    - Red outline, maybe? Red glowing exclamation in a circle?
6. Perform team save flow

### User sets a rental code for a team
*Team rental codes are codes that users can generate for teams they have built on their game cartridge that others can freely use*
1. User taps the hamburger menu in the Teambuilder screen
2. User taps "Set rental code"
3. User is presented with field to enter a team rental code
4. User enters team rental code and submits
5. Perform team save flow

# NOTE TO SELF: Structure ruleset validity stuff with "Clauses" that can check pokemon, move, item, ability, etc., that way if any rulesets have different rules around legal items or such (not exclusively Pokemon, as the rulesets seem to function now) the legality checkers will be flexible enough to accomodate it

### User shares detailed team image for a team from My Teams
*Detailed team images include all hidden information about a team (EVs, IVs, Nature, etc.)*
1. User taps hamburger menu for team in My Teams screen
2. User taps "Share detailed team sheet"
    - Option is disabled if there are ruleset validity flags
3. App generates an image displaying
    - All slots and their selected fields
    - Ruleset/Regulation the team is built for
    - Author name
    - (Optional) Console rental code if present

### User shares tournament team image for a team from My Teams
*Tournament team images include only the information provided to opponents before a tournament match*
1. User taps hamburger menu for team in My Teams screen
2. User taps "Share tournament team sheet"
    - Option is disabled if there are ruleset validity flags
3. App generates an image displaying
    - All slots and their selected fields (excluding the hidden information)
    - Ruleset/Regulation the team is built for
    - Author name

### User shares team pokepaste for a team from My Teams
1. User taps hamburger menu for team in My Teams screen
2. User taps "Share pokepaste"
3. App generates a pokepaste for the team
4. Pokepaste is copied to clipboard
5. Display popup notifying the user that the pokepaste has been copied to clipboard

# TODO: 
1. User views resource reports for pokemon/teams 
2. User views team breakdown of coverage/speed/defenses/offenses/members
3. User views speed tier for a given pokemon against the format (screen with list of pokemon color coded for min/neu/max speeds)
4. User duplicates team
5. User saves pokemon set to bank
6. User selects pokemon from another team
7. User navigates to damage calculator with pokemon
8. User views moves/items/abilities/stats usage statistics
9. User navigates to dex view from Teambuilder for pokemon/item/move/ability
10. User performs damage calculation between two pokemon (and all it entails)
11. User selects pokemon for team slot from bank
12. User selects pokemon for calculation from bank
13. Search/filter for the other dexes