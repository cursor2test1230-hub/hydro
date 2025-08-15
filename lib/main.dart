import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF00B4D8));
    return MaterialApp(
      title: 'Hydro Monitor',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: colorScheme.surface,
      ),
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    // Mock values for now. Wire these to real data later.
    const String waterLevel = '72%';
    const String nutrientsLevel = '480 ppm';
    const String phLevel = '6.5';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hydro Monitor',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              // Three modern cards (boxes)
              Row(
                children: [
                  Expanded(
                    child: LevelBox(
                      label: 'Water',
                      icon: Icons.water_drop,
                      startColor: const Color(0xFF00B4D8),
                      endColor: const Color(0xFF48CAE4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LevelBox(
                      label: 'Nutrients',
                      icon: Icons.biotech,
                      startColor: const Color(0xFF80ED99),
                      endColor: const Color(0xFF57CC99),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LevelBox(
                      label: 'pH',
                      icon: Icons.speed,
                      startColor: const Color(0xFFFFAFCC),
                      endColor: const Color(0xFFFFC8DD),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Text(
                'Results',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              ResultTile(
                label: 'Water level',
                value: waterLevel,
                color: const Color(0xFF00B4D8),
                icon: Icons.water_drop,
              ),
              const SizedBox(height: 10),
              ResultTile(
                label: 'Nutrients level',
                value: nutrientsLevel,
                color: const Color(0xFF57CC99),
                icon: Icons.biotech,
              ),
              const SizedBox(height: 10),
              ResultTile(
                label: 'pH level',
                value: phLevel,
                color: const Color(0xFFFFAFCC),
                icon: Icons.speed,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color startColor;
  final Color endColor;

  const LevelBox({
    super.key,
    required this.label,
    required this.icon,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(
              icon,
              size: 96,
              color: Colors.white.withValues(alpha: 0.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.white, size: 28),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const ResultTile({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: scheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
