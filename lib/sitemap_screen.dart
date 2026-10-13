
import 'package:flutter/material.dart';

const Color _navy = Color(0xFF202B48);
const Color _oat = Color(0xFFF4F0E8);
const Color _purple = Color(0xFF7664A5);
const Color _lilac = Color(0xFFDCD5EA);
const Color _sage = Color(0xFFB9C8B8);

class SitemapScreen extends StatelessWidget {
  final ValueChanged<String> onNavigate;

  const SitemapScreen({
    super.key,
    required this.onNavigate,
  });

  static const sections = [
    {
      'title': 'Main website',
      'pages': [
        {'name': 'Home', 'route': 'Home', 'icon': Icons.home_outlined},
        {'name': 'About', 'route': 'About', 'icon': Icons.info_outline},
        {'name': 'Services', 'route': 'Services', 'icon': Icons.auto_awesome_outlined},
        {'name': 'Insights', 'route': 'Insights', 'icon': Icons.lightbulb_outline},
        {'name': 'Contact', 'route': 'Contact', 'icon': Icons.mail_outline},
      ],
    },
    {
      'title': 'Learning and shopping',
      'pages': [
        {'name': 'Learning Hub', 'route': 'Upskilling', 'icon': Icons.school_outlined},
        {'name': 'Shop', 'route': 'Store', 'icon': Icons.storefront_outlined},
        {'name': 'Shopping Cart', 'route': 'Cart', 'icon': Icons.shopping_cart_outlined},
      ],
    },
    {
      'title': 'Accounts and organisations',
      'pages': [
        {'name': 'Sign In', 'route': 'Login', 'icon': Icons.login},
        {'name': 'Register', 'route': 'Register', 'icon': Icons.person_add_outlined},
        {'name': 'Employer Portal', 'route': 'Employers', 'icon': Icons.business_outlined},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _oat,
      appBar: AppBar(
        backgroundColor: _oat,
        foregroundColor: _navy,
        title: const Text('MT / ALCHEMY — SITEMAP'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Explore MT Alchemy',
                  style: TextStyle(
                    color: _navy,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Browse the pages and experiences available on our platform.',
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _navy,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.auto_awesome, color: Colors.white, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'MT ALCHEMY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        'A studio for human potential',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                for (var i = 0; i < sections.length; i++) ...[
                  Text(
                    sections[i]['title'] as String,
                    style: const TextStyle(
                      color: _purple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth >= 650 ? 3 : 1;
                      final pages = sections[i]['pages'] as List<Map<String, Object>>;
                      final width = (constraints.maxWidth - (columns - 1) * 12) / columns;

                      return Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: pages.map((page) {
                          return SizedBox(
                            width: width,
                            child: Card(
                              color: i == 0
                                  ? Colors.white
                                  : i == 1
                                  ? _lilac
                                  : _sage,
                              elevation: 0,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () => onNavigate(page['route'] as String),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(
                                        page['icon'] as IconData,
                                        color: _navy,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          page['name'] as String,
                                          style: const TextStyle(
                                            color: _navy,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: _navy,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
