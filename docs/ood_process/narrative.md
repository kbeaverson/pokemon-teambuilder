# Narrative

Competitive Pokemon battling (VGC) is an activity in which individuals strategize, design, build, and battle teams of pokemon. The teambuilding process includes identifying which 6 (currently?) unique pokemon to use, and then what sets of moves, items, abilities, stats (EVs, IVs, nature), and extras (generational gimmick e.g. tera-type) a pokemon should have. Each of these decisions is informed by the current state of the metagame, the stats/movepools/abilitypools of a given pokemon, and other strategic needs of a team. The pokemon that are available to choose from vary dependent on the game and ruleset that is currently active. Cooperation is also a major component of the teambuilding process, as games are played in a one-on-one style between two players, working with a group allows for more test games to be run for any particular strategy and so is one of the most common techniques for strategic development used at the highest levels of play. Teambuilding is often an iterative process, with players designing, testing, redesigning, and retesting, before finally putting it to the test in the real world, whether that be via the in-game ladder, or online/in-person tournaments. The testing process is usually done via the in-game ladder or battle simulators like Pokemon Showdown. Pokemon showdown matches mimic the in-game battle mechanics exactly while removing the fluff of animations/matchmaking, as well as removing the actual build-cost of time and resources when battling teams. Players can save replays to track the exact play-by-play information of their matches to assess their overall performance. Players analyze the metagame using usage statistics pulled from sites like Pokemon Showdown, Limitless VGC, Pikalytics, MausLabs, etc. 
A match in a pokemon tournament is typically a Bo3 games/open team sheet match between two players. At the start of the first game, the two players exchange "team sheets" that present the publicly available information about a team (this currently includes which pokemon are on the team, their moves, items, tera-types, and abilities). Players then select 4 of their 6 pokemon to use in a double battle (2v2) in which the first player to KO their opponents 4 pokemon wins. Players also commonly share their teams with others via a format called PokePaste.

The pokemon teambuilder app aims to facilitate the strategic development and design of competitive pokemon teams by providing a cross-platform mobile application that meets all the needs of a competitive pokemon player. Players will be able to view all the static game data with regards to pokemon, items, moves, and abilities. They will be able to view the current usage statistics of different pokemon as well as those pokemons movesets, held items, etc. Players will be able to select which ruleset they are building for, and this will filter the pokemon presented to them during the teambuilding process appropriately. The ruleset selection will also provide relevant information/fields to the player with respect to the generational gimmick that may or may not be allowed.
Players will be able to share the teams they are working on with others through the use of unique codes, as well as a generated "team sheet" image, that displays team information. The images generated can be produced in either Open mode or Tournament mode. Open mode will produce an image with all the hidden stat information. Tournament mode will produce an image that includes only that information which is presented on the players team sheet that is exchanged at the beginning of a match in a Bo3 Open Team Sheet tournament. They will also have the option to generate PokePaste formatted text to share it the traditional way.
As damage calculation strongly influences stat distributions for individual pokemon, a damage calculator will be provided to the user. The damage calculator will be functionally identical to the nerd-of-now damage calculator to begin with, while a doubles damage calculator will be considered later. 
Teams require in-game resources to build, from time to hatch eggs, to tm material, to in-game currency, and so users will be provided with resource reports that detail all that will be required to build each individual pokemon as well as the team as a whole. Additionally, user customized pokemon can be saved to a personal bank of pokemon that may be named and re-used in future teams. 
STRETCH - The teambuilding process regularly involves identifying a need for a particular move/type or ability before identifying the specific pokemon that will be needed, so users will be provided with the option to develop a "wish list" of moves, items, abilities that will be tracked as the team is built to give visual insight into the well-rounded-ness of the team.
STRETCH - Further, users will be provided with visual indicators for when a pokemon type combination cannot be hit for neutral or better by members of the team, to act as a sort of "blind spot" indicator (represented by the most used pokemon of that typing?)
STRETCH - Auto stat: Users often design stat spreads of pokemon with particular matchups in mind, so they will be provided with the option to enter the pokemon (w/ spread) they would like to beat, then auto-generate the IV/EV combination that achieves that result.
STRETCH - Display the season leaderboard for the Play! Pokemon season so that users stay up to date on player standings
STRETCH - Discovering and playtesting the teams of others is a great way for players to develop their game knowledge as well as broaden their strategic horizon. The app will already allow players to share their teams via code or image, but the app will also provide a social discoverability feature where players can post the teams they have designed with a write-up for others to view and engage with

## Candidate Classes

- Pokemon
- Team
- Ability
- Move
- Held item
- Stat (pokemon)
- EV
- IV
- Nature
- Calculator
- Ruleset
- Stat (usage)
- Resource report
- Team Sheet
- Player (user)
- Bank of pokemon

## Candidate Responsibilities

- Select (pokemon, item, move, ability, team, ruleset)
- Display list (pokemon, item, move, ability, team, ruleset)
- Generate/Share team image
- Generate/Share team code
- Generate/Share team pokepaste
- Calculate damage
- CRUD team
- CRUD pokemon in users bank
- Nickname pokemon
- Filter list of pokemon