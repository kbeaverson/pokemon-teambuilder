# Screen Composition
Here, I detail all the screens I've described a need for in my [use cases](docs/ood_process/use_cases.md). The ordering of elements does not reflect the order in which they are to be represented on screen.

## Screens

### Screen: Login
The screen where new users, as well as un-authenticated users, will land when opening the app. 
- App logo
- Email/username text field
- Password text field
- Login button
- Forgot password button
- Register button
- Optional: app version number text

### Screen: Registration
Provides new users a way to register for an account
- Email text field
- Username text field
- Password text field
- Confirm password text field
- Register button

### Screen: Home
The primary landing page/default screen of the app
- Hamburger menu:
    - Account settings button
    - Log out button
- Pokedex button

### Screen: Account
Provides account details, join date, account deletion options. *In the future, may house account customization options as well as social information*
- Widget: User profile information
- Delete account button
    - Widget: Account deletion warning dialogue/confirmation box
- Widget: User stats *(Stretch goal)*
- Change password button
    - Widget: Authentication box *(this flows into the new password widget)*
    - Widget: New password

### Screen: Account recovery
This is where users will arrive when they tap "Forgot Password" from the Login Screen
- Email text field
- Account recovery code text field
- Widget: New password *(Appears after recovery code entered correctly)*

### Screen: Pokedex
This is the screen that provides a list of pokemon objects to the user so that they can explore/discover what they might want to build around
- List of Widget: Pokemon info card
- Search bar
- Filter button

### Screen: Filter
This is the screen type that users will use when they are selecting pre-made filters to sift through lists of pokemon, moves, etc.
- Select filter text
- Grid of filter buttons
- Clear filters button

### Screen: Pokemon details
Provides location for all static game data for a pokemon to be viewable
- Widget: Pokemon info card (BuildAroundBehavior.disabled)
- Widget: Extra pokemon info
- Tab view:
    - Movedex screen filtered to moves learned by the pokemon
    - Abilitydex screen filtered to abilities possible for the pokemon
    - Widget: Type defenses
- Build around button

### Screen: Movedex
This is the screen that provides a list of move objects to the user so that they can explore/discover what they might want to build around
- List of Widget: Move info card
- Search bar
- Filter button

### Screen: Move details
Provides location for all static game data for a move to be viewable
- Widget: Move info card
- Widget: Extra move info
- Pokedex screen filtered to only those pokemon that can learn the move

### Screen: Abilitydex
This is the screen that provides a list of ability objects to the user so that they can explore/discover what they might want to build around
- List of Widget: Ability info card
- Search bar
- Filter button

### Screen: Ability details
Provides location for all static game data for an ability to be viewable
- Widget: Ability info card
- Widget: Extra ability info
- Pokedex screen filtered to only those pokemon that can learn the move

### Screen: Itemdex
This is the screen that provides a list of item objects to the user so that they can explore/discover what they might want to build around
- List of Widget: Item info card
- Search bar
- Filter button

### Screen: Teambuilder
The meat-and-potatoes of the app. This is where users will construct their team and its members Here BuildAroundBehavior=BuildAroundBehavior.disabled for it and all its children
- Team name editable text field
- Reorderable? List of Widget: Slot
- Hamburger menu button
    - Edit team description button
        - Widget: Text description editor
    - Reorder pokemon button
    - Set regulation button
        - Opens drop down of all available regulations
    - Set rental code button
        - Opens editable text field for rental code in popover
    - Share detailed team sheet button
    - Share tournament team sheet button
    - Resource report button
        - Opens Widget: Team resource report in modal sheet
- Ruleset validity indicator icon *(if regulation selected)*

### Screen: My teams
Displays all the users built teams
- Reorderable? List of Widget: Team info card
- Create team button

### Screen: Stats
Displays the current and base stats for a pokemon, as well as providing modification functionality for EVs, IVs, and Nature for a pokemon
- Widget: Pokemon info card (BuildAroundBehavior.disabled)
- Row of Widget: Stat label *(one for each of the slots calculated stats) color code increased and decreased stat*
- Widget: EV modifier container
- Widget: IV modifier container
- Nature button
    - Opens dropdown where Nature can be selected

### Screen: Bank
Displays all the users saved pokemon sets, facilitates CRUD for pokemon within Bank
- Widget: Filterable slot list
- Create set button -> opens Set modification screen with a pokedex modal sheet on top of it

### Screen: Set modification
- Widget: Pokemon field *(clearing disabled)*
- Widget: Tera type field
- Widget: Gigantamax field
- Grid of Widget: Move field
- Widget: Ability field
- Widget: Item field
- Widget: Stat card
- Save button

