import 'package:flutter/material.dart';

import '../data/sources.dart';
import '../widgets/common.dart';

class EmergingPage extends StatelessWidget {
  const EmergingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBody(children: [
      Lead(
        headline: 'Other routes I follow',
        body: 'These are promising, but none has reached a Phase I/II human trial. '
            'They are not what we are doing. We are doing safflower, because it '
            'worked in people and its core patent has expired.',
      ),
      InfoCard(
        highlight: true,
        icon: Icons.eco_outlined,
        title: 'Chloroplast insulin in lettuce and tobacco',
        body: 'Henry Daniell\'s lab (University of Central Florida, now the '
            'University of Pennsylvania) puts a proinsulin gene into the leaf\'s '
            'chloroplasts. The patient swallows freeze-dried leaf. The plant cell '
            'wall protects the protein through the stomach, and gut microbes '
            'release it in the intestine.',
        sources: [Sources.daniellPenn, Sources.pennToday],
      ),
      InfoCard(
        icon: Icons.compare_arrows,
        title: 'Safflower vs. chloroplast lettuce',
        child: FactTable([
          ('Protein made in', 'Seed  vs.  Leaf'),
          ('Product', 'Injectable insulin  vs.  Oral proinsulin'),
          ('Purification', 'Required  vs.  Not needed (you eat the cell)'),
          ('Cold chain', 'Yes  vs.  Freeze-dried leaf held up to 1 year at room temp'),
          ('Human data', 'Phase I/II, bioequivalent  vs.  Animal studies only'),
        ]),
      ),
      SectionTitle('What has been shown'),
      InfoCard(
        title: 'Very high expression',
        body: 'Proinsulin fusion reached about 47% of total leaf protein in tobacco '
            'and 53% in lettuce (older leaves).',
        sources: [Sources.daniell2011],
      ),
      InfoCard(
        title: 'Mouse results',
        bullets: [
          '2007: oral CTB-proinsulin protected NOD mice against insulitis, the '
              'immune attack on the pancreas.',
          '2023: oral plant-cell proinsulin lowered blood sugar in diabetic mice '
              'without dropping below the normal fasting range. The injected insulin '
              'in the same study did go below it.',
        ],
        sources: [Sources.daniell2007, Sources.daniell2023],
      ),
      InfoCard(
        title: 'Built-in containment',
        body: 'Chloroplast genes are mostly inherited through the mother plant, not '
            'pollen, so they rarely spread. Rarely is not never, and leakage can '
            'rise under heat stress. It adds to physical containment but does not '
            'replace it.',
        sources: [Sources.containment],
      ),
      SectionTitle('Why it is not our main route yet'),
      InfoCard(
        icon: Icons.report_outlined,
        title: 'Honest limits',
        bullets: [
          'It has not been tested in humans. The stated next step is dogs.',
          'No dose-escalation study yet. For Type 1, dose-response is the product.',
          'The authors call oral pharmacokinetics "a major challenge that requires '
              'further investigations."',
          'Proinsulin is a much weaker agonist than insulin.',
          'Type 1 needs precise dosing. Whether oral proinsulin can provide it is '
              'unknown.',
        ],
        sources: [Sources.daniell2023],
      ),
    ]);
  }
}
