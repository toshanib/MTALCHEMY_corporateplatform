
import 'package:flutter/material.dart';

const Color weatherNavy = Color(0xFF24213D);
const Color weatherPurple = Color(0xFF7655A6);
const Color weatherOat = Color(0xFFF7F3EC);
const Color weatherMuted = Color(0xFF777386);

enum TeamMood {
  energized,
  balanced,
  overwhelmed,
  disconnected,
}

extension TeamMoodDetails on TeamMood {
  String get label {
    switch (this) {
      case TeamMood.energized:
        return 'Energized';
      case TeamMood.balanced:
        return 'Balanced';
      case TeamMood.overwhelmed:
        return 'Overwhelmed';
      case TeamMood.disconnected:
        return 'Disconnected';
    }
  }

  String get weather {
    switch (this) {
      case TeamMood.energized:
        return 'Sunny';
      case TeamMood.balanced:
        return 'Partly cloudy';
      case TeamMood.overwhelmed:
        return 'Cloudy';
      case TeamMood.disconnected:
        return 'Rainy';
    }
  }

  String get description {
    switch (this) {
      case TeamMood.energized:
        return 'Feeling positive, motivated and ready to contribute.';
      case TeamMood.balanced:
        return 'Doing okay, with some challenges to work through.';
      case TeamMood.overwhelmed:
        return 'Could benefit from breathing room and manageable priorities.';
      case TeamMood.disconnected:
        return 'Could benefit from connection, recognition and support.';
    }
  }

  IconData get icon {
    switch (this) {
      case TeamMood.energized:
        return Icons.wb_sunny_rounded;
      case TeamMood.balanced:
        return Icons.cloud_queue_rounded;
      case TeamMood.overwhelmed:
        return Icons.cloud_rounded;
      case TeamMood.disconnected:
        return Icons.umbrella_rounded;
    }
  }

  Color get color {
    switch (this) {
      case TeamMood.energized:
        return const Color(0xFF39734A);
      case TeamMood.balanced:
        return const Color(0xFF4E6398);
      case TeamMood.overwhelmed:
        return const Color(0xFF94702C);
      case TeamMood.disconnected:
        return const Color(0xFFA34E6A);
    }
  }

  Color get background {
    switch (this) {
      case TeamMood.energized:
        return const Color(0xFFE4EFE5);
      case TeamMood.balanced:
        return const Color(0xFFE5EAF7);
      case TeamMood.overwhelmed:
        return const Color(0xFFF8EBCB);
      case TeamMood.disconnected:
        return const Color(0xFFF3DFE5);
    }
  }

  String get suggestion {
    switch (this) {
      case TeamMood.energized:
        return 'Build on this momentum with a team learning session or a chance to celebrate recent wins.';
      case TeamMood.balanced:
        return 'Try a short team reflection: what is working well, and what would make next week easier?';
      case TeamMood.overwhelmed:
        return 'Consider a workload check-in, clearer priorities and a meeting-free focus block.';
      case TeamMood.disconnected:
        return 'Create space for one-to-one conversations, peer appreciation and collaborative activities.';
    }
  }
}

class TeamEmotionalWeatherScreen extends StatefulWidget {
  const TeamEmotionalWeatherScreen({super.key});

  @override
  State<TeamEmotionalWeatherScreen> createState() =>
      _TeamEmotionalWeatherScreenState();
}