### Screen: Speed tier
Displays a graph of pokemon filtered to all pokemon legal in the format for the team the pokemon is from (if selected), all pokemon otherwise, along with the list of pokemon passed to this screen. Passed pokemon are set on one color, then for each other pokemon there are three copies displayed: min speed, neutral speed, and max speed. Each is to be displayed on a color coded background, and the graph displays speed stat. Takes two lists of pokemon: team (users pokemon) and format (everything else).
- Fl chart scatter chart or similar of pokemon speeds

### Screen: Team breakdown
Displays detailed breakdown of team offenses, defenses, resources etc. for a given team
- Widget: Team member display
    - Row of Widget: Member miniview
        - Sprite image
        - Ability text
        - Item text
- Tab view
    - Widget: Type defenses
    - Widget: Type offenses
    - Widget: Team resource report

### Screen: Damage calculator
Provides UI to perform damage calculation
### NOTE: Stopped here for the day.

## Widgets

### Widget: Account deletion warning dialogue/confirmation box
- Warning text box
- Password text field
- Confirm delete button
- Cancel delete button

### Widget: Authentication box
- Enter password text
- Password text field
- Confirm button

### Widget: New password
- Password text field
- Confirm password text field
- Confirm new password button
- Cancel button

### Widget: User stats *(Stretch goal)*
- Graph displaying most used pokemon
- Graph displaying most used types

### Widget: User profile information
Provides basic info for a users account
- Username text
- Email text
- Join date text

### Widget: Pokemon info card
Provides overview of pokemon information for presentation in list views
- name text
- sprite image
- Widget: type display
- Row of Widget: labeled stat *(one for each stat, and one for base stat total)*
**Params (listed here because of complexity):**
- Pokemon
- OnTap functionality?
- BuildAroundBehavior: an enum (enabled/disabled) that should be present on each parent widget that has a Pokemon info card child *This is so that the Build Around button is not present from the Teambuilder, or the Bank*
- BuildAroundContext: A custom abstract class that will be extended for FromPokedex, fromMoveDetails, fromAbilityDetails, etc., that will help indicate which type of build around functionality should be executed.
    - FromMoveDetails will require a final Move
    - FromAbilityDetails will require a final Ability
    - FromPokedex will not require anything, just here for clarity
**Context menu (on long-press):**
- Build around button -> navigates to teambuilder with this pokemon in slot 1 (only present when BuildAroundBehavior=BuildAroundBehavior.enabled)
    - Pokemon exclusively if pressing from Pokedex screen
    - Pokemon + move if pressing from Move details screen
    - Pokemon + ability if pressing from Ability details screen

### Widget: Labeled stat
The motivation for making this a widget instead of just placing the information into a single widget as text elements is because stats may be presented at different points throughout the app, so uniformity is ideal. Takes inc/neu/dec enum argument so that stats may be color coded depending on nature.
- stat abbreviation text (e.g. "Atk", "Def", etc.)
- stat value text

### Widget: Type display
This presents a type or pair of types with fixed sizing of type images so mono-type pokemon's type images are the same size as dual-type pokemon
- Type 1 image
- Type 2 image (optional)

### Widget: Type relationship
This displays a type relationship for a pokemon, or a team, or whatever else
- Relationship type text *(e.g. "Resists", "Supereffective", etc.)*
- Grid of Widget: Type display

