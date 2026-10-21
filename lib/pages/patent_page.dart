import 'package:flutter/material.dart';

import '../data/sources.dart';
import '../widgets/common.dart';

class PatentPage extends StatelessWidget {
  const PatentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBody(children: [
      Lead(
        headline: 'The core patent has expired. One license remains.',
        body: 'What has expired, what is still owned, and how the program stopped.',
      ),
      InfoCard(
        icon: Icons.description_outlined,
        title: 'US 7,547,821 B2',
        sources: [Sources.patent],
        child: FactTable([
          ('Title', 'Methods for the production of insulin in plants'),
          ('Assignee', 'SemBioSys Genetics Inc.'),
          ('Inventors', 'Maurice M. Moloney, Joseph Boothe, Richard Keon, '
              'Cory Nykiforuk, Gijs van Rooijen'),
          ('Priority', 'June 17, 2003'),
          ('Granted', 'June 16, 2009'),
          ('Expiry', 'June 17, 2024 (Google Patents\' anticipated date)'),
          ('Status', 'Expired – Fee Related'),
        ]),
      ),
      InfoCard(
        icon: Icons.block_outlined,
        title: 'The follow-on application was abandoned',
        body: 'US 2009/0282583 A1, filed May 2009, is listed as Abandoned. '
            'It never issued.',
        sources: [Sources.continuation],
      ),
      InfoCard(
        icon: Icons.info_outline,
        title: 'Google\'s status labels are not a legal opinion',
        body: 'Google Patents notes that its legal-status labels are an assumption, '
            'not a legal conclusion. A freedom-to-operate opinion covering the '
            'whole process is a required step. Patents cannot be renewed, but '
            'newer patents on improvements, formulations, or devices can still '
            'apply.',
      ),
      SectionTitle('What we would actually need'),
      InfoCard(
        title: 'Expired is not the same as free to operate',
        sources: [Sources.aphisPermits, Sources.biologicRule2020],
        child: FactTable([
          ('Insulin-in-plants method', 'Public domain (patent expired)'),
          ('Oleosome extraction', 'License from Botaneco'),
          ('Purification know-how', 'People, not patents'),
          ('Seed stock / lines', 'Not covered by the patent; status after 2012 unknown'),
          ('Fill-finish', 'Partner: Cost Plus Drugs (Dallas)'),
          ('FDA pathway', '351(k) biosimilar'),
          ('Growing permit', 'USDA APHIS permit with confinement'),
        ]),
      ),
      InfoCard(
        highlight: true,
        icon: Icons.handshake_outlined,
        title: 'Botaneco: the one license left',
        body: 'Botaneco (Calgary) holds a patented, water-based process for '
            'separating oil bodies (oleosomes) and proteins from oilseeds, '
            'safflower included. The technology came out of the University of '
            'Calgary. Botaneco was formed in 2012, and SemBioSys sold its stake in '
            'it the same year. The insulin patent is free. The cheap way to get the '
            'protein out of the seed is a licensing conversation, not a fight.',
        sources: [Sources.botaneco, Sources.botanecoStake],
      ),
      SectionTitle('How it stopped'),
      InfoCard(
        title: 'Timeline',
        child: Timeline([
          ('2006', 'SemBioSys claims more than 1 kg of insulin per acre, enough for '
              '2,500 patients for a year.', Sources.globe2006),
          ('2007', 'SemBioSys meets with the FDA and says the meeting confirmed an '
              'abbreviated approval path.', Sources.fdaMeeting2007),
          ('Oct 2007', 'Pfizer withdraws Exubera, its inhaled insulin, about a year '
              'after launch. Its Frankfurt insulin plant becomes surplus.',
              Sources.exubera),
          ('Dec 2008', 'MannKind (maker of the inhaled insulin Afrezza) pays about '
              'US\$2.5M for an option on the safflower insulin.',
              Sources.mannkindOption),
          ('Mar 2009', 'MannKind agrees to buy Pfizer\'s Frankfurt plant for \$33M '
              'and lets the safflower option lapse. The same month, SemBioSys '
              'reports its Phase I/II results.', Sources.optionLapses),
          ('Jun 2009', 'Sanofi-Aventis uses a step-in right and buys the Frankfurt '
              'plant itself for €30M, to support Lantus production.',
              Sources.frankfurtSanofi),
          ('2011–12', 'A joint venture with Tasly Pharmaceutical (China) is approved, '
              'then ends.', Sources.tasly),
          ('2012', 'SemBioSys delists from the TSX and ends operations.',
              Sources.windDown),
        ]),
      ),
      InfoCard(
        icon: Icons.lightbulb_outline,
        title: 'The pattern',
        body: 'A failed inhaled insulin left a factory behind. A second inhaled-'
            'insulin company dropped plant-grown insulin to buy that factory. Then '
            'an incumbent insulin maker took the factory instead. The science had '
            'already worked in people.',
      ),
      InfoCard(
        icon: Icons.science_outlined,
        title: 'The other route has separate IP',
        body: 'Henry Daniell\'s chloroplast insulin work at the University of '
            'Pennsylvania is a different technology with different owners. Its '
            'licensing status is still an open question. See the Emerging tab.',
        sources: [Sources.daniellPenn],
      ),
    ]);
  }
}
