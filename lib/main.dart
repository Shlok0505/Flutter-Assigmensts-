import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

/// Custom App Color Palette (Vibrant Indian Spidey Theme)
class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFFE11D48); // Spidey Crimson / Rose
  static const Color primaryLight = Color(0xFFFB7185);
  static const Color primaryDark = Color(0xFF9F1239);
  static const Color secondary = Color(0xFF0284C7); // Electric Web Blue
  static const Color accent = Color(0xFFF59E0B); // Mumbai Saffron / Amber
  static const Color success = Color(0xFF10B981); // Emerald

  // Dark Theme Palette
  static const Color darkBackground = Color(0xFF0B0F19);
  static const Color darkCardBackground = Color(0xFF161E2E);
  static const Color darkSurface = Color(0xFF1F293D);
  static const Color darkBorder = Color(0xFF2E3A52);
  static const Color darkTextPrimary = Color(0xFFF9FAFB);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);

  // Light Theme Palette
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFEFF6FF);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);
}

class ProfileApp extends StatefulWidget {
  const ProfileApp({super.key});

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spidey Profile Card',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.lightCardBackground,
          onPrimary: Colors.white,
          onSurface: AppColors.lightTextPrimary,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryLight,
          secondary: AppColors.secondary,
          surface: AppColors.darkCardBackground,
          onPrimary: Colors.white,
          onSurface: AppColors.darkTextPrimary,
        ),
        useMaterial3: true,
      ),
      home: ProfileScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;
  int _followersCount = 5480;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followersCount += _isFollowing ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    final cardBg = isDark ? AppColors.darkCardBackground : AppColors.lightCardBackground;
    final surfaceBg = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final borderCol = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Hero Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            tooltip: 'Toggle Theme',
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: isDark ? AppColors.accent : AppColors.primary,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Container(
              // Profile Card Container with border and shadow
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: borderCol, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.4)
                        : AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Gradient Banner Container
                  Container(
                    height: 110,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primaryDark,
                          AppColors.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Spidey Badge Container
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.flash_on_rounded, color: AppColors.accent, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  'INDIAN SPIDER-MAN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Share Icon Button Container
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.3),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.share_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Avatar & Header Section
                  Transform.translate(
                    offset: const Offset(0, -50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // CircleAvatar with double ring Container
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [AppColors.primary, AppColors.secondary],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.4),
                                  blurRadius: 18,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: cardBg,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 46,
                                backgroundColor: AppColors.primaryLight,
                                child: CircleAvatar(
                                  radius: 44,
                                  backgroundColor: AppColors.primaryDark,
                                  backgroundImage: const NetworkImage(
                                    'https://images.unsplash.com/photo-1635863138275-d9b33299680b?auto=format&fit=crop&w=300&q=80',
                                  ),
                                  onBackgroundImageError: (exception, stackTrace) {},
                                  child: const Icon(Icons.pest_control_rounded, size: 44, color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Name and Verified Icon Row
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  'Shlok Kamble (Spidey)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: textPrimary,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.verified_rounded,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          // Designation / Role Text
                          Text(
                            'Senior Flutter Web-Slinger & Mobile Architect',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Location Row (Navi Mumbai, Maharashtra, India)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  'Navi Mumbai, Maharashtra, India 🇮🇳',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: textSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Bio Text
                          Text(
                            'Your friendly neighborhood Flutter developer from Navi Mumbai! Slinging responsive cross-platform apps, blazing-fast UI animations, and clean architecture across the Spider-Verse.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.5,
                              height: 1.45,
                              color: textSecondary,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Stats Section (Row with multiple Columns)
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                            decoration: BoxDecoration(
                              color: surfaceBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: borderCol),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildStatColumn('Web Apps', '52', Icons.code_rounded, textPrimary, textSecondary),
                                Container(height: 32, width: 1, color: borderCol),
                                _buildStatColumn('Followers', '$_followersCount', Icons.people_alt_rounded, textPrimary, textSecondary),
                                Container(height: 32, width: 1, color: borderCol),
                                _buildStatColumn('Hero Rating', '5.0 ★', Icons.star_rounded, textPrimary, textSecondary),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Skills Pill Chips Row
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: [
                              _buildSkillBadge('Flutter & Dart', isDark),
                              _buildSkillBadge('Web-Slinging UI', isDark),
                              _buildSkillBadge('Bloc & Riverpod', isDark),
                              _buildSkillBadge('Spider-Sense Debugging', isDark),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Contact Info List (Column of Rows)
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: surfaceBg.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: borderCol),
                            ),
                            child: Column(
                              children: [
                                _buildContactRow(
                                  Icons.mail_outline_rounded,
                                  'shlok.kamble@mumbaitech.in',
                                  textPrimary,
                                  textSecondary,
                                ),
                                const SizedBox(height: 10),
                                _buildContactRow(
                                  Icons.link_rounded,
                                  'github.com/shlokkamble',
                                  textPrimary,
                                  textSecondary,
                                ),
                                const SizedBox(height: 10),
                                _buildContactRow(
                                  Icons.near_me_rounded,
                                  'Sector 15, Vashi, Navi Mumbai, MH',
                                  textPrimary,
                                  textSecondary,
                                  badgeColor: AppColors.secondary,
                                ),
                                const SizedBox(height: 10),
                                _buildContactRow(
                                  Icons.shield_outlined,
                                  'Ready for High-Priority Missions',
                                  textPrimary,
                                  textSecondary,
                                  badgeColor: AppColors.success,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 22),

                          // Action Buttons Row (Follow & Message)
                          Row(
                            children: [
                              // Follow Button
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: _toggleFollow,
                                  borderRadius: BorderRadius.circular(14),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                                    decoration: BoxDecoration(
                                      gradient: _isFollowing
                                          ? null
                                          : const LinearGradient(
                                              colors: [AppColors.primary, AppColors.primaryDark],
                                            ),
                                      color: _isFollowing ? surfaceBg : null,
                                      borderRadius: BorderRadius.circular(14),
                                      border: _isFollowing
                                          ? Border.all(color: AppColors.primary, width: 1.5)
                                          : null,
                                      boxShadow: _isFollowing
                                          ? []
                                          : [
                                              BoxShadow(
                                                color: AppColors.primary.withValues(alpha: 0.35),
                                                blurRadius: 10,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _isFollowing
                                              ? Icons.check_rounded
                                              : Icons.person_add_alt_1_rounded,
                                          color: _isFollowing
                                              ? (isDark ? AppColors.primaryLight : AppColors.primary)
                                              : Colors.white,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 6),
                                        Flexible(
                                          child: Text(
                                            _isFollowing ? 'Patrolling' : 'Follow Spidey',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w700,
                                              color: _isFollowing
                                                ? (isDark ? AppColors.primaryLight : AppColors.primary)
                                                : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Message Button
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Row(
                                          children: [
                                            Icon(Icons.send_rounded, color: Colors.white, size: 18),
                                            SizedBox(width: 8),
                                            Text('Shooting web message to Shlok...'),
                                          ],
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.primaryDark,
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(14),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: surfaceBg,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: borderCol, width: 1.2),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.chat_bubble_outline_rounded,
                                          color: textPrimary,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Message',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for Stat Columns
  Widget _buildStatColumn(
    String label,
    String count,
    IconData icon,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: AppColors.accent),
            const SizedBox(width: 4),
            Text(
              count,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textSecondary,
          ),
        ),
      ],
    );
  }

  // Helper widget for Skill Badges
  Widget _buildSkillBadge(String skill, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.primary.withValues(alpha: 0.15)
            : AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? AppColors.primaryLight.withValues(alpha: 0.3)
              : AppColors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.tag_rounded,
            size: 13,
            color: AppColors.primaryLight,
          ),
          const SizedBox(width: 4),
          Text(
            skill,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.primaryLight : AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for Contact items
  Widget _buildContactRow(
    IconData icon,
    String text,
    Color textPrimary,
    Color textSecondary, {
    Color? badgeColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: (badgeColor ?? AppColors.primary).withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 16,
            color: badgeColor ?? textSecondary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: badgeColor ?? textPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
