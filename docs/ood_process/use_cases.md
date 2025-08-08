# Use Cases

## User Auth

### User creates account
1. User taps "Create Account" from login screen
2. User is taken to Registration screen
3. User enters email
4. User enters password
5. User enters password confirmation
6. User taps "Create"
7. User returns to login screen

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

### User searches list of all moves in Movedex screen
1. User taps search field at top of list of moves
2. User enters search text
3. Move list is filtered using search entry in realtime

### User filters list of all moves in Movedex screen
*Example filter types might include: Type (Fire, Water), Move category, Priority, etc.*
1. User taps "filter"
2. User is taken to Filter screen
3. User selects one or more of the pre-made filter options
4. User taps "back"
5. User is returned to Movedex screen
6. Move list is filtered according to the selected filter options
7. Filter selection is cleared only when the user **fully exits** the Movedex screen (e.g., returns to home or Teambuilder), not when navigating to Move detail screens

### User clears all active filters from Movedex screen
1. User taps "filter"
2. User is taken to filter screen
3. User taps "clear filters"
4. All selected filters are disabled
5. User taps "back"
6. User is returned to Movedex screen

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

### User searches list of all abilities in Abilitydex screen
1. User taps search field at top of list of abilities
2. User enters search text
3. Ability list is filtered using search entry in realtime

### User filters list of all abilities in Abilitydex screen
*Example filter types might include: Klutz interactivity, Neutralizing Gas interactivity, etc.*
1. User taps "filter"
2. User is taken to Filter screen
3. User selects one or more of the pre-made filter options
4. User taps "back"
5. User is returned to Abilitydex screen
6. Ability list is filtered according to the selected filter options
7. Filter selection is cleared only when the user **fully exits** the Abilitydex screen (e.g., returns to home or Teambuilder), not when navigating to Ability detail screens

### User clears all active filters from Abilitydex screen
1. User taps "filter"
2. User is taken to filter screen
3. User taps "clear filters"
4. All selected filters are disabled
5. User taps "back"
6. User is returned to Abilitydex screen

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

### User searches list of all items in Itemdex screen
1. User taps search field at top of list of items
2. User enters search text
3. Item list is filtered using search entry in realtime

### User filters list of all items in Itemdex screen
*Example filter types might include: Boosting, Berry, Consumable, etc.*
1. User taps "filter"
2. User is taken to Filter screen
3. User selects one or more of the pre-made filter options
4. User taps "back"
5. User is returned to Itemdex screen
6. Item list is filtered according to the selected filter options
7. Filter selection is cleared only when the user **fully exits** the Itemdex screen (e.g., returns to home or Teambuilder), not when navigating to Item detail screens

### User clears all active filters from Itemdex screen
1. User taps "filter"
2. User is taken to filter screen
3. User taps "clear filters"
4. All selected filters are disabled
5. User taps "back"
6. User is returned to Itemdex screen

~~### User selects an item to build around from the Itemdex screen~~
~~1. User long-presses the item in list~~
~~2. User taps "Build around"~~
~~3. User is taken to Teambuilder screen~~
~~4. New team object is created~~
~~5. Selected item is placed in the first slot's item field~~
~~6. Perform team save flow~~

## Team Functions

### **Pokémon into Slot Flow**
When a new Pokémon is inserted into a team slot (via Build Around, Add, or Replace), the following steps occur:
1. Base Stat Setup
    - Set the slot’s base stats to match the newly inserted Pokémon’s base stats
    - Set all IVs to 31 (maximum value)
    - Set all EVs to 0
    - Set nature to "Docile" (neutral nature)
2. Derived Stat Calculation
    - Calculate total stats using:
        - Base stats
        - Level (default=50)
        - Nature
        - IVs and EVs
    - Update the slot’s displayed stats accordingly
3. Held Item Assignment
    - If the Pokémon has a required held item (e.g., Ogerpon-Hearthflame requires the Hearthflame Mask), automatically assign it to the slot’s held item field
4. Gimmick Reset
    - Reset generational gimmick fields (e.g., Terastallization, Dynamax) to their default values:
        - Terastallization: selected pokemons primary type (first type that appears in type list)
        - Dynamax: toggle gigantamax off by default
5. Move Compatibility Assessment
    - For each non-empty move, check the selected pokemon's movepool for that move. Clear the move slot if not present.
