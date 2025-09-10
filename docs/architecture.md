# App Architecture – Pokémon Teambuilder (2025 Rebuild)

This document outlines the architecture and modular design of the Pokémon Teambuilder app. It will evolve alongside the project to reflect changes in structure and responsibilities.

---

## Architecture Pattern

The app follows the **MVVM (Model-View-ViewModel)** pattern for a clean separation of concerns:
- UI Layer (Widgets)
- ViewModel Layer (State + Logic)
- Repository Layer (Data Management)
- Data Layer (Static game data, local storage, network)

---

## Module Breakdown

| Module         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| `lib/ui/`      | All UI components and screens (views)                    |
| `lib/viewmodel/` | ViewModels for state management and business logic     |
| `lib/model/`   | Core domain models (e.g., `Pokemon`, `Move`, `Team`)     |
| `lib/repository/` | Interfaces between viewmodels and data sources        |
| `lib/utils/`   | Helpers, formatters, constants                           |

---

## Data Flow Example

1. **User** interacts with UI
2. **ViewModel** receives event and updates state
3. **Repository** fetches or saves data
4. **UI** reacts to state change via `ChangeNotifier`, `Riverpod`, or similar

---

## Data Source Strategy

- **Static JSON files** for initial game data (Pokémon, moves, abilities, items)
- **Local storage** for saved teams (likely using `sqflite` package)
- **Cloud backend** (planned) for syncing teams, user data, and game data updates

---

## Testing Strategy

| Test Type       | Targets                          |
|------------------|----------------------------------|
| Unit Tests       | Models, ViewModels, Utilities    |
| Widget Tests     | Individual screens and widgets   |
| Integration Tests| Team flows, data persistence     |

---

## Notes

- Pokemon Champions is on the horizon and is already modifying a fundamental component of damage calculation, so modularity in calculator design needs to be very thorough

---

_Last updated: 2025-09-10_
