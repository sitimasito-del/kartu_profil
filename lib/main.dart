
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087EA4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F7FC),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color navyBlue = Color(0xFF123B5D);
  static const Color oceanBlue = Color(0xFF087EA4);
  static const Color lightBlue = Color(0xFFE3F3FC);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final isWide = screen.width > 600;
    final isCompact = screen.height < 750;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        title: const Text(
          'Kartu Profil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: navyBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 20 : 12,
            vertical: isCompact ? 8 : 14,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1050),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 5,
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HEADER
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isCompact ? 10 : 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [navyBlue, oceanBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person_pin,
                          size: isCompact ? 25 : 32,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'MY PROFILE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Kenali saya lebih dekat',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(isCompact ? 16 : 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // RESPONSIVE PROFILE
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildProfilePhoto(isCompact),
                              const SizedBox(width: 24),
                              Expanded(
                                child: buildProfileInfo(isCompact),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              Center(
                                child: buildProfilePhoto(isCompact),
                              ),
                              const SizedBox(height: 20),
                              buildProfileInfo(isCompact),
                            ],
                          ),

                        SizedBox(height: isCompact ? 14 : 22),
                        const Divider(color: Color(0xFFE0EAF0)),
                        SizedBox(height: isCompact ? 10 : 16),

                        const Text(
                          'Keahlian',
                          style: TextStyle(
                            color: navyBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // CHIP KEAHLIAN
                        Wrap(
                          spacing: 8,
                          runSpacing: 2,
                          children: [
                            buildSkillChip(
                              Icons.description_outlined,
                              'Microsoft Word',
                            ),
                            buildSkillChip(
                              Icons.table_chart_outlined,
                              'Microsoft Excel',
                            ),
                            buildSkillChip(
                              Icons.mic_none,
                              'MC Formal',
                            ),
                            buildSkillChip(
                              Icons.groups_outlined,
                              'Kerja Tim',
                            ),
                            buildSkillChip(
                              Icons.code,
                              'Flutter Dasar',
                            ),
                          ],
                        ),

                        SizedBox(height: isCompact ? 12 : 20),

                        // KONTAK
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            isCompact ? 12 : 16,
                          ),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hubungi Saya',
                                style: TextStyle(
                                  color: navyBlue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildContactIcon(
                                    Icons.email_outlined,
                                    'Email',
                                  ),
                                  buildContactIcon(
                                    Icons.phone_outlined,
                                    'Telepon',
                                  ),
                                  buildContactIcon(
                                    Icons.code,
                                    'GitHub',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // FOOTER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(9),
                    color: const Color(0xFFF6FAFD),
                    child: const Text(
                      'Mobile Programming • Flutter UI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF607D8B),
                        fontSize: 11,
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

  // FOTO PROFIL + STACK + POSITIONED
  Widget buildProfilePhoto(bool isCompact) {
    final double photoSize = isCompact ? 112 : 140;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: oceanBlue,
              width: 3,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/foto_profil.jpg',
              width: photoSize,
              height: photoSize,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: photoSize,
                  height: photoSize,
                  color: lightBlue,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: oceanBlue,
                  ),
                );
              },
            ),
          ),
        ),

        // BADGE AVAILABLE
        Positioned(
          bottom: 5,
          right: -8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF16865B),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 12,
                  color: Colors.white,
                ),
                SizedBox(width: 4),
                Text(
                  'Available',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // INFORMASI PROFIL
  Widget buildProfileInfo(bool isCompact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Siti Masito',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: navyBlue,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Mahasiswa Sistem Informasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: oceanBlue,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: isCompact ? 10 : 14),
        const Text(
          'Mahasiswa Sistem Informasi di Unipdu Jombang '
          'yang tertarik mempelajari teknologi, pengembangan '
          'aplikasi, dan desain antarmuka. Senang belajar '
          'hal baru serta bekerja sama dalam tim.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF607080),
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // CHIP SKILL
  Widget buildSkillChip(IconData icon, String label) {
    return Chip(
      visualDensity: VisualDensity.compact,
      avatar: Icon(
        icon,
        size: 17,
        color: oceanBlue,
      ),
      label: Text(label),
      backgroundColor: lightBlue,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: const TextStyle(
        color: navyBlue,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  // IKON KONTAK
  Widget buildContactIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: oceanBlue,
            size: 23,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: navyBlue,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}