6. Ability Compatibility Assessment
    - For a non-empty ability field, check the selected pokemon's abilitypool for that ability. Clear the ability slot if not present.


### **Team save flow**
1. App inserts/updates team in local DB immediately
2. App marks team as "dirty" (unsynced with server)
3. When user **fully exits** Teambuilder (e.g. when navigating to My Teams screen or Home screen), not when navigating to team member selection screens (like Pokedex, Movedex, etc.):
    - App checks for unsynced changes
    - App writes updated team data to online DB
4. App clears "dirty" flag after successful synchronization

### **Bank save flow**
1. App inserts/updates slot in local DB immediately
2. App marks slot as "dirty" (unsynced with server)
3. App adds the slot update to a queue of pending online updates
4. App updates online DB in next batch sync
5. App clears "dirty" flag after successful synchronization

### User views list of all teams they have created
1. User taps "My teams"
2. User is taken to My Teams screen
3. All teams are displayed in a scrollable list

### User creates a team from My Teams screen
1. User taps "Create team"
2. User is taken to Teambuilder screen
3. New team object is created
4. New team object is automatically saved to DB (local and online)

### User deletes a team from My Teams screen
1. User ~~opens context menu for a team by long-pressing the team in list of teams~~ taps hamburger menu for a team in the list of teams
2. User taps "Delete team"
3. User is presented with confirmation dialogue warning "This cannot be undone"
4. User taps "Delete"
5. Team object is deleted from local and online DB

### User renames a team
1. User taps the team name field in the Teambuilder screen
2. User enters new team name and submits
3. Perform team save flow

