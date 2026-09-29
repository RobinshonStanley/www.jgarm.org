import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class JgarmColors {
  static const Color lightBlue = Color(0xFFA5CEEE);
  static const Color pink = Color(0xFFCC5F90);
  static const Color darkBlue = Color(0xFF315D7D);
  static const Color darkPink = Color(0xFFA84770);
  static const Color paleBlue = Color(0xFFF3F9FD);
  static const Color veryLightBlue = Color(0xFFEAF5FC);
  static const Color white = Colors.white;
}

void main() {
  runApp(const JgarmWebsite());
}

class JgarmWebsite extends StatelessWidget {
  const JgarmWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JGARM CHURCH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: JgarmColors.lightBlue,
        ),
      ),
      home: const JgarmHomePage(),
    );
  }
}

class JgarmHomePage extends StatefulWidget {
  const JgarmHomePage({super.key});

  @override
  State<JgarmHomePage> createState() => _JgarmHomePageState();
}

class _JgarmHomePageState extends State<JgarmHomePage> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    'Home',
    'About'
    'Leadership',
    'Ministries',
    'Services',
    'Sermons',
    'Events',
    'Prayer',
    'GHCC',
    'Give',
    'Contact',
    'Get Involved',
  ];

  final List<Map<String, String>> leadership = [
    {
      'name': 'Bishop Robinshon Onyango Stanley',
      'position': 'Founder, Vision Bearer & Chairman',
      'photo': 'assets/chairman_photo.jpg',
      'message':
          'Our vision is to make as many disciples as possible, preaching the Gospel of Jesus Christ and bringing hope, restoration, and transformation to lives.',
    },
    {
      'name': 'Richard Orina Oyungu',
      'position': 'Assistant Chairperson & Kisii Regional Overseer',
      'photo': 'assets/asschair_photo.jpg',
      'message':
          'Let us stand together in unity, serve faithfully, and strengthen the work of God in every community entrusted to us.',
    },
    {
      'name': 'Lilian Onyango',
      'position': 'Women Leader',
      'photo': 'assets/womenleader_photo.jpg',
      'message':
          'Women of God, let us rise in faith, prayer, love, and service, nurturing families and raising a generation that honours Christ.',
    },
    {
      'name': 'Maureen Adhiambo',
      'position': 'Treasurer',
      'photo': 'assets/treasurer_photo.jpg',
      'message':
          'Let us be faithful stewards of every resource God provides, serving with honesty, transparency, and a heart of generosity.',
    },
    {
      'name': 'Pastor John Obote',
      'position': 'Secretary',
      'photo': 'assets/secretary_photo.jpg',
      'message':
          'Let everything be done decently and in order, with faithfulness, wisdom, and commitment to the mission of Christ.',
    },
    {
      'name': 'Rolex Odhiambo',
      'position': 'Instruments Department Leader',
      'photo': 'assets/instrumentleader_photo.jpg',
      'message':
          'Let every instrument and every sound glorify God, lead His people into worship, and proclaim the goodness of Jesus Christ.',
    },
    {
      'name': "Pastor Tobias K'agolla",
      'position': 'JGARM Coordinator',
      'photo': 'assets/coordinator_photo.jpg',
      'message':
          'Together, let us coordinate our efforts in love and unity, ensuring that the vision of JGARM reaches every soul and community.',
    },
  ];

  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildPage(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 10,
      title: Row(
        children: [
          Image.asset(
            'assets/jgarmchurch_logo.jpg',
            height: 52,
            width: 52,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.church,
                size: 45,
                color: JgarmColors.pink,
              );
            },
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'JGARM CHURCH',
                  style: TextStyle(
                    color: JgarmColors.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'The Fire of the Gospel Ablaze',
                  style: TextStyle(
                    color: JgarmColors.pink,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.width < 900) {
              return const SizedBox.shrink();
            }

            return Row(
              children: List.generate(
                menuItems.length,
                (index) => TextButton(
                  onPressed: () => _selectPage(index),
                  child: Text(
                    menuItems[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? JgarmColors.pink
                          : JgarmColors.darkBlue,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    JgarmColors.lightBlue,
                    JgarmColors.veryLightBlue,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/jgarmchurch_logo.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.church,
                        size: 80,
                        color: JgarmColors.pink,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'JGARM CHURCH',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: JgarmColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'The Fire of the Gospel Ablaze',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: JgarmColors.pink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      _menuIcon(index),
                      color: selectedIndex == index
                          ? JgarmColors.pink
                          : JgarmColors.darkBlue,
                    ),
                    title: Text(
                      menuItems[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? JgarmColors.pink
                            : JgarmColors.darkBlue,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    selected: selectedIndex == index,
                    onTap: () {
                      _selectPage(index);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _menuIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.info_outline;
      case 2:
        return Icons.groups;
      case 3:
        return Icons.church;
      case 4:
        return Icons.menu_book;
      case 5:
        return Icons.event;
      case 6:
        return Icons.volunteer_activism;
      case 7:
        return Icons.child_care;
      case 8:
        return Icons.favorite;
      case 9:
        return Icons.contact_mail;
      case 10:
        return Icons.handshake;
      default:
        return Icons.circle;
    }
  }

  Widget _buildPage() {
    switch (selectedIndex) {
      case 0:
        return _homePage();
      case 1:
        return _aboutPage();
      case 2:
        return _ministriesPage();
      case 3:
        return _servicesPage();
      case 4:
        return _sermonsPage();
      case 5:
        return _eventsPage();
      case 6:
        return _prayerPage();
      case 7:
        return _ghccPage();
      case 8:
        return _givePage();
      case 9:
        return _contactPage();
      case 10:
        return _getInvolvedPage();
      default:
        return _homePage();
    }
  }

  Widget _homePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _heroSection(),
          _sectionTitle(
            'Welcome to JGARM Church',
            'Jesus Grace And Restoration Ministry',
          ),
          _visionMissionSection(),
          _bishopMinistrySection(),
          _leadershipHomeSection(),
          _ministryHighlight(),
          _churchHighlight(),
          _prayerHighlight(),
          _fellowshipHighlight(),
          _servicesPreview(),
          const ProgrammePreview(),
          _mediaPreview(),
          _quickAccess(),
          const ContactFooter(),
        ],
      ),
    );
  }

  Widget _heroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 55,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            JgarmColors.veryLightBlue,
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final mobile = constraints.maxWidth < 700;

              final logo = Image.asset(
                'assets/jgarmchurch_logo.jpg',
                height: mobile ? 180 : 240,
                width: mobile ? 180 : 240,
                fit: BoxFit.contain,
              );

              final text = Column(
                crossAxisAlignment: mobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    'JESUS GRACE AND\nRESTORATION MINISTRY',
                    textAlign: mobile ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      color: JgarmColors.darkBlue,
                      fontSize: mobile ? 28 : 42,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'The Fire of the Gospel Ablaze',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: JgarmColors.pink,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Gwassi, Seka–Suba, Homabay County, Kenya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: JgarmColors.darkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'A Christ-centred ministry committed to preaching the Gospel, making disciples, restoring lives and serving communities through the love of Jesus Christ.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () => _selectPage(1),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('LEARN MORE ABOUT US'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JgarmColors.pink,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              );

              if (mobile) {
                return Column(
                  children: [
                    logo,
                    const SizedBox(height: 25),
                    text,
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: Center(child: logo)),
                  const SizedBox(width: 35),
                  Expanded(child: text),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 45, 20, 25),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.pink,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _visionMissionSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final mobile = constraints.maxWidth < 700;

          final cards = [
            _homeContentCard(
              icon: Icons.visibility,
              title: 'Our Vision',
              text: 'To make as many disciples as possible around the world.',
            ),
            _homeContentCard(
              icon: Icons.public,
              title: 'Our Mission',
              text:
                  'To preach the gospel of the cross of Jesus, evangelise and baptise, thus winning many souls to Christ.',
            ),
          ];

          if (mobile) {
            return Column(
              children: [
                cards[0],
                const SizedBox(height: 18),
                cards[1],
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 20),
              Expanded(child: cards[1]),
            ],
          );
        },
      ),
    );
  }

  Widget _bishopMinistrySection() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          JgarmColors.darkBlue,
          Color(0xFF477895),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 700;

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/bishop_preaching.jpg',
            height: mobile ? 260 : 300,
            width: mobile ? double.infinity : 280,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                height: mobile ? 260 : 300,
                width: 280,
                color: JgarmColors.lightBlue,
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
              );
            },
          ),
        );

        final text = Column(
          crossAxisAlignment: mobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Founder & Vision Bearer',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: JgarmColors.lightBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bishop Robinshon Onyango Stanley',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Founder, Vision Bearer & Chairman',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: JgarmColors.lightBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Serving JGARM with a vision to make as many disciples as possible, preaching the Gospel of Jesus Christ and bringing restoration and hope to lives.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                height: 1.6,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              '“The Fire of the Gospel Ablaze”',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: JgarmColors.pink,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

        if (mobile) {
          return Column(
            children: [
              image,
              const SizedBox(height: 25),
              text,
            ],
          );
        }

        return Row(
          children: [
            image,
            const SizedBox(width: 35),
            Expanded(child: text),
          ],
        );
      },
    ),
  );
}
                  
  
  Widget _leadershipHomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      color: JgarmColors.paleBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Our Leadership',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Serving God, His Church and His people',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 1;

              if (constraints.maxWidth >= 1100) {
                columns = 3;
              } else if (constraints.maxWidth >= 700) {
                columns = 2;
              }

              const spacing = 18.0;

              final cardWidth =
                  (constraints.maxWidth -
                          (spacing * (columns - 1))) /
                      columns;

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(
                  leadership.length,
                  (index) {
                    return SizedBox(
                      width: cardWidth,
                      child: _leadershipCard(
                        leadership[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _leadershipCard(
    Map<String, String> leader,
  ) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(14),
              child: Container(
                height: 220,
                width: double.infinity,
                color: JgarmColors.veryLightBlue,
                child: Image.asset(
                  leader['photo']!,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: JgarmColors.darkBlue,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              leader['name']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JgarmColors.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              leader['position']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JgarmColors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '“${leader['message']!}”',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

       

  Widget _ministryHighlight() {
    return _homeContentCard(
      icon: Icons.menu_book,
      title: 'The Ministry',
      text:
          'Therefore, seeing we have this ministry, as we have received mercy, we faint not. JGARM is committed to faithfully carrying the Gospel of Jesus Christ to people and communities.',
      scripture: '2 Corinthians 4:1–6',
    );
  }

  Widget _churchHighlight() {
    return _homeContentCard(
      icon: Icons.church,
      title: 'The Church',
      text:
          'JGARM is a Christ-centred ministry where believers gather in worship, fellowship, teaching, prayer and service.',
    );
  }

  Widget _prayerHighlight() {
    return _homeContentCard(
      icon: Icons.volunteer_activism,
      title: 'Prayer',
      text:
          'We believe in the power of prayer and welcome individuals and families to bring their needs before God.',
      scripture: 'James 5:16',
    );
  }

  Widget _fellowshipHighlight() {
    return _homeContentCard(
      icon: Icons.groups,
      title: 'Fellowship',
      text:
          'Believers grow together through teaching, fellowship, breaking of bread and prayer.',
      scripture: 'Acts 2:42',
    );
  }

  Widget _homeContentCard({
    required IconData icon,
    required String title,
    required String text,
    String? scripture,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 3),
            color: Color(0x18000000),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: JgarmColors.pink,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
          if (scripture != null) ...[
            const SizedBox(height: 12),
            Text(
              scripture,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JgarmColors.pink,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  
    Widget _servicesPreview() {
  final services = [
    [
      'Sunday Service',
      'Sunday • 8:00 AM – 4:00 PM',
      Icons.church,
    ],
    [
      'Sisters’ / Women’s Ministry',
      'Tuesday • 2:00 PM – 4:00 PM',
      Icons.woman,
    ],
    [
      'Hospital Ministry',
      'Wednesday • Scheduled Visits',
      Icons.local_hospital,
    ],
    [
      'Men’s Teachings',
      'Thursday • 3:00 PM – 5:00 PM',
      Icons.man,
    ],
    [
      'Prayer Meeting',
      'Friday • 5:00 PM – 7:00 PM',
      Icons.volunteer_activism,
    ],
    [
      'Youth Service',
      'Saturday • 2:00 PM – 5:00 PM',
      Icons.groups,
    ],
  ];

  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        _sectionTitle(
          'Our Services',
          'Gathering together in worship, teaching and fellowship',
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 900
                ? 3
                : constraints.maxWidth >= 600
                    ? 2
                    : 1;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.45,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: _featureCard(
                    icon: services[index][2] as IconData,
                    title: services[index][0] as String,
                    text: services[index][1] as String,
                  ),
                );
              },
            );
          },
        ),
      ],
    ),
  );
}      

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: JgarmColors.pink,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JgarmColors.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mediaPreview() {
    final videos = [
      {
        'title': 'JGARM Ministry',
        'description': 'Watch and connect with the ministry.',
        'url': 'https://youtu.be/UGhKYGsjjlI',
      },
      {
        'title': 'JGARM Worship & Ministry',
        'description': 'Experience the ministry and fellowship.',
        'url': 'https://youtu.be/m5Ouyi_ij6w',
      },
      {
        'title': 'JGARM Gospel Ministry',
        'description': 'Messages and ministry from JGARM.',
        'url': 'https://youtu.be/TsWEUTrYCHg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _sectionTitle(
            'Media',
            'Watch, listen and connect with JGARM',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 900
                  ? 3
                  : constraints.maxWidth >= 600
                      ? 2
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) {
                  return _videoCard(
                    title: videos[index]['title']!,
                    description: videos[index]['description']!,
                    url: videos[index]['url']!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _videoCard({
    required String title,
    required String description,
    required String url,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_circle_fill,
              size: 58,
              color: JgarmColors.pink,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JgarmColors.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () async {
                final uri = Uri.parse(url);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                    webOnlyWindowName: '_blank',
                  );
                }
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('WATCH'),
              style: ElevatedButton.styleFrom(
                backgroundColor: JgarmColors.darkBlue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAccess() {
    final items = [
      ['Prayer Request', Icons.volunteer_activism, 6],
      ['Give', Icons.favorite, 8],
      ['GHCC', Icons.child_care, 7],
      ['Contact Us', Icons.contact_mail, 9],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      color: JgarmColors.veryLightBlue,
      child: Column(
        children: [
          const Text(
            'Quick Access',
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: items.map((item) {
              return ElevatedButton.icon(
                onPressed: () => _selectPage(item[2] as int),
                icon: Icon(item[1] as IconData),
                label: Text(item[0] as String),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: JgarmColors.darkBlue,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _aboutPage() {
    return SimplePage(
      title: 'About JGARM',
      subtitle: 'Jesus Grace And Restoration Ministry',
      icon: Icons.info_outline,
      child: Column(
        children: [
          _aboutSection(
            'Our Vision',
            'To make as many disciples as possible around the world.',
            Icons.visibility,
          ),
          _aboutSection(
            'Our Mission',
            'To preach the gospel of the cross of Jesus, evangelise and baptise, thus winning many souls to Christ.\n\nMatthew 28:19–20 — The Great Commission.',
            Icons.public,
          ),
          _bishopLeadershipSection(),
          _aboutSection(
            'The Ministry',
            'Therefore, seeing we have this ministry, as we have received mercy, we faint not. JGARM is committed to faithfully carrying the Gospel of Jesus Christ to people and communities.',
            Icons.menu_book,
          ),
          _aboutSection(
            'The Church',
            'JGARM is a Christ-centred ministry where believers gather in worship, fellowship, teaching, prayer and service.',
            Icons.church,
          ),
          _aboutSection(
            'Prayer Requests',
            'We believe in the power of prayer and welcome individuals and families to bring their needs before God.',
            Icons.volunteer_activism,
          ),
          _aboutSection(
            'Fellowship',
            'Believers grow together through teaching, fellowship, breaking of bread and prayer.\n\nActs 2:42',
            Icons.groups,
          ),
          const SizedBox(height: 15),
          const Text(
            '“The church is not a building; it is a community of believers growing together in Christ.”',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _bishopLeadershipSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          const Text(
            'Our Leadership',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Leadership dedicated to the mission and vision of JGARM',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 1;

              if (constraints.maxWidth >= 900) {
                columns = 3;
              } else if (
                  constraints.maxWidth >= 600) {
                columns = 2;
              }

              const spacing = 16.0;

              final cardWidth =
                  (constraints.maxWidth -
                          spacing * (columns - 1)) /
                      columns;

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(
                  leadership.length,
                  (index) {
                    return SizedBox(
                      width: cardWidth,
                      child: _leadershipCard(
                        leadership[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

    
  Widget _aboutSection(
    String title,
    String text,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: JgarmColors.pink,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ministriesPage() {
    final ministries = [
      [
        'Men’s Ministry',
        'Building godly men who lead their families and communities in faith.',
        Icons.man,
      ],
      [
        'Women’s Ministry',
        'Equipping women to grow in faith, prayer, fellowship and service.',
        Icons.woman,
      ],
      [
        'Youth Ministry',
        'Raising a generation of young people committed to Christ.',
        Icons.groups,
      ],
      [
        'Sunday School',
        'Teaching children the Word of God and nurturing them in Christ.',
        Icons.child_care,
      ],
      [
        'Worship Ministry',
        'Leading the congregation into sincere worship and praise.',
        Icons.music_note,
      ],
      [
        'Evangelism Ministry',
        'Taking the Gospel of Jesus Christ to individuals and communities.',
        Icons.public,
      ],
      [
        'Grace Home Children Centre',
        'Serving vulnerable children and families through love and practical care.',
        Icons.home,
      ],
    ];

    return SimplePage(
      title: 'Ministries',
      subtitle: 'Serving God and His people',
      icon: Icons.groups,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 900
              ? 3
              : constraints.maxWidth >= 600
                  ? 2
                  : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ministries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (context, index) {
              return _featureCard(
                icon: ministries[index][2] as IconData,
                title: ministries[index][0] as String,
                text: ministries[index][1] as String,
              );
            },
          );
        },
      ),
    );
  }

  Widget _getInvolvedPage() {
    final items = [
      [
        'Worship With Us',
        'Join us in worship, fellowship, prayer and the teaching of God’s Word.',
        Icons.church,
      ],
      [
        'Grow With Us',
        'Grow spiritually through discipleship, Bible teaching and fellowship.',
        Icons.trending_up,
      ],
      [
        'Serve With Us',
        'Use your gifts and abilities to serve God and His people.',
        Icons.volunteer_activism,
      ],
      [
        'Support GHCC',
        'Help us care for vulnerable children and families through GHCC.',
        Icons.favorite,
      ],
    ];

    return SimplePage(
      title: 'Get Involved',
      subtitle: 'Join us in the work of the Gospel',
      icon: Icons.handshake,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 900
              ? 2
              : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return _featureCard(
                icon: items[index][2] as IconData,
                title: items[index][0] as String,
                text: items[index][1] as String,
              );
            },
          );
        },
      ),
    );
  }

  Widget _servicesPage() {
    return SimplePage(
      title: 'Church Services',
      subtitle: 'Weekly, monthly and annual ministry programme',
      icon: Icons.church,
      child: const ProgrammeTable(),
    );
  }

  Widget _sermonsPage() {
    final sermons = [
      {
        'title': 'JGARM Gospel Ministry',
        'description': 'Watch the latest ministry message.',
        'url': 'https://youtu.be/UGhKYGsjjlI',
      },
      {
        'title': 'JGARM Teaching & Worship',
        'description': 'Connect with JGARM through teaching and worship.',
        'url': 'https://youtu.be/m5Ouyi_ij6w',
      },
      {
        'title': 'JGARM Ministry Message',
        'description': 'Be encouraged through the Word of God.',
        'url': 'https://youtu.be/TsWEUTrYCHg',
      },
    ];

    return SimplePage(
      title: 'Sermons',
      subtitle: 'Messages, teachings and ministry',
      icon: Icons.menu_book,
      child: Column(
        children: sermons.map((sermon) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: _videoCard(
              title: sermon['title']!,
              description: sermon['description']!,
              url: sermon['url']!,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _eventsPage() {
    final events = [
      [
        'Sunday Fellowship',
        'Weekly fellowship, worship, teaching and prayer.',
        Icons.church,
      ],
      [
        'Prayer Meetings',
        'Corporate prayer and intercession for the church and community.',
        Icons.volunteer_activism,
      ],
      [
        'Youth Service',
        'A special time for young people to worship, learn and fellowship.',
        Icons.groups,
      ],
      [
        'Monthly Kesha',
        'A monthly overnight programme held during the first weekend of the month.',
        Icons.nightlight_round,
      ],
    ];

    return SimplePage(
      title: 'Events',
      subtitle: 'Upcoming and regular JGARM gatherings',
      icon: Icons.event,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 800 ? 2 : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: events.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) {
              return _featureCard(
                icon: events[index][2] as IconData,
                title: events[index][0] as String,
                text: events[index][1] as String,
              );
            },
          );
        },
      ),
    );
  }

  Widget _prayerPage() {
    return SimplePage(
      title: 'Prayer Request',
      subtitle: 'Bring Your Prayer Needs',
      icon: Icons.volunteer_activism,
      child: Column(
        children: [
          const Icon(
            Icons.volunteer_activism,
            size: 75,
            color: JgarmColors.pink,
          ),
          const SizedBox(height: 20),
          const Text(
            'We believe in the power of prayer.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'You can bring your prayer needs to us. We will stand with you in prayer concerning financial challenges, domestic violence and strife, drunkenness, sickness, illness and every other burden.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.7,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '“The prayers of the righteous avail much.”',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton.icon(
            onPressed: _emailPrayerRequest,
            icon: const Icon(Icons.email),
            label: const Text('SUBMIT A PRAYER REQUEST'),
            style: ElevatedButton.styleFrom(
              backgroundColor: JgarmColors.pink,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _emailPrayerRequest() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'jesus.graceandrestorationministry@gmail.com',
      queryParameters: {
        'subject': 'JGARM Prayer Request',
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _ghccPage() {
    final gallery = [
      'assets/ghcc_children_1.jpg',
      'assets/ghcc_children_2.jpg',
      'assets/ghcc_children_3.jpg',
    ];

    return SimplePage(
      title: 'GHCC',
      subtitle: 'Grace Home Children Centre',
      icon: Icons.child_care,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  JgarmColors.lightBlue,
                  JgarmColors.veryLightBlue,
                ],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.child_care,
                  size: 70,
                  color: JgarmColors.darkBlue,
                ),
                SizedBox(height: 12),
                Text(
                  'Grace Home Children Centre',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: JgarmColors.darkBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'GHCC is a ministry of JGARM serving orphans, vulnerable children and widows in our community.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 25),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 900
                  ? 3
                  : constraints.maxWidth >= 600
                      ? 2
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gallery.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      gallery[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: JgarmColors.veryLightBlue,
                          child: const Icon(
                            Icons.image,
                            size: 60,
                            color: JgarmColors.darkBlue,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 25),
          _aboutSection(
            'Care',
            'Providing practical support and care for vulnerable children and families.',
            Icons.volunteer_activism,
          ),
          _aboutSection(
            'Heart',
            'Serving with compassion, dignity and the love of Jesus Christ.',
            Icons.favorite,
          ),
          _aboutSection(
            'Support GHCC',
            'Your support can help provide food, education, clothing and other essential needs.',
            Icons.favorite_border,
          ),
          const SizedBox(height: 15),
          const Text(
            'Please protect the privacy and dignity of children when sharing their photographs or information.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _givePage() {
    return SimplePage(
      title: 'Give',
      subtitle: 'Support the work of JGARM',
      icon: Icons.favorite,
      child: Column(
        children: [
          _givingCard(
            icon: Icons.phone_android,
            title: 'M-PESA',
            rows: const [
              ['Paybill', '522533'],
              ['Account / Till', '7957551'],
              ['Account Name', 'Robinshon'],
            ],
          ),
          const SizedBox(height: 20),
          _givingCard(
            icon: Icons.paypal,
            title: 'PayPal',
            rows: const [
              ['Email', 'robinshonstanley@gmail.com'],
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Thank you for supporting the work of the Gospel and the ministry of JGARM.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _givingCard({
    required IconData icon,
    required String title,
    required List<List<String>> rows,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: JgarmColors.pink,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          ...rows.map(
            (row) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      row[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      row[1],
                      textAlign: TextAlign.right,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _copyText(row[1]),
                    icon: const Icon(
                      Icons.copy,
                      color: JgarmColors.pink,
                    ),
                    tooltip: 'Copy',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _copyText(String text) async {
    await Clipboard.setData(
      ClipboardData(text: text),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  Future<void> _callJgarm() async {
    final uri = Uri(
      scheme: 'tel',
      path: '+254715205485',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _emailJgarm() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'jesus.graceandrestorationministry@gmail.com',
      queryParameters: {
        'subject': 'JGARM Contact',
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse(
      'https://wa.me/254715205485?text=Hello%20JGARM%2C%20I%20would%20like%20to%20get%20in%20touch.',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

  Widget _contactPage() {
    return SimplePage(
      title: 'Contact Us',
      subtitle: 'We would love to hear from you',
      icon: Icons.contact_mail,
      child: Column(
        children: [
          const Text(
            'JGARM CHURCH',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Jesus Grace And Restoration Ministry',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 25),
          _contactItem(
            Icons.location_on,
            'Headquarters',
            'Gwassi, Seka–Suba, Homabay County, Kenya',
          ),
          _contactItem(
            Icons.markunread_mailbox,
            'Postal Address',
            'P.O. Box 67-40401',
          ),
          InkWell(
            onTap: _callJgarm,
            child: _contactItem(
              Icons.phone,
              'Phone',
              '+254 715 205 485',
            ),
          ),
          InkWell(
            onTap: _emailJgarm,
            child: _contactItem(
              Icons.email,
              'Email',
              'jesus.graceandrestorationministry@gmail.com',
            ),
          ),
          InkWell(
            onTap: _openWhatsApp,
            child: _contactItem(
              Icons.chat,
              'WhatsApp',
              'Chat with JGARM on WhatsApp',
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactItem(
    IconData icon,
    String title,
    String text,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: JgarmColors.pink,
            size: 30,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;

  const SimplePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 45,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  JgarmColors.lightBlue,
                  JgarmColors.veryLightBlue,
                ],
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 55,
                  color: JgarmColors.darkBlue,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: JgarmColors.pink,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(20),
            child: child,
          ),
          const ContactFooter(),
        ],
      ),
    );
  }
}

class ProgrammePreview extends StatelessWidget {
  const ProgrammePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> programme = [
      {
        'day': 'Sunday',
        'title': 'Main Worship Service',
        'time': '8:00 AM - 4:00 PM',
        'icon': 'church',
        'details':
            'Our main Sunday gathering with prayer, worship, teachings, testimonies, the sermon, fellowship and other church activities.',
        'activities': [
          'Prayer & Intercession - 8:00 AM - 9:00 AM',
          'Worship - 9:00 AM - 9:15 AM',
          'Teachings - 9:15 AM - 10:15 AM',
          'Reports - 10:15 AM - 10:25 AM',
          'Sunday School Presentations - 10:25 AM - 10:35 AM',
          'Praise & Worship - 10:35 AM - 10:45 AM',
          'Testimonies - 10:45 AM - 10:55 AM',
          'Praise & Worship - 10:55 AM - 11:20 AM',
          'Sermon - 11:20 AM - 12:20 PM',
          'Lunch - 12:20 PM - 2:00 PM',
          'Sisters\' Sessions - 2:00 PM - 4:00 PM',
        ],
      },
      {
        'day': 'Tuesday',
        'title': 'Sisters / Women\'s Ministry',
        'time': '2:00 PM - 4:00 PM',
        'icon': 'women',
        'details':
            'A special time of fellowship, prayer, teaching and spiritual encouragement for women.',
        'activities': [
          'Women\'s / Sisters\' Ministry - 2:00 PM - 4:00 PM',
          'Fellowship',
          'Prayer',
          'Biblical Teaching',
          'Spiritual Encouragement',
        ],
      },
      {
        'day': 'Thursday',
        'title': 'Men\'s Teaching',
        'time': '3:00 PM - 5:00 PM',
        'icon': 'men',
        'details':
            'Men gather for Biblical teaching, prayer, fellowship and spiritual growth.',
        'activities': [
          'Men\'s Teaching - 3:00 PM - 5:00 PM',
          'Biblical Teaching',
          'Prayer',
          'Fellowship',
          'Spiritual Growth',
        ],
      },
      {
        'day': 'Friday',
        'title': 'Prayer Meeting',
        'time': '5:00 PM - 7:00 PM',
        'icon': 'prayer',
        'details':
            'Join us for corporate prayer, intercession and seeking God together.',
        'activities': [
          'Prayer Meeting - 5:00 PM - 7:00 PM',
          'Corporate Prayer',
          'Intercession',
          'Seeking God Together',
        ],
      },
      {
        'day': 'Saturday',
        'title': 'Youth Service',
        'time': '2:00 PM - 5:00 PM',
        'icon': 'youth',
        'details':
            'A gathering for young people featuring worship, Biblical teaching, prayer and fellowship.',
        'activities': [
          'Youth Service - 2:00 PM - 5:00 PM',
          'Worship',
          'Biblical Teaching',
          'Prayer',
          'Fellowship',
        ],
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: JgarmColors.paleBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Weekly Programme',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap any programme to view the full programme',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.pink,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          ...programme.map((item) {
            IconData icon;

            switch (item['icon']) {
              case 'church':
                icon = Icons.church;
                break;
              case 'women':
                icon = Icons.woman;
                break;
              case 'men':
                icon = Icons.man;
                break;
              case 'prayer':
                icon = Icons.volunteer_activism;
                break;
              default:
                icon = Icons.groups;
            }

            final List<String> activities =
                List<String>.from(item['activities']);

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 14),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: JgarmColors.lightBlue,
                ),
              ),
              child: ExpansionTile(
                leading: Icon(
                  icon,
                  color: JgarmColors.pink,
                  size: 30,
                ),
                title: Text(
                  item['title'],
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    '${item['day']}  •  ${item['time']}',
                    style: const TextStyle(
                      color: JgarmColors.pink,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                iconColor: JgarmColors.darkBlue,
                collapsedIconColor: JgarmColors.pink,
                childrenPadding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  18,
                ),
                children: [
                  const Divider(
                    color: JgarmColors.lightBlue,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['details'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Programme Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: JgarmColors.darkBlue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...activities.map(
                    (activity) => Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: JgarmColors.paleBlue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: JgarmColors.lightBlue,
                        ),
                      ),
                      child: Text(
                        activity,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: JgarmColors.darkBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
               

class ProgrammeTable extends StatelessWidget {
  const ProgrammeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sectionHeader(
          'Weekly Programme',
          'Tap any programme to view details',
          Icons.calendar_view_week,
        ),

        _programmeCard(
          context,
          'Sunday Main Worship Service',
          'Sunday',
          '8:00 AM – 4:00 PM',
          Icons.church,
        ),

        _programmeCard(
          context,
          'Tuesday Sisters’ / Women’s Ministry',
          'Tuesday',
          '2:00 PM – 4:00 PM',
          Icons.woman,
        ),

        _programmeCard(
          context,
          'Wednesday Hospital Ministry',
          'Wednesday',
          'Scheduled Hospital Visits',
          Icons.local_hospital,
          reference: 'Matthew 25:35–36',
        ),

        _programmeCard(
          context,
          'Thursday Men’s Teaching',
          'Thursday',
          '3:00 PM – 5:00 PM',
          Icons.man,
        ),

        _programmeCard(
          context,
          'Friday Prayer Meeting',
          'Friday',
          '5:00 PM – 7:00 PM',
          Icons.volunteer_activism,
        ),

        _programmeCard(
          context,
          'Saturday Youth Service',
          'Saturday',
          '2:00 PM – 5:00 PM',
          Icons.groups,
        ),

        const SizedBox(height: 30),

        _sectionHeader(
          'Detailed Sunday Programme',
          'Main Sunday worship schedule',
          Icons.schedule,
        ),

        _sundayProgrammeCard(),

        const SizedBox(height: 30),

        _sectionHeader(
          'Monthly Programme',
          'Monthly Kesha — First Weekend of Every Month',
          Icons.nightlight_round,
        ),

        _monthlyKeshaCard(),

        const SizedBox(height: 30),

        _sectionHeader(
          'Annual Programme',
          'Major annual JGARM programmes',
          Icons.event_available,
        ),

        _annualProgramme(),
      ],
    );
  }

  static Widget _sectionHeader(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            JgarmColors.veryLightBlue,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 45,
            color: JgarmColors.pink,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: JgarmColors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _programmeCard(
    BuildContext context,
    String title,
    String day,
    String time,
    IconData icon, {
    String? reference,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _showProgrammeDetails(
              context,
              title,
              day,
              time,
              icon,
              reference,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: JgarmColors.veryLightBlue,
                  child: Icon(
                    icon,
                    color: JgarmColors.darkBlue,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: JgarmColors.darkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('$day • $time'),
                      if (reference != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          reference,
                          style: const TextStyle(
                            color: JgarmColors.pink,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  color: JgarmColors.pink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void _showProgrammeDetails(
    BuildContext context,
    String title,
    String day,
    String time,
    IconData icon,
    String? reference,
  ) {
    if (title == 'Sunday Main Worship Service') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              children: [
                const Icon(
                  Icons.church,
                  color: JgarmColors.pink,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Sunday Main Worship Service',
                    style: TextStyle(
                      color: JgarmColors.darkBlue,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _detailRow(
                      '1',
                      'Prayer & Intercession',
                      '8:00 AM – 9:00 AM',
                    ),
                    _detailRow(
                      '2',
                      'Worship',
                      '9:00 AM – 9:15 AM',
                    ),
                    _detailRow(
                      '3',
                      'Teachings',
                      '9:15 AM – 10:15 AM',
                    ),
                    _detailRow(
                      '4',
                      'Reports',
                      '10:15 AM – 10:25 AM',
                    ),
                    _detailRow(
                      '5',
                      'Sunday School Presentations',
                      '10:25 AM – 10:35 AM',
                    ),
                    _detailRow(
                      '6',
                      'Praise & Worship',
                      '10:35 AM – 10:45 AM',
                    ),
                    _detailRow(
                      '7',
                      'Testimonies',
                      '10:45 AM – 10:55 AM',
                    ),
                    _detailRow(
                      '8',
                      'Praise & Worship',
                      '10:55 AM – 11:20 AM',
                    ),
                    _detailRow(
                      '9',
                      'Sermon',
                      '11:20 AM – 12:20 PM',
                    ),
                    _detailRow(
                      '10',
                      'Lunch',
                      '12:20 PM – 2:00 PM',
                    ),
                    _detailRow(
                      '11',
                      'Sisters’ Sessions',
                      '2:00 PM – 4:00 PM',
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'CLOSE',
                  style: TextStyle(
                    color: JgarmColors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: JgarmColors.veryLightBlue,
                child: Icon(
                  icon,
                  color: JgarmColors.darkBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                  color: JgarmColors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: const TextStyle(
                  color: JgarmColors.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (reference != null) ...[
                const SizedBox(height: 12),
                Text(
                  reference,
                  style: const TextStyle(
                    color: JgarmColors.pink,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'CLOSE',
                style: TextStyle(
                  color: JgarmColors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _detailRow(
    String number,
    String programme,
    String time,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: JgarmColors.pink,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              programme,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sundayProgrammeCard() {
    final items = [
      ['1', 'Prayer & Intercession', '8:00 AM – 9:00 AM'],
      ['2', 'Worship', '9:00 AM – 9:15 AM'],
      ['3', 'Teachings', '9:15 AM – 10:15 AM'],
      ['4', 'Reports', '10:15 AM – 10:25 AM'],
      [
        '5',
        'Sunday School Presentations',
        '10:25 AM – 10:35 AM',
      ],
      ['6', 'Praise & Worship', '10:35 AM – 10:45 AM'],
      ['7', 'Testimonies', '10:45 AM – 10:55 AM'],
      ['8', 'Praise & Worship', '10:55 AM – 11:20 AM'],
      ['9', 'Sermon', '11:20 AM – 12:20 PM'],
      ['10', 'Lunch', '12:20 PM – 2:00 PM'],
      ['11', 'Sisters’ Sessions', '2:00 PM – 4:00 PM'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: JgarmColors.pink,
                  child: Text(
                    item[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item[1],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item[2],
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  static Widget _monthlyKeshaCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: JgarmColors.paleBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JgarmColors.lightBlue,
        ),
      ),
      child: Column(
        children: [
          _keshaItem(
            'Friday',
            'Revival',
            '8:00 PM – 10:00 PM',
          ),
          _keshaItem(
            'Saturday',
            'Morning Devotion',
            '4:00 AM – 6:00 AM',
          ),
          _keshaItem(
            'Saturday',
            'Afternoon Teaching',
            '3:00 PM – 4:30 PM',
          ),
          _keshaItem(
            'Saturday',
            'Revival',
            '8:00 PM – 10:00 PM',
          ),
          _keshaItem(
            'Sunday',
            'Morning Devotion',
            '4:00 AM – 6:00 AM',
          ),
          _keshaItem(
            'Sunday',
            'Main Worship Service',
            '8:00 AM – 2:00 PM',
          ),
        ],
      ),
    );
  }

  static Widget _keshaItem(
    String day,
    String programme,
    String time,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: JgarmColors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            programme,
            style: const TextStyle(
              color: JgarmColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(time),
        ],
      ),
    );
  }

  static Widget _annualProgramme() {
    final items = [
      ['April', 'Women’s Convention'],
      ['June', 'General Leadership Seminar'],
      ['August', 'Youth Convention'],
      ['October', 'General Pastors’ Meeting'],
      ['December', 'Annual General Convention'],
      ['December', 'Annual General Meeting (AGM) — Board'],
    ];

    return Column(
      children: items.map((item) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: JgarmColors.lightBlue,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: JgarmColors.darkBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  item[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  item[1],
                  style: const TextStyle(
                    color: JgarmColors.darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
 
          
       

class ContactFooter extends StatelessWidget {
  const ContactFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 35,
      ),
      color: JgarmColors.darkBlue,
      child: Column(
        children: [
          Image.asset(
            'assets/jgarmchurch_logo.jpg',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.church,
                color: Colors.white,
                size: 70,
              );
            },
          ),
          const SizedBox(height: 15),
          const Text(
            'JESUS GRACE AND RESTORATION MINISTRY',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'The Fire of the Gospel Ablaze',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: JgarmColors.lightBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Gwassi, Seka–Suba, Homabay County, Kenya',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'P.O. Box 67-40401',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '+254 715 205 485',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'jgarm2016@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'info@jgarm.org',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'jesus.graceandrestorationministry@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          const Divider(
            color: JgarmColors.lightBlue,
          ),
          const SizedBox(height: 15),
          const Text(
            '© JGARM CHURCH. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