class _TeamEmotionalWeatherScreenState
    extends State<TeamEmotionalWeatherScreen> {
  // Illustrative sample check-ins for the coursework demonstration.
  final Map<TeamMood, int> _moodCounts = {
    TeamMood.energized: 5,
    TeamMood.balanced: 3,
    TeamMood.overwhelmed: 2,
    TeamMood.disconnected: 1,
  };

  TeamMood? _selectedMood;
  bool _submitted = false;

  int get _totalResponses =>
      _moodCounts.values.fold(0, (sum, count) => sum + count);

  TeamMood get _leadingMood {
    return TeamMood.values.reduce(
          (a, b) => _moodCounts[a]! >= _moodCounts[b]! ? a : b,
    );
  }

  void _submitCheckIn() {
    if (_selectedMood == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Choose how you are feeling first.'),
        ),
      );
      return;
    }

    setState(() {
      _moodCounts[_selectedMood!] =
          _moodCounts[_selectedMood!]! + 1;
      _submitted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your check-in has been added to the demo summary.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final leadingMood = _leadingMood;

    return Scaffold(
      backgroundColor: weatherOat,
      appBar: AppBar(
        backgroundColor: weatherOat,
        foregroundColor: weatherNavy,
        elevation: 0,
        title: const Text('TEAM EMOTIONAL WEATHER'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1050),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'A MOMENT TO CHECK IN',
                  style: TextStyle(
                    color: weatherPurple,
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'How is your team feeling?',
                  style: TextStyle(
                    color: weatherNavy,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Understand the emotional climate, notice patterns '
                      'and create space for meaningful conversations.',
                  style: TextStyle(
                    color: weatherMuted,
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),

                // Current team weather
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: weatherNavy,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'YOUR TEAM RIGHT NOW',
                        style: TextStyle(
                          color: Color(0xFFD9C6F3),
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Icon(
                            leadingMood.icon,
                            color: const Color(0xFFFFD98A),
                            size: 52,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  leadingMood.weather,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${leadingMood.label} is the most common check-in',
                                  style: const TextStyle(
                                    color: Color(0xFFE2DDEE),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$_totalResponses sample check-ins · '
                              'Illustrative demo data',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'THE TEAM CLIMATE',
                  style: TextStyle(
                    color: weatherNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth > 650 ? 4 : 2;
                    final cardWidth =
                        (constraints.maxWidth - (columns - 1) * 12) /
                            columns;

                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: TeamMood.values.map((mood) {
                        final count = _moodCounts[mood]!;
                        final percentage = _totalResponses == 0
                            ? 0
                            : (count / _totalResponses * 100).round();

                        return SizedBox(
                          width: cardWidth,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: mood.background,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  mood.icon,
                                  color: mood.color,
                                  size: 30,
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  mood.label,
                                  style: TextStyle(
                                    color: mood.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '$count responses',
                                  style: const TextStyle(
                                    color: weatherNavy,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: _totalResponses == 0
                                        ? 0
                                        : count / _totalResponses,
                                    minHeight: 7,
                                    backgroundColor:
                                    Colors.white.withValues(alpha: 0.8),
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(
                                      mood.color,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '$percentage%',
                                  style: TextStyle(
                                    color: mood.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 28),

                // Employee check-in
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'YOUR CHECK-IN',
                        style: TextStyle(
                          color: weatherPurple,
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'How are you feeling at work today?',
                        style: TextStyle(
                          color: weatherNavy,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Choose the option that best reflects how you feel.',
                        style: TextStyle(
                          color: weatherMuted,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...TeamMood.values.map((mood) {
                        final selected = _selectedMood == mood;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          decoration: BoxDecoration(
                            color: selected
                                ? mood.background
                                : weatherOat,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: selected
                                  ? mood.color
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          child: RadioListTile<TeamMood>(
                            value: mood,
                            groupValue: _selectedMood,
                            activeColor: mood.color,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            title: Text(
                              '${mood.weather} — ${mood.label}',
                              style: const TextStyle(
                                color: weatherNavy,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              mood.description,
                              style: const TextStyle(
                                color: weatherMuted,
                                height: 1.4,
                              ),
                            ),
                            onChanged: _submitted
                                ? null
                                : (value) {
                              setState(() {
                                _selectedMood = value;
                              });
                            },
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: weatherNavy,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 17,
                            ),
                          ),
                          onPressed: _submitted ? null : _submitCheckIn,
                          icon: const Icon(Icons.wb_cloudy_outlined),
                          label: Text(
                            _submitted
                                ? 'Check-in submitted'
                                : 'Submit my check-in',
                          ),
                        ),
                      ),
                      if (_submitted) ...[
                        const SizedBox(height: 12),
                        const Text(
                          'Thank you for checking in. Your selection '
                              'has updated this demonstration.',
                          style: TextStyle(
                            color: weatherMuted,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Suggested action
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAE5F5),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: weatherPurple,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'A SMALL SHIFT TO TRY',
                              style: TextStyle(
                                color: weatherPurple,
                                fontSize: 11,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        leadingMood.suggestion,
                        style: const TextStyle(
                          color: weatherNavy,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Wellbeing check-ins should be voluntary. '
                      'Display only aggregated team results in a real deployment, '
                      'and avoid using mood data to evaluate individual employees.',
                  style: TextStyle(
                    color: weatherMuted,
                    fontSize: 12,
                    height: 1.6,
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