### User edits a team’s description
1. User opens the Teambuilder screen for a team
2. User taps the hamburger menu in the header
3. User taps “Edit Team Description”
4. App opens a modal sheet (this is what I've referred to as a drawer view elsewhere) for the team description
5. User types into a multi-line text field (limit 1000 characters?)
6. User taps “Save”
7. Team object’s description field is updated in memory
8. App performs team save flow
9. User is returned to the Teambuilder screen

### User adds pokemon to a team
1. User taps empty pokemon field of the slot in the Teambuilder screen
2. User is taken to Pokedex screen
3. User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the formerly empty slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User replaces a pokemon on a team
1. User taps the occupied pokemon field of the slot in the Teambuilder screen
2. User is taken to Pokedex screen
    - Pokemon list is filtered to display only those pokemon with the selected moves, abilities in its movepool/abilitypool
    - User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Teambuilder screen
6. Selected pokemon is placed in the former pokemon's slot
7. Perform pokemon into slot flow
8. Perform team save flow

### User deletes a pokemon from a team
1. User long-presses the pokemon field in the slot in the Teambuilder screen
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
    - Pokemon list is filtered to display first those pokemon with the selected move in their movepool, in a more vibrant hue than the subsequent pokemon that do not have the selected move in their movepool
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
    - Pokemon list is filtered to display first those pokemon with the selected moves in their movepool, in a more vibrant hue than the subsequent pokemon that do not have the selected moves in their movepool
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
    - Pokemon list is filtered to display first those pokemon with the selected ability in their abilitypool, in a more vibrant hue than the subsequent pokemon that do not have the selected ability in their abilitypool
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
    - If a move is already selected, it is shaded a different color from the rest to indicate such. If selected anyhow, remove the other instance of the move from its move field for the slot before placing 
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
6. The slot's stats field will reflect the changes when returning from the Stats screen

### User edits IVs for a pokemon
1. User taps the stats field for the slot while the slot has a pokemon selected in the Teambuilder screen
2. User is taken to Stats screen
3. When a user taps + or - to adjust an IV:
    - Update the in-memory model (not the DB)
    - Immediately reflect the change in the UI
4. Start or reset a debounce timer (2 seconds)
5. When the user stops tapping for the debounce duration:
    - Perform team save flow
6. The slot's stats field will reflect the changes when returning from the Stats screen

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

### User reorders Slots for a team (Teambuilder)
1. User taps the hamburger menu for the Teambuilder screen
2. User taps "Reorder Pokemon"
3. Arrow buttons appear for each pokemon which, when pressed, move the pokemon up or down in the slots list
    - Mutability for slot fields are disabled in this context
4. User taps "Done"
5. Arrow buttons disappear
    - Mutability restored

### User selects a regulation for the team
*Note: the regulation/ruleset will default to ~~an empty field (~~national dex or the current competitive regulation,~~, essentially),~~ so that initialization of a team doesn't require a regulation be selected beforehand*
1. User taps the regulation field for a team in the Teambuilder screen
2. A dropdown appears that lists all possible competitive rulesets
3. User selects a ruleset
4. The selected ruleset is placed in the ruleset field for the team
    - Any gimmicks that may have been selected when switching to a regulation that disallows it should be set to the default value for each slot as they are disabled
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
4. User taps "save image"
5. App saves image to camera roll

### User shares detailed team image for a team from Teambuilder
*Detailed team images include all hidden information about a team (EVs, IVs, Nature, etc.)*
1. User taps hamburger menu for team in Teambuilder screen
2. User taps "Share detailed team sheet"
    - Option is disabled if there are ruleset validity flags
3. App generates an image displaying
    - All slots and their selected fields
    - Ruleset/Regulation the team is built for
    - Author name
    - (Optional) Console rental code if present
4. User taps "save image"
5. App saves image to camera roll

### User shares tournament team image for a team from My Teams
*Tournament team images include only the information provided to opponents before a tournament match*
1. User taps hamburger menu for team in My Teams screen
2. User taps "Share tournament team sheet"
    - Option is disabled if there are ruleset validity flags
3. App generates an image displaying
    - All slots and their selected fields (excluding the hidden information)
    - Ruleset/Regulation the team is built for
    - Author name
4. User taps "save image" button
5. App saves image to camera roll

### User shares tournament team image for a team from Teambuilder
*Tournament team images include only the information provided to opponents before a tournament match*
1. User taps hamburger menu for team in Teambuilder screen
2. User taps "Share tournament team sheet"
    - Option is disabled if there are ruleset validity flags
3. App generates an image displaying
    - All slots and their selected fields (excluding the hidden information)
    - Ruleset/Regulation the team is built for
    - Author name
4. User taps "save image"
5. App saves image to camera roll

### User shares team pokepaste for a team from My Teams
1. User taps hamburger menu for team in My Teams screen
2. User taps "Share pokepaste"
3. App generates a pokepaste for the team
4. Pokepaste is copied to clipboard
5. Display popup notifying the user that the pokepaste has been copied to clipboard

### User views resource report for a slot
1. User long-presses the pokemon field for the slot in the Teambuilder screen while a pokemon is selected
2. User taps "Resource report"
3. Resource report popover appears
4. Report lists any TMs, Held items, ability items, gimmick items, etc. needed to build that pokemon set

### User views resource report for a team (Teambuilder)
1. User taps the hamburger menu for team in the Teambuilder screen
2. User taps "Resource report"
3. A resource report screen appears in a drawer view
4. Report lists any TMs, Held items, ability items, gimmick items, etc. needed to build each pokemon on the team

### User views resource report for a team (My Teams)
1. User taps the hamburger menu for the team in the My Teams screen
2. User taps "Resource report"
3. A resource report screen appears in a drawer view
4. Report lists any TMs, Held items, ability items, gimmick items, etc. needed to build each pokemon on the team

### User duplicates team
1. User taps the hamburger menu for the team in the My Teams screen
2. User taps "Duplicate team"
3. User is taken to Teambuilder screen
4. New team object is created
5. Team objects fields are initialized to the values of the duplicated team
6. Perform team save flow
*CONSIDER: May be best to perform pokemon into slot flow for each pokemon, then copy over the remaining fields*

### User saves pokemon set to bank from Teambuilder
1. User taps the hamburger menu for the slot in the Teambuilder screen
2. User taps "Save to bank"
    - Option disabled if pokemon is not selected for the slot
3. Perform bank save flow

### User selects pokemon for slot from another team
1. User taps the hamburger menu for the slot in the Teambuilder screen
2. User taps "Select from other team"
3. All slots from all teams are retrieved from local DB
4. User is presented with Pokemon Slot view populated with list of all user's slots
    - Display only lists slots with pokemon selected
    - Each slot's fields must be immutable in this view
5. User taps a slot's list item
6. Tapped slot's fields are copied over to current slot
7. User is returned to Teambuilder screen
8. Perform team save flow

### User navigates to Info screen from Teambuilder for Pokemon/Item/Move/Ability
1. User long-presses elements field for the slot while element is selected
2. Context menu for field opens
3. User taps "More details"
4. User is taken to element Info screen for the element

### User selects pokemon for slot from bank
1. User taps the hamburger menu for the slot in the Teambuilder screen
2. User taps "Select from bank"
3. User's bank of pokemon is retrieved from local DB
4. User is presented with Pokemon Slots view populated with pokemon saved to bank
    - Each slot's fields must be immutable in this view
5. User taps a slot's list item
6. Tapped slot's fields are copied over to current slot *copied over rather than referenced to avoid overwriting slot data in bank*
7. User is returned to Teambuilder screen
8. Perform team save flow

### User views bank
1. User taps "Bank"
2. User's bank of slots is retrieved from local DB
3. User is taken to Bank screen, whose main component is Pokemon Slot view populated with pokemon saved to bank

### User creates a set in bank from Bank screen
1. User taps "Bank"
2. User's bank of slots is retrieved from local DB
3. User is taken to Bank screen
4. User taps "+"
5. User is presented with the Pokedex screen in a drawer view
6. User taps a pokemon's list item
7. New slot object is created
8. Slot's pokemon field is set to the selected pokemon
9. Perform pokemon into slot flow
10. User is taken to Set Modification screen with new slot object as slot field
11. User selects other fields for slot, pokemon field may not be cleared
    - Only re-selection of pokemon field is permissible
12. User taps "Save"
13. Perform bank save flow
14. User is returned to Bank screen, slot list is refreshed from local DB so that new slot is viewable
*If user taps "Cancel" or navigates away without saving, return user to Bank screen without performing bank save flow or slot list refresh*

### User edits a set in bank from Bank screen
*NOTE: It would make sense to have the hamburger menu for the main Slot display component to be modular so that we can have different functionality in this context*
1. User taps the hamburger menu for the slot
2. User taps "Edit"
3. User is taken to Set Modification screen with selected slot as slot field
4. User makes any changes desired
5. User taps "Save"
6. Perform bank save flow
7. User is returned to Bank screen, slot list is refreshed from local DB so that new slot is viewable
*If user taps "Cancel" or navigates away without saving, return user to Bank screen without performing bank save flow or slot list refresh*

### User deletes a set from bank from Bank screen
1. User taps the hamburger menu for the slot
2. User taps "Delete"
3. User is presented with confirmation dialogue warning "This cannot be undone"
4. User taps "Delete"
5. Set is immediately removed from local DB
6. App adds the slot deletion to a queue of pending online updates
7. App updates online DB in next batch sync

### User adds or edits notes for a Pokémon slot
1. User is in the Teambuilder or Bank screen
2. User taps the hamburger menu for the slot
3. User taps “Edit Notes”
4. App opens a modal for the Slot Notes screen
5. User types a note (e.g., “This set survives +2 Tera Water Aqua Jet from Azumarill”)
6. User taps “Save”
7. The notes field of the Slot object is updated in memory
8. App performs team or bank save flow
9. User is returned to the Teambuilder or Bank screen

# NOTE: Design decision made here. Pokemon bank display of slots and teambuilder "select from other team" list of slots can be displayed in the same way. All details of a slot should be visible and use the exact same Slot view container that the Teambuilder uses to display slots. Both should have a search bar/filters at the top to allow each search/navigation

# NOTE: Potentially add an "isFavorite" bool to Slot objects that can be used to filter Slots in the Pokemon Slots view. Further, could add a List<String> that holds pre-made Slot tags (e.g. Trick Room, Bulky Support) that could also be used to filter?

### User views a list of Pokemon Slots (Bank, "Select from other team")
1. User taps button to instantiate Pokemon Slot screen
    - Slot screen takes a List<Slot>
2. User is taken to Pokemon Slot screen
3. All slots are displayed in the same Slot view as they are in Teambuilder
    - Pokemon, gimmick selections, moves, item, ability, stats, etc.

### User searches list of all slots in Pokemon Slots view
1. User taps search field at top of list of slots
2. User enters search text
3. Slot list is filtered by pokemon name according to search entry in realtime

### User filters list of all slots in Pokemon Slots view
*Example filter types might include: Type (Fire, Water), Ability, Calculated stat (Speed, Atk) etc.*
1. User taps "filter"
2. User is taken to Filter screen
3. User selects one or more of the pre-made filter options
4. User taps "back"
5. User is returned to Pokemon Slots view
6. Slots list is filtered according to the selected filter options
7. Filter selection is cleared when the user exits the Pokemon Slots view

### User clears all active filters from Pokemon Slots view
1. User taps "filter"
2. User is taken to filter screen
3. User taps "clear filters"
4. All selected filters are disabled
5. User taps "back"
6. User is returned to Pokemon Slots view

### User views speed tier for a pokemon against the format
1. User taps the hamburger menu for the slot with a pokemon selected
2. User taps "Speed Tier"
3. User is taken to Speed Tier screen with selected pokemon as pokemon field
4. Speed Tier screen displays pokemon legal in the format sorted by speed in a drawer view (the thing I've been calling drawer view might be sheet view?)
    - The list includes max speed, neutral speed, and min speed of each pokemon in the format
    - Each list item other than the selected pokemon is color-coded to indicate which of the three options it is
    - The selected pokemon is a different color that stands out amongst the rest
*Should the speeds be calculated each time you open the speed tier screen? That hardly seems prudent. Maybe these things are calculated once and stored in the DB? This leads to a good question: how will I handle balance changes to pokemon? It must be that the online DB also houses the static pokemon DB in its entirety, and accesses to the repository can also check (on some interval?) whether the static DB has changed and download the relevant changes. This type of problem has definitely been solved before, so I just need to find the best approach.*

### User views team breakdown from My Teams screen
1. User taps the hamburger menu for a team
2. User taps "View Breakdown"
3. User is taken to Team Breakdown screen for the team, which is a tab view that displays:
    - Move coverage (Physical/Special/Tera)
    - Team defenses
    - Team offenses
    - Team members
    - Team resource report

### User views usage statistics for pokemon (addendum to pokemon selection)
*Design question: Do I want to provide usage statistics for stat spreads or teras? Is it meaningful, or just a crutch of the community to seek them out? Would people be upset about their absence?*
1. User taps "Most Used" button next to search bar of pokemon
2. List of pokemon is filtered to display the top (150?) most used pokemon in order of usage with usage % displayed next to it
*Stretch goal: Allow users to view most successful duos/trios, and press "Build Around" for them?*

### User views usage statistics for a pokemon's moves (addendum to move selection)
1. User taps "Order by Usage" button next to search bar of moves (only visible when a pokemon is selected for the slot)
2. List of moves is reordered to display the most used moves in order of usage with % displayed next to it

### User views usage statistics for a pokemon's abilities (addendum to ability selection)
1. User taps "Order by Usage" button next to search bar of abilities (only visible when a pokemon is selected for the slot)
2. List of abilities is reordered to display the most used abilities in order of usage with % displayed next to it

### User views usage statistics for a pokemon's item (addendum to item selection)
1. User taps "Order by Usage" button next to search bar of items (only visible when a pokemon is selected for the slot)
2. List of items is reordered to display the most used items in order of usage with % displayed next to it

## Damage Calculation Functions

### User views damage calculator
1. User taps "Damage Calculator"
2. User is taken to Damage Calculator screen
3. Screen is opened to default calculation state *Consider making default top two most used pokemon?*
    - Slot 1 is filled with a default Weezing (with a full set built)
    - Slot 2 is filled with a default Toedscruel (with a full set built)

### User opens damage calculator from pokemon slot hamburger menu
1. User taps slot's hamburger menu
2. User taps "Damage Calculator"
    - Option only present if pokemon field is filled
3. User is taken to Damage Calculator screen
4. Slot 1 of the screen is filled with the given slot
5. User may run any calculations they choose, change fields of the slot within the screen however they wish
6. User may tap "Use this Set":
    - When selecting "Use this Set", user will be prompted to confirm they want to overwrite the data they navigated into the calculator with
    - Depending on where the user navigated from, either perform team save flow (Teambuider) or bank save flow (Bank)
7. Otherwise, when navigating away perform no other operations

*NOTE: I don't like the button labels for this section, but the general idea is here*

### User creates set they want to save in damage calculator flow
*Assume Slot 1 of damage calculator contains a set the User concocted and wants to store for future use*
1. User taps hamburger menu for Slot 1
2. User taps "Save Set"
3. Perform bank save flow for Slot 1

### User selects pokemon in Damage Calculator
1. User taps pokemon field of the slot
2. User is taken to Pokedex screen
3. User optionally uses search/filter functionality to locate desired pokemon
4. User taps a pokemon's list item to select
5. User is returned to Damage Calculator screen
6. Selected pokemon is placed in the slot's pokemon field
7. Clear all move, ability slots
8. Perform pokemon into slot flow

### User selects move for pokemon in Damage Calculator
1. User taps a move field of the slot if empty, long-presses if not
2. User is taken to Movedex screen
    - Screen automatically filters list to only those moves the slot's pokemon can learn
3. User optionally uses search/filter functionality to locate desired move
4. User taps a move's list item to select
5. User is returned to Damage Calculator screen
6. Selected move is placed in the given move field of the slot

### User selects abillity for pokemon in Damage Calculator
1. User taps ability field of the slot
2. User is taken to Abilitydex screen
    - Screen automatically filters list to only those abilities the slot's pokemon can have
3. User optionally uses search/filter functionality to locate desired ability
4. User taps an ability's list item to select
5. User is returned to Damage Calculator screen
6. Selected ability is placed in the ability field of the slot

### User selects item for pokemon in Damage Calculator
1. User taps item field of the slot
    - Only tappable when pokemon's held item can be changed (e.g. not tappable for Dialga Origin Forme)
2. User is taken to Itemdex screen
3. User optionally uses search/filter functionality to locate desired item
4. User taps an item's list item to select
5. User is returned to Damage Calculator screen
6. Selected item is placed in the item field of the slot

### User selects tera type for pokemon in Damage Calculator
1. User long-presses tera type field of the slot
2. Type dropdown appears
3. User taps desired type
4. Slot's tera field is set to chosen type

### User selects status condition for pokemon in Damage Calculator
1. User long-presses status field of the slot *NOTE: Should Damage Calculator wrap a Slot object in another type to add this and similar fields?*
2. Status dropdown appears
3. User taps desired status
4. Slot's status field is set to the chosen type

### User modifies stats for pokemon in Damage Calculator
1. User taps "+" or "-" for stat IV/EV
2. Relevant stat is incremented appropriately (+/- 1 for IV, +/- 4-8 for EV)
3. Update the model in memory
4. Update the UI to reflect the changes

### User selects nature for pokemon in Damage Calculator
1. User taps nature field of the slot
2. Nature dropdown appears
3. User taps desired nature
4. Slot's nature field is set to the chosen nature

### User toggles tera type, dynamax for a pokemon in Damage Calculator
1. User taps elements field of the slot
2. Calculator toggles element activation for that slot
3. UI updates to reflect toggling

### User selects move to calculate with
1. User taps a move field of a slot in the Damage Calculator screen
    - Move must be present
2. Calculator sets attacking move to selected move, attacking Side to that of the selected move's slot
3. Damage calculation is performed between the two slots
4. Result is displayed at the top of the screen as the description of attacker/defender followed by the range of damage possible

### User toggles global battlefield effect
1. User taps the effect field of the Calculator
2. Calculator toggles that effect
3. Calculator performs calculation using updated field state and displays result

### User toggles team effect
1. User taps the effect field of the Side
2. Calculator toggles that effect for that Side
3. Calculator performs calculation using updated field state and displays result

# NOTE TO SELF: Intended use cases of dex screens appear to necessitate some modularity in callback functionality. In swift this can be achieved by defining a protocol, implementing that protocol in the parent, and calling the protocol method in the child view like so:
```
protocol ItemSelectionDelegate: AnyObject { // Conforming to AnyObject allows weak references
    func didSelectItem(item: String)
} 

struct ItemRow: View {
    let itemName: String
    weak var delegate: ItemSelectionDelegate? // Weak reference to avoid retain cycles

    var body: some View {
        Button(action: {
            delegate?.didSelectItem(item: itemName) // Notify the delegate on tap
        }) {
            Text(itemName)
        }
    }
}

struct ParentView: View, ItemSelectionDelegate {
    @State private var items = ["Item A", "Item B", "Item C"]
    @State private var selectedItem: String?

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ItemRow(itemName: item, delegate: self) // Set the parent as the delegate
            }
        }
        Text("Selected: \(selectedItem ?? "None")")
    }

    func didSelectItem(item: String) {
        selectedItem = item
    }
}
```