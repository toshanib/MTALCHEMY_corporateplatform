
import 'package:flutter/material.dart';
import 'auth_service.dart';

class AdminPortalScreen extends StatelessWidget {
  const AdminPortalScreen({super.key});

  static const Color navy = Color(0xFF292F4B);
  static const Color background = Color(0xFFF5F1E9);
  static const Color purple = Color(0xFF7774A8);

  Future<void> _signOut(BuildContext context) async {
    await AuthService().signOut();

    if (!context.mounted) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      '/',
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: const Text('MT Alchemy | Admin Portal'),
        actions: [
          TextButton.icon(
            onPressed: () => _signOut(context),
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text(
              'Sign out',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Administrator Dashboard',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage users, learning content, and platform activity.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 28),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns =
                    constraints.maxWidth >= 750 ? 3 : 1;
                    final cardWidth =
                        (constraints.maxWidth - (columns - 1) * 16) /
                            columns;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _dashboardCard(
                          width: cardWidth,
                          icon: Icons.people_outline,
                          title: 'User Management',
                          description:
                          'Review learner and employer accounts.',
                          onTap: () => _showMessage(
                            context,
                            'User management will be connected to Firestore next.',
                          ),
                        ),
                        _dashboardCard(
                          width: cardWidth,
                          icon: Icons.menu_book_outlined,
                          title: 'Learning Content',
                          description:
                          'Manage courses and learning pathways.',
                          onTap: () => _showMessage(
                            context,
                            'Learning content management is coming next.',
                          ),
                        ),
                        _dashboardCard(
                          width: cardWidth,
                          icon: Icons.analytics_outlined,
                          title: 'Platform Overview',
                          description:
                          'View platform activity and statistics.',
                          onTap: () => _showMessage(
                            context,
                            'Platform analytics will be connected next.',
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 28),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.admin_panel_settings_outlined,
                          size: 36,
                          color: purple,
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Administrator access',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: navy,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'You are viewing the administrator dashboard. '
                                    'Management actions are placeholders until '
                                    'connected to the database.',
                              ),
                            ],
                          ),
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
    );
  }

  Widget _dashboardCard({
    required double width,
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 34, color: purple),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                const Text(
                  'Open section →',
                  style: TextStyle(
                    color: purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
