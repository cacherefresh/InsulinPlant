import 'package:flutter/material.dart';

import '../data/capacity.dart';
import '../data/sources.dart';
import '../widgets/common.dart';

class FarmSizePage extends StatelessWidget {
  const FarmSizePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usT1d = phases[2];
    final worldT1d = phases[4];
    return PageBody(children: [
      Lead(
        headline: 'Every Type 1 diabetic in America: about '
            '${(usT1d.acres / Capacity.acresPerSqMile).toStringAsFixed(1)} square '
            'miles of safflower.',
        body: 'Land needed, from one small greenhouse up to the world. All figures '
            'assume half the insulin is lost in purification.',
      ),
      const InfoCard(
        icon: Icons.calculate_outlined,
        title: 'The math',
        bullets: [
          'SemBioSys claim: more than 1 kg of insulin per acre of safflower, '
              'enough for 2,500 patients for a year.',
          'Check: 1 kg × 28.8 IU/mg ÷ 2,500 ÷ 365 ≈ 31.6 IU per patient per day. '
              'A typical adult Type 1 dose is about 0.5 IU/kg/day, or roughly 35 IU '
              'for 70 kg. The claim holds up.',
          'Assume 50% is lost in purification, which leaves about 1,250 patients '
              'per acre.',
        ],
        badges: [Tag.claim(), Tag('50% loss = estimate')],
        sources: [Sources.globe2006],
      ),
      const SectionTitle('The phases'),
      for (final (i, p) in phases.indexed) _PhaseCard(step: i + 1, phase: p),
      const SectionTitle('Compared with corn'),
      InfoCard(
        icon: Icons.grass_outlined,
        value: '${(Capacity.cornShare(usT1d.patients) * 100).toStringAsFixed(4)}%',
        title: 'of US corn acreage would supply every American Type 1',
        body: 'The US planted ${commas(Capacity.usCornAcres / 1e6)} million acres of '
            'corn in 2026. Every Type 1 on Earth would need about '
            '${commas(worldT1d.acres)} acres, which is '
            '${(Capacity.cornShare(worldT1d.patients) * 100).toStringAsFixed(3)}% '
            'of it.',
        sources: const [Sources.corn2026],
        child: _CornBar(share: Capacity.cornShare(worldT1d.patients)),
      ),
      const InfoCard(
        icon: Icons.house_siding_outlined,
        title: 'Growing indoors could shrink this further',
        body: 'These numbers are for open-field safflower: one crop a year. An '
            'enclosed facility, which APHIS confinement requires anyway, could add '
            'more crop cycles a year, stacked tiers, and no aisles. A contained '
            'acre could plausibly do the work of 8–20 open-field acres. Land is not '
            'the bottleneck. Purification is.',
        badges: [Tag.estimate()],
        sources: [Sources.aphisPermits],
      ),
      const InfoCard(
        icon: Icons.history_edu_outlined,
        title: 'SemBioSys\'s own world figure',
        body: 'In 2006 the company said fewer than 16,000 acres of safflower could '
            'meet projected global insulin demand for 2010.',
        badges: [Tag.claim()],
        sources: [Sources.globe2006],
      ),
    ]);
  }
}

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({required this.step, required this.phase});
  final int step;
  final Phase phase;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;
    return InfoCard(
      value: footprint(phase.acres),
      title: '$step · ${phase.name}',
      body: phase.who,
      bullets: [?phase.note],
      badges: [if (phase.illustrative) const Tag('Illustrative size', warning: false)],
      sources: phase.sources,
      child: Text(
        'Without the 50% purification loss: ${footprint(phase.acresNameplate)}',
        style: t.bodySmall?.copyWith(color: c.onSurfaceVariant),
      ),
    );
  }
}

/// A bar for all US corn with a sliver for the world's Type 1 supply. The
/// sliver is drawn at a minimum width so it stays visible.
class _CornBar extends StatelessWidget {
  const _CornBar({required this.share});
  final double share;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(builder: (context, box) {
          final w = (box.maxWidth * share).clamp(3.0, box.maxWidth);
          return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 28,
              child: Row(children: [
                Container(width: w, color: c.primary),
                Expanded(child: Container(color: Colors.amber.shade300)),
              ]),
            ),
          );
        }),
        const SizedBox(height: 6),
        Wrap(spacing: 16, children: [
          _Key(color: c.primary, label: 'World Type 1 supply (bar widened to show)'),
          _Key(color: Colors.amber.shade300, label: 'US corn, 2026'),
        ]),
        const SizedBox(height: 2),
        Text('At true scale the green sliver would be thinner than a pixel.',
            style: t.bodySmall?.copyWith(color: c.onSurfaceVariant)),
      ],
    );
  }
}

class _Key extends StatelessWidget {
  const _Key({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 10, height: 10, color: color),
      const SizedBox(width: 6),
      Flexible(child: Text(label, style: Theme.of(context).textTheme.bodySmall)),
    ]);
  }
}
