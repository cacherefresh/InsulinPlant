import 'package:flutter/material.dart';

import '../data/sources.dart';
import '../widgets/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBody(children: [
      Lead(
        headline: 'Insulin grown in safflower seeds. Tested in people in 2009. '
            'The core patent has expired.',
        body: 'For Diabetics, By Diabetics. These are my research notes on making '
            'human insulin in plants. Start here, then use the tabs below.',
      ),
      InfoCard(
        highlight: true,
        icon: Icons.shield_outlined,
        title: 'No one can use the core patent to block this',
        body: 'The core patent has expired, so no one, Eli Lilly and Company '
            'included, can use it to block this. What remains is one extraction '
            'license (Botaneco) and the FDA pathway.',
        sources: [Sources.patent],
      ),
      SectionTitle('The five facts'),
      InfoCard(
        value: '1',
        title: 'It worked in people',
        body: 'SemBioSys\'s safflower insulin (SBS-1000) ran a Phase I/II trial in '
            '23 healthy volunteers. It was bioequivalent to Humulin S on total '
            'insulin exposure, peak insulin concentration, and total glucose '
            'infused.',
        sources: [Sources.phase12Results],
      ),
      InfoCard(
        value: '2',
        title: 'The core patent has expired',
        body: 'US 7,547,821, "Methods for the production of insulin in plants," '
            'is listed as Expired – Fee Related. Its follow-on application is '
            'listed as Abandoned.',
        sources: [Sources.patent, Sources.continuation],
      ),
      InfoCard(
        value: '3',
        title: 'The FDA has already looked at it',
        body: 'After a 2007 FDA meeting, SemBioSys reported no issues preventing '
            'safflower from being used to make the insulin. The FDA path has since '
            'changed: since March 2020 insulin is regulated as a biologic, so the '
            'route today is a 351(k) biosimilar.',
        badges: [Tag.claim()],
        sources: [Sources.fdaMeeting2007, Sources.biologicRule2020],
      ),
      InfoCard(
        value: '4',
        title: 'It was projected to be much cheaper',
        body: 'SemBioSys projected 70% lower capital cost and 40% lower product '
            'cost than conventional insulin manufacturing. That is cheaper, '
            'not free.',
        badges: [Tag.claim()],
        sources: [Sources.globe2006],
      ),
      InfoCard(
        value: '5',
        title: 'Business events ended it, not the science',
        body: 'An option deal fell through, a competitor bought a cheap factory '
            'instead, a joint venture in China collapsed, and the company shut '
            'down in 2012. The full timeline is on the Patent tab.',
        sources: [Sources.optionLapses, Sources.windDown],
      ),
      SectionTitle('How the safflower route works'),
      InfoCard(
        icon: Icons.spa_outlined,
        title: 'From seed to vial',
        bullets: [
          'The insulin gene is placed in safflower so the seed makes the protein.',
          'The seeds are grown under APHIS-permitted confinement.',
          'Oil bodies (oleosomes) carrying the protein are separated out of the '
              'crushed seed in water.',
          'The protein is purified and converted to active human insulin.',
          'It is formulated, filled, and released under FDA rules.',
        ],
        sources: [Sources.patent, Sources.aphisPermits],
      ),
      SectionTitle('Division of labor'),
      InfoCard(
        highlight: true,
        icon: Icons.handshake_outlined,
        title: 'We don\'t reinvent the wheel',
        body: 'My part is growing the plant and getting the insulin out of it. '
            'Mark Cuban Cost Plus Drug Company already runs a 22,000 sq ft sterile '
            'fill-finish facility in Dallas with aseptic robotic filling lines, and '
            'its own pharmacy. Fill-finish and distribution are theirs to do, not '
            'ours to rebuild.',
        bullets: [
          'Ours: grow, extract, purify to drug substance.',
          'Cost Plus: sterile fill-finish and distribution.',
          'Open question to ask them: can those lines fill insulin?',
        ],
        sources: [Sources.costPlus, Sources.costPlusFacility],
      ),
      InfoCard(
        icon: Icons.savings_outlined,
        title: 'Partnering on fill-finish is the cheap path',
        body: 'In my cost model, a lean build that partners on fill-finish is '
            'roughly \$120M over about 4 years. A full build with our own '
            'fill-finish is roughly \$380M over 8–10 years. The hardest step left on '
            'our side is purification.',
        badges: [Tag.estimate()],
      ),
    ]);
  }
}
