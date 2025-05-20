import 'package:flutter/material.dart';

// Custom Theme Extension for advanced theming
@immutable
class PremiumTheme extends ThemeExtension<PremiumTheme> {
  final Color background;
  final Color card;
  final Color accent;
  final Color glassBackground;
  final Gradient mainGradient;

  const PremiumTheme({
    required this.background,
    required this.card,
    required this.accent,
    required this.glassBackground,
    required this.mainGradient,
  });

  @override
  PremiumTheme copyWith({
    Color? background,
    Color? card,
    Color? accent,
    Color? glassBackground,
    Gradient? mainGradient,
  }) {
    return PremiumTheme(
      background: background ?? this.background,
      card: card ?? this.card,
      accent: accent ?? this.accent,
      glassBackground: glassBackground ?? this.glassBackground,
      mainGradient: mainGradient ?? this.mainGradient,
    );
  }

  @override
  PremiumTheme lerp(ThemeExtension<PremiumTheme>? other, double t) {
    if (other is! PremiumTheme) return this;
    return PremiumTheme(
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      glassBackground: Color.lerp(glassBackground, other.glassBackground, t)!,
      mainGradient: LinearGradient(
        colors: [
          Color.lerp(
            (mainGradient as LinearGradient).colors[0],
            (other.mainGradient as LinearGradient).colors[0],
            t,
          )!,
          Color.lerp(
            (mainGradient as LinearGradient).colors[1],
            (other.mainGradient as LinearGradient).colors[1],
            t,
          )!,
        ],
      ),
    );
  }
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Sofia Sans',
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColor: const Color(0xFF313131),
      cardColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF313131)),
        titleTextStyle: TextStyle(
          color: Color(0xFF313131),
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Sofia Sans',
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF313131),
        secondary: const Color(0xFFD9E1FF),
        surface: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF313131),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF7F6F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF313131),
          fontFamily: 'Sofia Sans',
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF313131),
          fontFamily: 'Sofia Sans',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFF313131),
          fontFamily: 'Sofia Sans',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF8F9BB3),
          fontFamily: 'Sofia Sans',
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Sofia Sans',
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        const PremiumTheme(
          background: Color(0xFFFFFFFF),
          card: Colors.white,
          accent: Color(0xFF313131),
          glassBackground: Color(0xF2F7F6F9),
          mainGradient: LinearGradient(
            colors: [Color(0xFFD9E1FF), Color(0xFFF7F6F9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Sofia Sans',
      scaffoldBackgroundColor: const Color(0xFF313131),
      primaryColor: const Color(0xFF313131),
      cardColor: const Color(0xFF23262F),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Sofia Sans',
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF313131),
        secondary: const Color(0xFFD9E1FF),
        surface: const Color(0xFF23262F),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF313131),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF23262F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Sofia Sans',
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Sofia Sans',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'Sofia Sans',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF8F9BB3),
          fontFamily: 'Sofia Sans',
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Sofia Sans',
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        const PremiumTheme(
          background: Color(0xFF313131),
          card: Color(0xFF23262F),
          accent: Color(0xFFD9E1FF),
          glassBackground: Color(0xB31A1A2E),
          mainGradient: LinearGradient(
            colors: [Color(0xFF313131), Color(0xFFD9E1FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}
