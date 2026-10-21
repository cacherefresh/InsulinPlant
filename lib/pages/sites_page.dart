import 'package:flutter/material.dart';

import '../data/sources.dart';
import '../widgets/common.dart';

class SitesPage extends StatelessWidget {
  const SitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBody(children: [
      Lead(
        headline: 'The buildings already exist, and some sold cheap.',
        body: 'Large automated greenhouses were overbuilt during the cannabis boom, '
            'and a plant-made-pharma plant was sold off. These are places I have '
            'looked at. None of them is a deal.',
      ),
      InfoCard(
        icon: Icons.wb_sunny_outlined,
        title: 'Aurora Sun, Medicine Hat, Alberta',
        body: 'A very large automated cannabis greenhouse built by Aurora Cannabis. '
            'Construction stopped in 2019 when cannabis demand fell short.',
        sources: [
          Sources.auroraAnnounce,
          Sources.auroraHalt,
          Sources.auroraCost,
          Sources.auroraBevo,
        ],
        child: FactTable([
          ('Size', 'Announced at 1.2M sq ft; later reported at about 1.6–1.7M'),
          ('Spent', 'About \$200M reported'),
          ('Halted', 'November 2019'),
          ('Sold', 'July 2023, to Bevo Farms (Bevo Agtech)'),
          ('Price', 'Base price not disclosed. Up to C\$15M more, contingent on '
              'Bevo\'s results'),
          ('Today', 'Owned and run by Bevo, so not for sale'),
        ]),
      ),
      InfoCard(
        highlight: true,
        icon: Icons.lightbulb_outline,
        title: 'The idea: re-use cannabis-boom greenhouses',
        body: 'Facilities like Aurora Sun are an asset class, not a one-off. '
            'Automated bench movement means fewer aisles and less human contact, '
            'which in a pharma setting is contamination control. The first question '
            'before any diligence: can the building meet APHIS confinement? A '
            'cannabis greenhouse is built to keep people out, not pollen in.',
        sources: [Sources.aphisPermits],
      ),
      InfoCard(
        icon: Icons.factory_outlined,
        title: 'Former iBio plant, Bryan, Texas',
        body: 'A plant-made pharmaceutical manufacturing facility on Texas A&M land.',
        sources: [Sources.ibioSale],
        child: FactTable([
          ('Sold', 'June 2024, to the Texas A&M University System Board of Regents'),
          ('Price', '\$8.5M'),
          ('Site', 'About 21.4 acres, previously ground-leased from Texas A&M'),
          ('Today', 'University-owned. A possible partnership, not a purchase'),
        ]),
      ),
      InfoCard(
        icon: Icons.biotech_outlined,
        title: 'GreenLab, Jonesboro, Arkansas',
        body: 'A plant biotech company that grows proteins inside corn kernels. '
            'Press coverage of its 2025 partnership with Shiru describes Maurice '
            'Moloney as GreenLab\'s president and CSO. He is the lead inventor on '
            'the SemBioSys insulin patent and earlier held leadership roles at '
            'Rothamsted Research and CSIRO. Cory Nykiforuk is a co-inventor on the same patent.',
        sources: [Sources.greenlabShiru, Sources.moloneyWiki, Sources.patent],
      ),
    ]);
  }
}