### Widget: Type defenses
This displays the collection of all damage relationships present for a pokemon, or a team, or whatever else
- List of Widget: Type relationship *(Each relationship is present iff there a type(s) present for them, that is to say that a Fire type pokemon won't list an Immunity relationship, but a Ghost pokemon type will)*

### Widget: Type offenses
Displays the collection of type a team can't hit, as well as which types of moves the team has for which category
- List of widget: Type relationship *(one for each negative relationship that is a non-empty list, e.g. if team can't hit Fairy/Steel for neutral or better damage, display Fairy/Steel in the relevant Type relationship widget)*
- Widget: Move type display *(for physical category)*
- Widget: Move type display *(for special category)*

### Widget: Move type display
Displays the type of moves a team has for a given category
- Category image
- Grid of type icons in color-coded containers

### Widget: Extra pokemon info
This displays some extra pokemon info that isn't presented in the list view
- Pre-evolution text *(if pokemon is pre-evolution)*
- Weight text
- Gender ratio text

### Widget: Move info card
Provides overview of move information for presentation in list views
- Name text
- Widget: Type display
- Category image
- Power text
- Accuracy text
- Priority text
- Description text
- Target(s) text
- Move bool text *(May implement visually as tags)*

### Widget: Extra move info
Provides extra details for a move that isn't present in list view
- Multihit range *(if applicable)*
- Ignores substitute text *(if applicable)*
- Ignores protect text *(if applicable)*

### Widget: Extra ability info
- Blocked by Neutralizing Gas text
- Ignored by ability ignoring effects text

### Widget: Item info card
- Name text
- Sprite image
- Fling power
- Klutz interaction
- Battle effect description

### Widget: Team info card
- Grid of slot sprites
- Team name text
- Team format text *(if present)*
- Team legality indicator *(if illegal)*
- Description dropdown button
    - Toggles description text to widget when tapped
- Hamburger menu button
    - Delete team button
        - Widget: Deletion warning dialogue/confirmation
    - Share detailed team sheet button
    - Share tournament team sheet button
    - Share pokepaste button
    - Resource report button
        - Opens Widget: Team resource report in a modal sheet
    - Duplicate team button

### Widget: Deletion warning dialogue/confirmation
- Warning text
- Delete button
- Cancel button

### Widget: Text description editor
- Description editable text field
- Save button *(checkmark on type right of modal sheet?)*

### Widget: Slot
- Widget: Pokemon field
- Widget: Tera type field
- Widget: Gigantamax field
- Grid of Widget: Move field
- Widget: Ability field
- Widget: Item field
- Widget: Stat card
- Ruleset validity indicator icon *(if regulation selected)*
- Hamburger menu button
    - Clear slot button
    - Share pokepaste button
    - Save to bank button *(disabled if pokemon is not selected)*
    - Select from other team button
    - Select from bank button
    - Edit set button *(only present from bank context)* -> Set modification screen
    - Delete set button *(only present from bank context)*
        - Widget: Deletion dialogue warning/confirmation
    - Edit notes button
        - Opens Widget: Text description editor in modal sheet
    - Speed tier button *(disabled if pokemon is not selected)*
        - Opens Speed tier screen with selected pokemon

### Widget: Move field
Displays a move's most pertinent information. Will be color-coded depending on it's type, with Tera Blast being a hue of normal and the pokemon's selected tera type (if present).
- Name text
- Type icon image
- Learn method icon image *(Level-up, TM, Egg), only present if pokemon is selected*
**Context Menu (on long-press):**
- Remove button -> removes move from slot
- More details button -> Move details screen for this move

### Widget: Pokemon field
Displays a pokemon's pertinent information. Will be color coded depending on it's type(s)
- Name text
- Sprite image
- Type icon image(s)
**Context Menu (on long-press):**
- Remove button -> removes pokemon from slot *(Not present from Set modification screen)*
- Resource report button *(Only present if pokemon is selected)*
    - Opens Widget: Pokemon resource report in a popover
- More details button -> Pokemon details screen for this pokemon

### Widget: Tera type field
Displays the tera type icon in a color coded container that opens a dropdown menu for type when pressed
- Type icon

### Widget: Gigantamax field
Displays the gigantamax status of a pokemon *(present iff dynamax is allowed and pokemon has a gigantamax form)*
- Toggle button
- True/False text
- Gigantamax symbol if true

### Widget: Ability field
Displays the ability info for a slot
- Name text
- Hidden/normal icon image *(present only if pokemon is selected)*
**Context Menu (on long-press):**
- Remove button -> removes ability from slot
- More details button -> Ability details screen for this ability

### Widget: Item field
Displays the item info for a slot
- Name text
- Sprite image
**Context Menu (on long-press):**
- Delete button -> removes item from slot

### Widget: Nature field
Displays the nature for a slot
- Name text *(Default docile)*

### Widget: Stat card
Displays all stats and the nature for a slot. Tappable when a pokemon is selected, navigates to Stats screen.
- Widget: Nature field
- Grid of: *(for each stat)*
    - EV *(0 for slot without selected pokemon)*
    - IV *(0 for slot without selected pokemon)*
    - Labeled stat *(0 for slot without selected pokemon)*

### Widget: EV modifier container
Displays all EVs with modification interface
- List of Widget: EV modifier editor *(one for each stat)*

### Widget: IV modifier container
Displays all IVs with modification interface
- List of Widget: IV modifier editor *(one for each stat)*

### Widget: EV modifier editor
Displays a single EV modifier, the EVs current value, and provides an adjustment interface
- Name of EV text
- Value of EV modifier text
- Increment button
- Decrement button

### Widget: IV modifier editor
Displays a single IV modifier, the IVs current value, and provides an adjustment interface
- Name of IV text
- Value of IV modifier text
- Increment button
- Decrement button

### Widget: Team resource report
Displays the resources necessary to produce this team in game
- List of Widget: Pokemon resource report *(one for each selected pokemon)*

### Widget: Pokemon resource report
Displays the resources necessary to produce this pokemon in game
- Name of pokemon text
- Pokemon sprite image
- List of Widget: Resource

### Widget: Resource
Displaces a single resource and its quantity
- Name of resource
- Type of resource sprite *(TM, Ability Capsule, Ability Patch, Tera Shard, etc.)*
- Quantity of resource
*I'm picturing "<TM sprite> Overheat x 1" or similar*

### Widget: Filterable slot list
Shows list of slots in immutable state, for use in bank or when selecting sets from another team
- List of Widget: Slot *(immutable in this context)*
- Search bar
- Filter button *(for use with set tags, stretch goal)*