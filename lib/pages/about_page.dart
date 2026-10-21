import 'package:flutter/material.dart';

import '../widgets/common.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About me')),
      body: const PageBody(children: [
        Lead(
          headline: 'Rob Coffman',
          body: 'Fractional CTO, consultant, and senior software engineer. Type 1 '
              'diabetic since I was eight. That is why I am working on insulin.',
        ),
        RobPlaceholder('Your personal paragraph: why this matters to you and what '
            'living with Type 1 has cost. Nothing here was written for you.'),
        SectionTitle('What I bring'),
        InfoCard(
          icon: Icons.biotech_outlined,
          title: 'Bioinformatics: NIH',
          body: 'Sequence and alignment pipelines (SAM/BAM, BLAST, MUMmer) in the '
              'Strategic Programs Division, first as a student and then on staff.',
          child: RobPlaceholder('Confirm exact years and job title.'),
        ),
        InfoCard(
          icon: Icons.account_balance_outlined,
          title: 'Regulated financial systems: Euler Hermes / Allianz',
          body: 'About ten years as lead software engineer across financial, policy, '
              'claims, actuarial, legal, audit, and regulatory systems. Sat in board '
              'meetings as the subject-matter-expert engineer.',
          child: RobPlaceholder('Confirm exact years and title.'),
        ),
        InfoCard(
          icon: Icons.security_outlined,
          title: 'Mission-critical defense',
          body: 'Counter-drone, airport, and stadium security work: real-time sensor '
              'ingestion, geospatial data, hard latency budgets, immutable logs.',
        ),
        InfoCard(
          icon: Icons.school_outlined,
          title: 'Education systems',
          body: 'Shipped education software across a dozen-plus states with a '
              '14-person team. Certificate in AI & Business, Johns Hopkins, 2026.',
          child: RobPlaceholder('Confirm the company name.'),
        ),
        SectionTitle('Teaching'),
        InfoCard(
          icon: Icons.record_voice_over_outlined,
          title: 'Making hard subjects understandable',
          bullets: [
            'I let medical students sit in on my endocrinology appointments at the '
                'University of Maryland.',
            'I teach general nutrition classes at a martial arts gym, alongside a '
                'licensed nutritionist.',
          ],
        ),
        SectionTitle('Why this app'),
        InfoCard(
          icon: Icons.menu_book_outlined,
          title: 'My research notes, made readable',
          body: 'Plant-made insulin is the mission. This app collects what I have '
              'verified so far. Every number links to its source or is marked as an '
              'estimate.',
        ),
        RobPlaceholder('Your GitHub profile link and any other links you want '
            'public. No email or phone is shown here on purpose.'),
      ]),
    );
  }
}
