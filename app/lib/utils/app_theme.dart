import 'package:flutter/material.dart';

final ColorScheme pokemonDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  // Deep, muted blue for trust and focus (primary CTAs, active states)
  primary: const Color.fromARGB(255, 16, 59, 94), // Deep Cerulean
  onPrimary: Colors.white,
  // Teal/cyan for data accents (charts, highlights)
  secondary: const Color(0xFF2AB7C5), // Teal Cyan
  onSecondary: Colors.black,
  // Muted error that still reads clearly on dark backgrounds
  error: const Color(0xFFD9534F), // Muted Red
  onError: Colors.white,
  // Very dark slate background to reduce visual noise
  surface: const Color(0xFF0B1220), // Near-black slate
  surfaceContainer: Color.fromARGB(255, 26, 26, 26),// Slightly lighter surface for cards/containers
  // Slightly cool off-white for high contrast readable text
  onSurface: const Color(0xFFE6EEF6), // Blue-gray text
  // Slightly lighter elevated surfaces
  surfaceContainerHighest: const Color(0xFF121826), // Elevated surface
  onSurfaceVariant: Colors.white70, // softer text/icons
  // Subtle slate for outlines and dividers
  outline: const Color(0xFF22303A), // dividers, outlines
  shadow: Colors.black,
  scrim: Colors.black54,
  // Muted green for success/positive states (not loud)
  tertiary: const Color(0xFF9AD66A), // Muted Green
  onTertiary: Colors.black,
);

final ColorScheme pokemonLightScheme = ColorScheme(
  brightness: Brightness.light,
  // Strong but grounded blue for primary actions
  primary: const Color(0xFF20558B), // Deep Blue
  onPrimary: Colors.white,
  // Teal accent to echo data visualization accents
  secondary: const Color(0xFF0F9D9A), // Teal
  onSecondary: Colors.white,
  error: const Color(0xFFD9534F), // Muted Red
  onError: Colors.white,
  // Soft, slightly cool background to reduce glare
  surface: const Color(0xFFF6F8FA), // Very light neutral
  surfaceContainer: const Color.fromARGB(255, 239, 246, 255),// Slightly lighter surface for cards/containers
  onSurface: const Color(0xFF0B1220), // Deep slate for text
  surfaceContainerHighest: const Color.fromARGB(255, 255, 255, 255), // Cards/containers
  onSurfaceVariant: const Color(0xFF495E6B), // Secondary text/icons
  outline: const Color(0xFFE1E7EB), // Subtle borders, dividers
  shadow: Colors.black12,
  scrim: Colors.black38,
  tertiary: const Color(0xFF4CAF50), // Success green (calm)
  onTertiary: Colors.white,
);

final ThemeData pokemonDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: pokemonDarkScheme,

  // General text styling — reference the scheme for consistent contrast
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: pokemonDarkScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: pokemonDarkScheme.onSurface,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: pokemonDarkScheme.onSurface, // readable blue-gray
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: pokemonDarkScheme.onSurface,
    ),
  ),

  // Elevated buttons = your CTAs (blue primary)
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: pokemonDarkScheme.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),

  // Input fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: pokemonDarkScheme.surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),

  // AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: pokemonDarkScheme.primary,
    foregroundColor: pokemonDarkScheme.onPrimary,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: pokemonDarkScheme.onPrimary,
    ),
  ),

  // Cards (great for Pokémon containers)
  cardTheme: CardThemeData(
    color: pokemonDarkScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 3,
    margin: const EdgeInsets.all(8),
  ),
);

final ThemeData pokemonLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: pokemonLightScheme,

  // General text styling — use the scheme values for correct contrast
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: pokemonLightScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: pokemonLightScheme.onSurface,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: pokemonLightScheme.onSurface, // dark text for readability
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: pokemonLightScheme.onSurface,
    ),
  ),

  // Elevated buttons = your CTAs (blue primary)
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: pokemonLightScheme.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),

  // Input fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: pokemonLightScheme.surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),

  // AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: pokemonLightScheme.primary,
    foregroundColor: pokemonLightScheme.onPrimary,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: pokemonLightScheme.onPrimary,
    ),
  ),

  // Cards (great for Pokémon containers)
  cardTheme: CardThemeData(
    color: pokemonLightScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 3,
    margin: const EdgeInsets.all(8),
  ),
);
