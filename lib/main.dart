import 'package:flutter/material.dart';
import 'learning_hub.dart';

void main() {
  runApp(const MTAlchemyApp());
}

// ============================================================
// 1. DESIGN SYSTEM
// ============================================================

const navy = Color(0xFF202B48);
const oat = Color(0xFFF4F0E8);
const lilac = Color(0xFFDCD5EA);
const purple = Color(0xFF7664A5);
const gold = Color(0xFFF0D977);
const sage = Color(0xFFB9C8B8);
const ink = Color(0xFF292C35);
const muted = Color(0xFF72727B);
const white = Color(0xFFFFFFFF);

class MTAlchemyApp extends StatelessWidget {
  const MTAlchemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MT Alchemy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: oat,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          primary: navy,
          secondary: purple,
        ),
        fontFamily: 'Arial',
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// 2. HOME PAGE
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigate(BuildContext context, String page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ContentScreen(title: page),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final mobile = constraints.maxWidth < 760;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // HEADER
                SiteHeader(
                  mobile: mobile,
                  onNavigate: (page) => navigate(context, page),
                ),

                // HERO
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    mobile ? 16 : 48,
                    20,
                    mobile ? 16 : 48,
                    0,
                  ),
                  child: mobile
                      ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeroCopy(),
                      SizedBox(height: 16),
                      HeroArtwork(height: 300),
                    ],
                  )
                      : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: HeroCopy(),
                      ),
                      SizedBox(width: 22),
                      Expanded(
                        flex: 4,
                        child: HeroArtwork(height: 470),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 70),

                // ALCHEMY CYCLE
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 20 : 65,
                  ),
                  child: const AlchemyCycle(),
                ),

                const SizedBox(height: 75),

                // DEVELOPMENT PATHWAYS
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 20 : 65,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeading(
                        eyebrow: 'FIND YOUR PATH',
                        title: 'Growth looks different for everyone.',
                        description:
                        'Explore a pathway that meets you where you are '
                            'and helps you move towards where you want to be.',
                      ),
                      const SizedBox(height: 28),
                      LayoutBuilder(
                        builder: (context, box) {
                          final columns =
                          box.maxWidth > 850 ? 3 : 1;

                          return GridView.count(
                            crossAxisCount: columns,
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18,
                            childAspectRatio:
                            columns == 3 ? 0.78 : (box.maxWidth < 500 ? 0.72 : 1.25),
                            children: [
                              PathwayCard(
                                number: '01',
                                icon: Icons.psychology_outlined,
                                title: 'Understand yourself.',
                                description:
                                'Develop emotional intelligence, '
                                    'self-awareness and mindful habits.',
                                category: 'INDIVIDUAL GROWTH',
                                color: lilac,
                                imageUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
                                button: 'Explore learning',
                                onTap: () =>
                                    navigate(context, 'Upskilling'),
                              ),
                              PathwayCard(
                                number: '02',
                                icon: Icons.groups_2_outlined,
                                title: 'Grow together.',
                                description:
                                'Build authentic leadership, trust '
                                    'and stronger team relationships.',
                                category: 'TEAM DEVELOPMENT',
                                color: sage,
                                imageUrl: 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=900&q=80',
                                button: 'Explore services',
                                onTap: () =>
                                    navigate(context, 'Services'),
                              ),
                              PathwayCard(
                                number: '03',
                                icon: Icons.auto_stories_outlined,
                                title: 'Put growth into practice.',
                                description:
                                'Explore workbooks, journals and '
                                    'resources for everyday learning.',
                                category: 'PRACTICAL RESOURCES',
                                color: gold,
                                imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=900&q=80',
                                button: 'Visit the store',
                                onTap: () => navigate(context, 'Store'),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 75),

                // IMPACT SECTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 16 : 48,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(mobile ? 25 : 48),
                    decoration: BoxDecoration(
                      color: navy,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'THE DIFFERENCE WE WANT TO MAKE',
                          style: TextStyle(
                            color: gold,
                            fontSize: 11,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Personal growth should create collective change.',
                          style: TextStyle(
                            color: white,
                            fontSize: mobile ? 32 : 46,
                            fontWeight: FontWeight.w700,
                            height: 1.15,
                            letterSpacing: -1.4,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'From individual insight to healthier teams, '
                              'we believe meaningful development changes '
                              'the way people work, connect and lead.',
                          style: TextStyle(
                            color: Color(0xFFDADCE7),
                            fontSize: 15,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Wrap(
                          spacing: 35,
                          runSpacing: 25,
                          children: const [
                            ImpactStat(
                              value: '1,100+',
                              label: 'Participants impacted',
                            ),
                            ImpactStat(
                              value: '120+',
                              label: 'Organisations',
                            ),
                            ImpactStat(
                              value: '95%',
                              label: 'Positive feedback',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 70),

                // EMPLOYER CALL TO ACTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 20 : 65,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(mobile ? 25 : 40),
                    decoration: BoxDecoration(
                      color: lilac,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: mobile
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const EmployerCopy(),
                        const SizedBox(height: 25),
                        EmployerButton(
                          onTap: () =>
                              navigate(context, 'Employers'),
                        ),
                      ],
                    )
                        : Row(
                      children: [
                        const Expanded(child: EmployerCopy()),
                        const SizedBox(width: 25),
                        EmployerButton(
                          onTap: () =>
                              navigate(context, 'Employers'),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 65),

                // FOOTER
                Container(
                  color: const Color(0xFFE9E3D8),
                  padding: EdgeInsets.all(mobile ? 24 : 48),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 20,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MT / ALCHEMY',
                            style: TextStyle(
                              color: navy,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'A studio for human potential.',
                            style: TextStyle(color: muted),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          TextButton(
                            onPressed: () =>
                                navigate(context, 'About'),
                            child: const Text('About'),
                          ),
                          TextButton(
                            onPressed: () =>
                                navigate(context, 'Contact'),
                            child: const Text('Contact'),
                          ),
                          TextButton(
                            onPressed: () =>
                                navigate(context, 'Login'),
                            child: const Text('Learning login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// 3. HEADER AND NAVIGATION
// ============================================================

class SiteHeader extends StatelessWidget {
  final bool mobile;
  final ValueChanged<String> onNavigate;

  const SiteHeader({
    super.key,
    required this.mobile,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final links = [
      'About',
      'Services',
      'Upskilling',
      'Store',
      'Insights',
      'Contact',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 48,
        vertical: 18,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.auto_awesome,
            color: purple,
            size: 29,
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MT / ALCHEMY',
                style: TextStyle(
                  color: navy,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                'A STUDIO FOR HUMAN POTENTIAL',
                style: TextStyle(
                  color: muted,
                  fontSize: 8,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (!mobile)
            ...links.map(
                  (link) => TextButton(
                onPressed: () => onNavigate(link),
                child: Text(
                  link,
                  style: const TextStyle(
                    color: ink,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          if (mobile)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: navy),
              onSelected: onNavigate,
              itemBuilder: (context) => [
                for (final link in [
                  ...links,
                  'Employers',
                  'Cart',
                  'Login',
                  'Register',
                ])
                  PopupMenuItem(
                    value: link,
                    child: Text(link),
                  ),
              ],
            )
          else ...[
            const SizedBox(width: 4),
            IconButton(
              tooltip: 'Open cart',
              onPressed: () => onNavigate('Cart'),
              icon: const Icon(Icons.shopping_bag_outlined, color: navy),
            ),
            const SizedBox(width: 4),
            OutlinedButton(
              onPressed: () => onNavigate('Login'),
              child: const Text('Sign in'),
            ),
            const SizedBox(width: 8),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: navy,
                foregroundColor: white,
              ),
              onPressed: () => onNavigate('Register'),
              child: const Text('Get started ↗'),
            ),
          ],
        ],
      ),
    );
  }
}

// ============================================================
// 4. HERO COPY
// ============================================================

class HeroCopy extends StatelessWidget {
  const HeroCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 470),
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E2F1),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'A STUDIO FOR HUMAN POTENTIAL',
            style: TextStyle(
              color: purple,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Change begins within.\nImpact moves outward.',
            style: TextStyle(
              color: navy,
              fontSize: 43,
              fontWeight: FontWeight.w800,
              height: 1.13,
              letterSpacing: -1.8,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Discover a more human way to learn, lead and '
                'grow through experiences designed to turn insight '
                'into meaningful change.',
            style: TextStyle(
              color: Color(0xFF555563),
              fontSize: 15,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 28),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: navy,
              foregroundColor: white,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 18,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const ContentScreen(title: 'Upskilling'),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward, size: 17),
            label: const Text('Find your pathway'),
          ),
          const SizedBox(height: 15),
          const Text(
            'FOR INDIVIDUALS  ·  TEAMS  ·  ORGANISATIONS',
            style: TextStyle(
              color: muted,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 5. ABSTRACT HERO ARTWORK
// ============================================================

class HeroArtwork extends StatelessWidget {
  final double height;

  const HeroArtwork({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1100&q=85',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: navy);
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  navy.withValues(alpha: 0.85),
                  navy.withValues(alpha: 0.08),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: navy,
                size: 32,
              ),
            ),
          ),
          const Positioned(
            bottom: 25,
            left: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE ALCHEMY PRINCIPLE',
                  style: TextStyle(
                    color: gold,
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Small shifts.\nLasting change.',
                  style: TextStyle(
                    color: white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
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

// ============================================================
// 6. ALCHEMY CYCLE
// ============================================================

class AlchemyCycle extends StatelessWidget {
  const AlchemyCycle({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      ('01', 'Discover', Icons.lightbulb_outline),
      ('02', 'Practice', Icons.edit_note),
      ('03', 'Transform', Icons.change_circle_outlined),
      ('04', 'Impact', Icons.public_outlined),
    ];

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE7E2E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OUR APPROACH',
            style: TextStyle(
              color: purple,
              fontSize: 11,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'From insight to impact.',
            style: TextStyle(
              color: navy,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 20,
            runSpacing: 20,
            children: steps.map((step) {
              return SizedBox(
                width: 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: step.$1 == '03' ? purple : lilac,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Icon(
                        step.$3,
                        color: step.$1 == '03' ? white : navy,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      step.$1,
                      style: const TextStyle(
                        color: purple,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.$2,
                      style: const TextStyle(
                        color: navy,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 7. REUSABLE SECTION HEADING
// ============================================================

class SectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String description;

  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: purple,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: navy,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            height: 1.2,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            color: muted,
            fontSize: 15,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// 8. DEVELOPMENT PATHWAY CARD
// ============================================================

class PathwayCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final String category;
  final Color color;
  final String imageUrl;
  final String button;
  final VoidCallback onTap;

  const PathwayCard({
    super.key,
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.category,
    required this.color,
    required this.imageUrl,
    required this.button,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 142,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: color,
                alignment: Alignment.center,
                child: Icon(icon, size: 42, color: navy),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, size: 31, color: navy),
                    Text(
                      number,
                      style: const TextStyle(
                        color: navy,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  category,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 9,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF4F5360),
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: onTap,
                    style: TextButton.styleFrom(
                      foregroundColor: navy,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text('$button ↗'),
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

// ============================================================
// 9. IMPACT STATISTICS
// ============================================================

class ImpactStat extends StatelessWidget {
  final String value;
  final String label;

  const ImpactStat({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: gold,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFDADCE7),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// 10. EMPLOYER SECTION
// ============================================================

class EmployerCopy extends StatelessWidget {
  const EmployerCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FOR ORGANISATIONS',
          style: TextStyle(
            color: purple,
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Develop people.\nTransform culture.',
          style: TextStyle(
            color: navy,
            fontSize: 33,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Bring learning, course assignments and employee '
              'development together in one connected experience.',
          style: TextStyle(
            color: muted,
            fontSize: 14,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

class EmployerButton extends StatelessWidget {
  final VoidCallback onTap;

  const EmployerButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: navy,
        foregroundColor: white,
        padding: const EdgeInsets.all(20),
      ),
      onPressed: onTap,
      icon: const Icon(Icons.arrow_forward),
      label: const Text('Explore employer portal'),
    );
  }
}


// ============================================================
// 11. SHOP AND CART (SAMPLE DATA FOR CHECKPOINT 1)
// ============================================================

class ShopProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String type;

  const ShopProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.type,
  });
}

const shopProducts = <ShopProduct>[
  ShopProduct(
    id: 'journal',
    name: 'The Reflection Journal',
    description: 'Guided prompts for self-awareness and everyday reflection.',
    price: 29.00,
    imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=900&q=80',
    type: 'DIGITAL WORKBOOK',
  ),
  ShopProduct(
    id: 'leadership',
    name: 'Leadership Workbook',
    description: 'Practical exercises for intentional, people-centred leadership.',
    price: 39.00,
    imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=900&q=80',
    type: 'DIGITAL WORKBOOK',
  ),
  ShopProduct(
    id: 'conversation',
    name: 'Better Conversations Toolkit',
    description: 'Prompts and tools to strengthen communication and trust.',
    price: 19.00,
    imageUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80',
    type: 'DIGITAL TOOLKIT',
  ),
  ShopProduct(
    id: 'team',
    name: 'Team Reflection Cards',
    description: 'A facilitation resource for group discussion and team learning.',
    price: 45.00,
    imageUrl: 'https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&w=900&q=80',
    type: 'TEAM RESOURCE',
  ),
];

class CartLine {
  final ShopProduct product;
  int quantity;

  CartLine({required this.product, this.quantity = 1});
}

final List<CartLine> sampleCart = [];
final ValueNotifier<int> sampleCartCount = ValueNotifier<int>(0);

void refreshSampleCartCount() {
  sampleCartCount.value =
      sampleCart.fold<int>(0, (sum, line) => sum + line.quantity);
}

void addProductToCart(ShopProduct product) {
  final index = sampleCart.indexWhere((line) => line.product.id == product.id);
  if (index >= 0) {
    sampleCart[index].quantity++;
  } else {
    sampleCart.add(CartLine(product: product));
  }
  refreshSampleCartCount();
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        elevation: 0,
        title: const Text('THE ALCHEMY STORE'),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: sampleCartCount,
            builder: (context, count, _) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
                icon: const Icon(Icons.shopping_bag_outlined),
                label: Text('Cart ($count)'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: navy,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOOLS FOR YOUR NEXT CHAPTER',
                        style: TextStyle(
                          color: gold,
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Make the insight last.',
                        style: TextStyle(
                          color: white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Explore thoughtful resources designed to bring self-awareness, '
                            'leadership and better conversations into everyday life.',
                        style: TextStyle(color: Color(0xFFE0E1E8), height: 1.6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'THE RESOURCE COLLECTION',
                  style: TextStyle(
                    color: purple,
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Practical tools. Meaningful change.',
                  style: TextStyle(
                    color: navy,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 850
                        ? 3
                        : constraints.maxWidth >= 540
                        ? 2
                        : 1;
                    final width =
                        (constraints.maxWidth - (columns - 1) * 18) / columns;
                    return Wrap(
                      spacing: 18,
                      runSpacing: 18,
                      children: shopProducts.map((product) {
                        return SizedBox(
                          width: width,
                          child: _StoreProductCard(product: product),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 22),
                const Text(
                  'Prototype store: products and prices are illustrative. No payment is processed.',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreProductCard extends StatelessWidget {
  final ShopProduct product;

  const _StoreProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5DFD5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: lilac,
                child: const Icon(Icons.auto_stories_outlined, size: 48, color: navy),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.type,
                  style: const TextStyle(
                    color: purple,
                    fontSize: 10,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(color: muted, height: 1.5, fontSize: 13),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RM ${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: navy,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: navy,
                        foregroundColor: white,
                      ),
                      onPressed: () {
                        addProductToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            action: SnackBarAction(
                              label: 'VIEW CART',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CartScreen(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('Add to cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get subtotal => sampleCart.fold<double>(
    0,
        (sum, line) => sum + line.product.price * line.quantity,
  );

  void updateCart() {
    refreshSampleCartCount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        elevation: 0,
        title: const Text('YOUR CART'),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StoreScreen()),
            ),
            child: const Text('CONTINUE SHOPPING'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1050),
            child: sampleCart.isEmpty
                ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 55,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 56,
                    color: purple,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Your cart is taking a little breather.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: navy,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Explore the store to find a resource for your next step.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted, height: 1.6),
                  ),
                  const SizedBox(height: 22),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: navy,
                      foregroundColor: white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StoreScreen(),
                      ),
                    ),
                    child: const Text('Explore the store'),
                  ),
                ],
              ),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'A GOOD PLACE TO BEGIN.',
                  style: TextStyle(
                    color: purple,
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Review your resources.',
                  style: TextStyle(
                    color: navy,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth > 760;
                    final items = Column(
                      children: sampleCart.map((line) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  line.product.imageUrl,
                                  width: 88,
                                  height: 88,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 88,
                                        height: 88,
                                        color: lilac,
                                        child: const Icon(Icons.auto_stories),
                                      ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      line.product.name,
                                      style: const TextStyle(
                                        color: navy,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'RM ${line.product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(color: muted),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        sampleCart.remove(line);
                                        updateCart();
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: purple,
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: const Text('Remove'),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    tooltip: 'Decrease quantity',
                                    onPressed: () {
                                      if (line.quantity > 1) {
                                        line.quantity--;
                                      } else {
                                        sampleCart.remove(line);
                                      }
                                      updateCart();
                                    },
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    '${line.quantity}',
                                    style: const TextStyle(
                                      color: navy,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    tooltip: 'Increase quantity',
                                    onPressed: () {
                                      line.quantity++;
                                      updateCart();
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );

                    final summary = Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ORDER SUMMARY',
                            style: TextStyle(
                              color: purple,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Subtotal', style: TextStyle(color: muted)),
                              Text(
                                'RM ${subtotal.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: navy,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Digital prototype checkout. No payment will be taken.',
                            style: TextStyle(color: muted, fontSize: 12, height: 1.5),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: navy,
                                foregroundColor: white,
                                padding: const EdgeInsets.symmetric(vertical: 17),
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (dialogContext) => AlertDialog(
                                    title: const Text('Checkout preview'),
                                    content: Text(
                                      'Your sample order total is RM ${subtotal.toStringAsFixed(2)}. '
                                          'This checkpoint prototype does not process payments.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(dialogContext),
                                        child: const Text('Close'),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          sampleCart.clear();
                                          refreshSampleCartCount();
                                          Navigator.pop(dialogContext);
                                          setState(() {});
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Sample checkout completed. No payment was processed.'),
                                            ),
                                          );
                                        },
                                        child: const Text('Complete demo'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('Proceed to checkout'),
                            ),
                          ),
                        ],
                      ),
                    );

                    if (wide) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 7, child: items),
                          const SizedBox(width: 20),
                          Expanded(flex: 4, child: summary),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        items,
                        const SizedBox(height: 8),
                        summary,
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EMPLOYER PORTAL — interactive checkpoint prototype
// ============================================================

class EmployerRecord {
  String name;
  String email;
  String role;
  String course;
  double progress;

  EmployerRecord({
    required this.name,
    required this.email,
    required this.role,
    this.course = 'Not assigned',
    this.progress = 0.0,
  });
}

class EmployerPortalScreen extends StatefulWidget {
  const EmployerPortalScreen({super.key});

  @override
  State<EmployerPortalScreen> createState() => _EmployerPortalScreenState();
}

class _EmployerPortalScreenState extends State<EmployerPortalScreen> {
  final organizationController = TextEditingController(text: 'Alchemy Studio');
  final employeeNameController = TextEditingController();
  final employeeEmailController = TextEditingController();
  final employeeRoleController = TextEditingController();
  final employeeFormKey = GlobalKey<FormState>();
  String organizationName = 'Alchemy Studio';
  String selectedCourse = 'Emotional Intelligence';
  final Set<int> selectedEmployees = {0};
  final List<EmployerRecord> employees = [
    EmployerRecord(name: 'Avery Chen', email: 'avery.chen@example.com', role: 'Team Lead', course: 'Emotional Intelligence', progress: 0.72),
    EmployerRecord(name: 'Jordan Patel', email: 'jordan.patel@example.com', role: 'People & Culture', course: 'Leadership Essentials', progress: 0.45),
    EmployerRecord(name: 'Sam Rivera', email: 'sam.rivera@example.com', role: 'Project Manager', progress: 0.18),
  ];

  final List<String> courses = const [
    'Emotional Intelligence',
    'Leadership Essentials',
    'Mindful Communication',
    'Building Team Trust',
  ];

  @override
  void dispose() {
    organizationController.dispose();
    employeeNameController.dispose();
    employeeEmailController.dispose();
    employeeRoleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assignedCount = employees.where((e) => e.course != 'Not assigned').length;
    final averageProgress = employees.isEmpty
        ? 0.0
        : employees.fold<double>(0, (sum, e) => sum + e.progress) / employees.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        title: const Text('MT / ALCHEMY  ·  EMPLOYER PORTAL'),
        actions: [
          IconButton(
            tooltip: 'Return home',
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            icon: const Icon(Icons.home_outlined),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ORGANISATION WORKSPACE', style: TextStyle(color: purple, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Help your people grow.', style: TextStyle(color: navy, fontSize: 34, height: 1.15, fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                const Text('Manage your team, assign learning pathways and see progress in one place.', style: TextStyle(color: muted, fontSize: 15, height: 1.6)),
                const SizedBox(height: 24),
                _portalPanel(
                  child: LayoutBuilder(builder: (context, box) {
                    final compact = box.maxWidth < 650;
                    final organizationField = TextField(
                      controller: organizationController,
                      decoration: const InputDecoration(labelText: 'Organisation name', hintText: 'Enter your organisation', border: OutlineInputBorder(), isDense: true),
                      onSubmitted: (_) => _saveOrganization(),
                    );
                    final saveButton = FilledButton.icon(
                      onPressed: _saveOrganization,
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Save workspace'),
                      style: FilledButton.styleFrom(backgroundColor: navy, padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17)),
                    );
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('01  ·  ORGANISATION SETUP', style: TextStyle(color: purple, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text(organizationName, style: const TextStyle(color: navy, fontSize: 21, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 14),
                      if (compact) ...[organizationField, const SizedBox(height: 10), Align(alignment: Alignment.centerLeft, child: saveButton)]
                      else Row(children: [Expanded(child: organizationField), const SizedBox(width: 12), saveButton]),
                    ]);
                  }),
                ),
                const SizedBox(height: 18),
                LayoutBuilder(builder: (context, box) {
                  final columns = box.maxWidth > 750 ? 4 : (box.maxWidth > 450 ? 2 : 1);
                  final width = (box.maxWidth - (columns - 1) * 12) / columns;
                  return Wrap(spacing: 12, runSpacing: 12, children: [
                    SizedBox(width: width, child: _statCard('TEAM MEMBERS', '${employees.length}', Icons.groups_2_outlined, lilac)),
                    SizedBox(width: width, child: _statCard('COURSES ASSIGNED', '$assignedCount', Icons.menu_book_outlined, sage)),
                    SizedBox(width: width, child: _statCard('AVERAGE PROGRESS', '${(averageProgress * 100).round()}%', Icons.trending_up, gold)),
                    SizedBox(width: width, child: _statCard('LEARNING PATHS', '${courses.length}', Icons.route_outlined, const Color(0xFFE7E1D7))),
                  ]);
                }),
                const SizedBox(height: 24),
                LayoutBuilder(builder: (context, box) {
                  final narrow = box.maxWidth < 780;
                  final team = _teamPanel();
                  final assignment = _assignmentPanel();
                  if (narrow) return Column(children: [team, const SizedBox(height: 16), assignment]);
                  return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(flex: 3, child: team), const SizedBox(width: 16), Expanded(flex: 2, child: assignment)]);
                }),
                const SizedBox(height: 20),
                _portalPanel(
                  color: navy,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(Icons.insights_outlined, color: gold, size: 28),
                    const SizedBox(width: 14),
                    const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('A note on your dashboard', style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text('This is a working prototype with sample team data. Employee records and course assignments are held in memory and are not saved to a live database.', style: TextStyle(color: Color(0xFFE5E1ED), height: 1.5, fontSize: 13)),
                    ])),
                  ]),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _teamPanel() {
    return _portalPanel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Expanded(child: Text('02  ·  YOUR PEOPLE', style: TextStyle(color: purple, fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.bold))),
        FilledButton.icon(onPressed: _showAddEmployeeDialog, style: FilledButton.styleFrom(backgroundColor: navy), icon: const Icon(Icons.person_add_alt_1, size: 17), label: const Text('Add employee')),
      ]),
      const SizedBox(height: 8),
      const Text('Select team members to assign a learning pathway.', style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
      const SizedBox(height: 14),
      if (employees.isEmpty) const Padding(padding: EdgeInsets.all(18), child: Text('No employees yet. Add your first team member to get started.')),
      ...employees.asMap().entries.map((entry) {
        final index = entry.key;
        final employee = entry.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: oat, borderRadius: BorderRadius.circular(15)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Checkbox(value: selectedEmployees.contains(index), activeColor: purple, onChanged: (checked) => setState(() { if (checked == true) { selectedEmployees.add(index); } else { selectedEmployees.remove(index); } })),
            CircleAvatar(backgroundColor: lilac, foregroundColor: navy, child: Text(employee.name.split(' ').map((part) => part.isNotEmpty ? part[0] : '').take(2).join())),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(employee.name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 3),
              Text(employee.role, style: const TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 8),
              Text(employee.course, style: const TextStyle(color: ink, fontSize: 11, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: employee.progress, minHeight: 6, backgroundColor: const Color(0xFFE2DED6), color: purple)),
              const SizedBox(height: 4),
              Text('${(employee.progress * 100).round()}% complete', style: const TextStyle(color: muted, fontSize: 10)),
            ])),
          ]),
        );
      }),
    ]));
  }

  Widget _assignmentPanel() {
    return _portalPanel(color: lilac, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('03  ·  ASSIGN LEARNING', style: TextStyle(color: purple, fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      const Text('Make growth practical.', style: TextStyle(color: navy, fontSize: 21, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Choose a pathway and assign it to the selected people.', style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
      const SizedBox(height: 18),
      DropdownButtonFormField<String>(
        value: selectedCourse,
        isExpanded: true,
        decoration: const InputDecoration(labelText: 'Learning pathway', border: OutlineInputBorder(), filled: true, fillColor: white),
        items: courses.map((course) => DropdownMenuItem(value: course, child: Text(course, overflow: TextOverflow.ellipsis))).toList(),
        onChanged: (value) { if (value != null) setState(() => selectedCourse = value); },
      ),
      const SizedBox(height: 12),
      SizedBox(width: double.infinity, child: FilledButton.icon(
        onPressed: selectedEmployees.isEmpty ? null : _assignCourse,
        style: FilledButton.styleFrom(backgroundColor: navy, padding: const EdgeInsets.symmetric(vertical: 16)),
        icon: const Icon(Icons.send_outlined),
        label: Text('Assign to ${selectedEmployees.length} selected'),
      )),
      const SizedBox(height: 18),
      const Divider(),
      const SizedBox(height: 8),
      const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.visibility_outlined, color: purple), SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Progress at a glance', style: TextStyle(color: navy, fontWeight: FontWeight.bold)), SizedBox(height: 4), Text('Use the progress bars in each employee profile to review course completion.', style: TextStyle(color: muted, fontSize: 12, height: 1.5))]))]),
    ]));
  }

  Widget _portalPanel({required Widget child, Color color = white}) {
    return Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0x14000000))), child: child);
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: navy, size: 22), const SizedBox(height: 15), Text(value, style: const TextStyle(color: navy, fontSize: 27, fontWeight: FontWeight.w800)), const SizedBox(height: 4), Text(label, style: const TextStyle(color: navy, fontSize: 9, letterSpacing: 1, fontWeight: FontWeight.bold))]));
  }

  void _saveOrganization() {
    final value = organizationController.text.trim();
    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter an organisation name.')));
      return;
    }
    setState(() => organizationName = value);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Organisation workspace updated.')));
  }

  void _assignCourse() {
    if (selectedEmployees.isEmpty) return;
    setState(() {
      for (final index in selectedEmployees) {
        if (index >= 0 && index < employees.length) {
          employees[index].course = selectedCourse;
          if (employees[index].progress == 0) employees[index].progress = 0.05;
        }
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$selectedCourse assigned to ${selectedEmployees.length} team member(s).')));
  }

  Future<void> _showAddEmployeeDialog() async {
    employeeNameController.clear();
    employeeEmailController.clear();
    employeeRoleController.clear();
    final added = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add a team member'),
        content: SizedBox(width: 420, child: Form(key: employeeFormKey, child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(controller: employeeNameController, decoration: const InputDecoration(labelText: 'Full name', border: OutlineInputBorder()), validator: (value) => value == null || value.trim().isEmpty ? 'Enter a name' : null),
          const SizedBox(height: 12),
          TextFormField(controller: employeeEmailController, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Work email', border: OutlineInputBorder()), validator: (value) => value == null || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim()) ? 'Enter a valid email' : null),
          const SizedBox(height: 12),
          TextFormField(controller: employeeRoleController, decoration: const InputDecoration(labelText: 'Role / department', border: OutlineInputBorder()), validator: (value) => value == null || value.trim().isEmpty ? 'Enter a role' : null),
        ]))),
        actions: [TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')), FilledButton(onPressed: () { if (employeeFormKey.currentState!.validate()) Navigator.pop(dialogContext, true); }, child: const Text('Add employee'))],
      ),
    );
    if (added == true && mounted) {
      setState(() {
        employees.add(EmployerRecord(name: employeeNameController.text.trim(), email: employeeEmailController.text.trim(), role: employeeRoleController.text.trim()));
        selectedEmployees
          ..clear()
          ..add(employees.length - 1);
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Team member added to this prototype.')));
    }
  }
}

// ============================================================
// 12. SECONDARY SCREENS AND VALIDATED FORM
// ============================================================

class ContentScreen extends StatefulWidget {
  final String title;

  const ContentScreen({
    super.key,
    required this.title,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.title == 'Upskilling') {
      return const LearningHubScreen();
    }
    if (widget.title == 'Store') {
      return const StoreScreen();
    }
    if (widget.title == 'Cart') {
      return const CartScreen();
    }
    if (widget.title == 'Employers') {
      return const EmployerPortalScreen();
    }
    if (widget.title == 'About') {
      return const AboutScreen();
    }
    if (widget.title == 'Services') {
      return const ServicesScreen();
    }
    if (widget.title == 'Insights') {
      return const InsightsScreen();
    }

    final isFormPage = [
      'Contact',
      'Register',
      'Login',
    ].contains(widget.title);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        title: const Text('MT / ALCHEMY'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 760),
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title.toUpperCase(),
                  style: const TextStyle(
                    color: purple,
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  heading,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  style: const TextStyle(
                    color: muted,
                    fontSize: 15,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 25),
                if (isFormPage) ...[
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                !RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                ).hasMatch(value.trim())) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: navy,
                              padding: const EdgeInsets.all(18),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Form validated successfully.',
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text('Continue'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  ContentDetails(title: widget.title),
                  const SizedBox(height: 25),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: navy,
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const ContentScreen(title: 'Register'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Get started'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get heading {
    switch (widget.title) {
      case 'Services':
        return 'Development that makes a difference.';
      case 'Upskilling':
        return 'Your next chapter starts here.';
      case 'Store':
        return 'Resources for everyday growth.';
      case 'Employers':
        return 'Build stronger teams.';
      case 'Insights':
        return 'Ideas that move people forward.';
      case 'About':
        return 'People are at the heart of change.';
      case 'Login':
        return 'Welcome back.';
      case 'Register':
        return 'Begin your transformation.';
      default:
        return 'Let’s start a conversation.';
    }
  }

  String get description {
    switch (widget.title) {
      case 'Services':
        return 'Build self-awareness, leadership, communication '
            'and healthier team cultures through practical development.';
      case 'Upskilling':
        return 'Explore learning pathways in emotional intelligence, '
            'mindfulness, leadership and effective communication.';
      case 'Store':
        return 'Discover practical workbooks, reflection journals '
            'and resources that bring learning into everyday life.';
      case 'Employers':
        return 'Organise employees, assign courses and review learning '
            'progress through a connected employer experience.';
      case 'Insights':
        return 'Discover perspectives on human development, '
            'workplace wellbeing and sustainable leadership.';
      case 'About':
        return 'MT Alchemy brings people-centred learning and '
            'development to individuals, teams and organisations.';
      case 'Login':
        return 'Continue your learning journey.';
      case 'Register':
        return 'Create your account and discover your learning pathway.';
      default:
        return 'Tell us how we can support your learning or '
            'organisational development goals.';
    }
  }
}

class ContentDetails extends StatelessWidget {
  final String title;

  const ContentDetails({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final entries = switch (title) {
      'Services' => [
        ('Emotional intelligence', 'Awareness, reflection and resilience.'),
        ('Leadership development', 'Authentic leadership and decision-making.'),
        ('Communication', 'Trust, clarity and collaboration.'),
        ('Team engagement', 'Connected and resilient workplace cultures.'),
      ],
      'Upskilling' => [
        ('Discover', 'Understand your strengths and learning goals.'),
        ('Practice', 'Build practical skills through structured lessons.'),
        ('Transform', 'Apply your learning to everyday situations.'),
        ('Impact', 'Reflect on progress and celebrate completion.'),
      ],
      'Store' => [
        ('Reflection journal', 'Prompts for everyday self-awareness.'),
        ('Leadership workbook', 'Exercises for developing leadership skills.'),
        ('Communication toolkit', 'Practical tools for stronger conversations.'),
      ],
      'Employers' => [
        ('Employee management', 'View sample team members.'),
        ('Course assignment', 'Assign learning pathways to employees.'),
        ('Progress overview', 'Review sample completion indicators.'),
      ],
      _ => [
        ('Discover', 'Explore your learning goals.'),
        ('Practice', 'Build new habits and capabilities.'),
        ('Reflect', 'Identify progress and next steps.'),
      ],
    };

    return Column(
      children: entries.map((entry) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: oat,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.auto_awesome_outlined,
                color: purple,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.$1,
                      style: const TextStyle(
                        color: navy,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      entry.$2,
                      style: const TextStyle(
                        color: muted,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ============================================================
// 13. DEDICATED ABOUT, SERVICES AND INSIGHTS PAGES
// ============================================================

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _open(BuildContext context, String page) {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => ContentScreen(title: page),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        title: const Text('MT / ALCHEMY'),
        actions: [
          TextButton(onPressed: () => _open(context, 'Services'), child: const Text('Our services')),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 64, vertical: 34),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const _Eyebrow('OUR STORY'),
              const SizedBox(height: 14),
              Text('People are at the heart of change.', style: TextStyle(color: navy, fontSize: mobile ? 34 : 48, height: 1.12, fontWeight: FontWeight.w800)),
              const SizedBox(height: 18),
              const Text('MT Alchemy helps individuals, teams and organisations build the self-awareness, emotional intelligence and leadership habits that create lasting change.', style: TextStyle(color: muted, fontSize: 17, height: 1.75)),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(mobile ? 22 : 36),
                decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(28)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('OUR BELIEF', style: TextStyle(color: gold, letterSpacing: 2, fontSize: 11, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('We don’t just run activities. We shift mindsets, behaviours, and team culture.', style: TextStyle(color: white, fontSize: mobile ? 25 : 34, height: 1.25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 14),
                  const Text('Growth becomes meaningful when insight turns into everyday practice.', style: TextStyle(color: Color(0xFFE5E5EB), height: 1.7, fontSize: 15)),
                ]),
              ),
              const SizedBox(height: 36),
              const Text('The Alchemy Cycle', style: TextStyle(color: navy, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('A simple path from understanding to sustained impact.', style: TextStyle(color: muted, height: 1.6)),
              const SizedBox(height: 20),
              LayoutBuilder(builder: (context, constraints) {
                final cols = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 440 ? 2 : 1);
                final stages = [
                  ('01', 'Discover', 'Build awareness of strengths, emotions and patterns.', lilac),
                  ('02', 'Practise', 'Try tools and skills in real situations.', sage),
                  ('03', 'Transform', 'Turn new insights into everyday habits.', gold),
                  ('04', 'Impact', 'Strengthen relationships and team culture.', const Color(0xFFE7E4DC)),
                ];
                return GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: cols, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: cols == 1 ? 1.7 : (mobile ? 1.15 : 1.1), children: stages.map((stage) => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: stage.$4, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(stage.$1, style: const TextStyle(color: navy, fontWeight: FontWeight.bold)), const Spacer(), Text(stage.$2, style: const TextStyle(color: navy, fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 7), Text(stage.$3, style: const TextStyle(color: ink, height: 1.45, fontSize: 13))]))).toList());
              }),
              const SizedBox(height: 32),
              _CallToAction(title: 'Ready to grow with intention?', buttonText: 'Explore our services', onPressed: () => _open(context, 'Services')),
            ]),
          ),
        ),
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  void _contact(BuildContext context, String service) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceEnquiryScreen(service: service)));
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 700;
    final services = [
      ('Emotional intelligence', 'Build self-awareness, emotional regulation and empathy.', Icons.psychology_outlined, lilac),
      ('Leadership development', 'Develop authentic leadership, confidence and better decisions.', Icons.emoji_people_outlined, gold),
      ('Team engagement', 'Create stronger trust, communication and collaboration.', Icons.groups_2_outlined, sage),
      ('Workplace well-being', 'Support reflection, resilience and healthier working habits.', Icons.spa_outlined, const Color(0xFFE7E4DC)),
    ];
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(backgroundColor: oat, foregroundColor: navy, title: const Text('MT / ALCHEMY')),
      body: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 64, vertical: 34), child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1120), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _Eyebrow('HOW WE WORK'),
        const SizedBox(height: 14),
        Text('Development that makes a difference.', style: TextStyle(color: navy, fontSize: mobile ? 34 : 48, height: 1.12, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        const Text('Practical, people-centred programmes help turn understanding into behaviours that make work and relationships better.', style: TextStyle(color: muted, fontSize: 17, height: 1.7)),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, constraints) {
          final cols = constraints.maxWidth > 800 ? 2 : 1;
          return GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: cols, crossAxisSpacing: 18, mainAxisSpacing: 18, childAspectRatio: cols == 2 ? 1.55 : 1.25, children: services.map((service) => Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 48, height: 48, decoration: BoxDecoration(color: service.$4, borderRadius: BorderRadius.circular(15)), child: Icon(service.$3, color: navy)), const Spacer(), Text(service.$1, style: const TextStyle(color: navy, fontSize: 22, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text(service.$2, style: const TextStyle(color: muted, height: 1.5)), const SizedBox(height: 12), Align(alignment: Alignment.centerLeft, child: TextButton.icon(onPressed: () => _contact(context, service.$1), icon: const Icon(Icons.arrow_forward, size: 16), label: const Text('Enquire about this service')))]))).toList());
        }),
        const SizedBox(height: 30),
        Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: lilac, borderRadius: BorderRadius.circular(22)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('A tailored approach', style: TextStyle(color: navy, fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('Programmes can be shaped around your team’s goals, context and desired outcomes. Send an enquiry and tell us what you want to change.', style: TextStyle(color: ink, height: 1.6))])),
      ])))),
    );
  }
}

class ServiceEnquiryScreen extends StatefulWidget {
  final String service;
  const ServiceEnquiryScreen({super.key, required this.service});
  @override
  State<ServiceEnquiryScreen> createState() => _ServiceEnquiryScreenState();
}

class _ServiceEnquiryScreenState extends State<ServiceEnquiryScreen> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _organisation = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _organisation.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(
        backgroundColor: oat,
        foregroundColor: navy,
        title: const Text('Service enquiry'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Eyebrow('LET’S TALK'),
                  const SizedBox(height: 12),
                  Text(widget.service, style: const TextStyle(color: navy, fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Share a few details and we’ll have a clearer starting point for your enquiry.', style: TextStyle(color: muted, height: 1.6)),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(labelText: 'Your name', border: OutlineInputBorder()),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your name' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email address', border: OutlineInputBorder()),
                    validator: (v) => v == null || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim()) ? 'Enter a valid email address' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _organisation,
                    decoration: const InputDecoration(labelText: 'Organisation (optional)', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _message,
                    maxLines: 4,
                    decoration: const InputDecoration(labelText: 'What would you like support with?', border: OutlineInputBorder()),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Please add a short message' : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          showDialog<void>(
                            context: context,
                            builder: (dialogContext) => AlertDialog(
                              title: const Text('Enquiry preview'),
                              content: const Text('Your form is valid. This prototype does not send enquiries to a server yet.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Done'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Review enquiry'),
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
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  static const articles = <(String, String, String, String, Color)>[
    (
    'EMOTIONAL INTELLIGENCE',
    'Self-awareness: the starting point for change',
    'A short reflection on noticing emotions, patterns and the choices available to us.',
    'Try a simple pause: name what you are feeling, notice what triggered it, and decide what response would serve you best. Self-awareness is not about judging yourself; it is about creating enough space to choose your next step.',
    lilac,
    ),
    (
    'LEADERSHIP',
    'Small habits that build trust in teams',
    'How consistent everyday behaviours can shape stronger working relationships.',
    'Trust is built through repeated signals: listening without rushing, following through on commitments, making expectations clear and acknowledging when something has gone wrong. Small behaviours, practised consistently, shape team culture.',
    sage,
    ),
    (
    'WORKPLACE WELL-BEING',
    'Reflection as a practical work skill',
    'Make reflection a useful part of the working week rather than another task.',
    'A short reflection at the end of a meeting or week can help turn experience into learning. Ask: What went well? What felt difficult? What did I learn? What will I try next time? Keep the next step small enough to practise.',
    gold,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(backgroundColor: oat, foregroundColor: navy, title: const Text('MT / ALCHEMY')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 64, vertical: 34),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Eyebrow('THE JOURNAL'),
                const SizedBox(height: 14),
                Text('Ideas that move people forward.', style: TextStyle(color: navy, fontSize: mobile ? 34 : 48, height: 1.12, fontWeight: FontWeight.w800)),
                const SizedBox(height: 16),
                const Text('Thoughts and practical prompts for emotional intelligence, leadership and healthier working relationships.', style: TextStyle(color: muted, fontSize: 17, height: 1.7)),
                const SizedBox(height: 30),
                ...articles.map((article) => Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: EdgeInsets.all(mobile ? 20 : 28),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(color: article.$5, borderRadius: BorderRadius.circular(30)),
                        child: Text(article.$1, style: const TextStyle(color: navy, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 15),
                      Text(article.$2, style: const TextStyle(color: navy, fontSize: 24, height: 1.25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 9),
                      Text(article.$3, style: const TextStyle(color: muted, fontSize: 15, height: 1.6)),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(
                            builder: (_) => InsightArticleScreen(
                              category: article.$1,
                              title: article.$2,
                              summary: article.$3,
                              body: article.$4,
                              accent: article.$5,
                            ),
                          )),
                          icon: const Icon(Icons.arrow_forward, size: 16),
                          label: const Text('Read article'),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InsightArticleScreen extends StatelessWidget {
  final String category;
  final String title;
  final String summary;
  final String body;
  final Color accent;

  const InsightArticleScreen({super.key, required this.category, required this.title, required this.summary, required this.body, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: oat,
      appBar: AppBar(backgroundColor: oat, foregroundColor: navy, title: const Text('MT / ALCHEMY')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 820),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(24)),
                  child: Text(category, style: const TextStyle(color: navy, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 18),
                Text(title, style: const TextStyle(color: navy, fontSize: 34, height: 1.2, fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                Text(summary, style: const TextStyle(color: muted, fontSize: 17, height: 1.65)),
                const Divider(height: 36),
                Text(body, style: const TextStyle(color: ink, fontSize: 16, height: 1.9)),
                const SizedBox(height: 26),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: oat, borderRadius: BorderRadius.circular(18)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A moment to reflect', style: TextStyle(color: navy, fontSize: 19, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('What is one small action you could practise this week?', style: TextStyle(color: muted, height: 1.6)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  const _Eyebrow(this.text);
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(color: purple, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.bold));
}

class _CallToAction extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  const _CallToAction({required this.title, required this.buttonText, required this.onPressed});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(color: gold, borderRadius: BorderRadius.circular(22)),
    child: Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        Text(title, style: const TextStyle(color: navy, fontSize: 22, fontWeight: FontWeight.bold)),
        FilledButton(onPressed: onPressed, style: FilledButton.styleFrom(backgroundColor: navy, foregroundColor: white), child: Text(buttonText)),
      ],
    ),
  );
}
