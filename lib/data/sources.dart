/// Every number in the app links to one of these. Checked 2026-10-17.
class Source {
  const Source(this.label, this.url);
  final String label;
  final String url;
}

abstract final class Sources {
  // SemBioSys / safflower
  static const globe2006 = Source('Globe and Mail, 2006',
      'https://www.theglobeandmail.com/life/calgary-firm-turns-safflower-into-insulin/article1106775/');
  static const phase12Results = Source('SemBioSys trial results, 2009',
      'https://www.biospace.com/sembiosys-genetics-inc-announces-clinical-results-with-plant-produced-insulin');
  static const fdaMeeting2007 = Source('SemBioSys FDA meeting, 2007',
      'https://www.biospace.com/sembiosys-genetics-inc-to-proceed-with-abbreviated-regulatory-path-for-plant-produced-insulin-after-meeting-with-the-fda');
  static const biologicRule2020 = Source('FDA rule: insulin as biologic, 2020',
      'https://www.thehealthlawpulse.com/2020/03/fda-final-rule-amends-definition-of-biological-product/');

  // Cost Plus Drugs
  static const costPlus = Source('Cost Plus Drugs',
      'https://markcubancostplusdrugcompany.com/');
  static const costPlusFacility = Source('Fierce Healthcare: Dallas facility',
      'https://www.fiercehealthcare.com/health-tech/mark-cuban-says-cost-plus-drugs-has-couple-million-patients-2500-generic-drugs-it-moves');

  // Patent
  static const patent = Source('US 7,547,821 B2 (Google Patents)',
      'https://patents.google.com/patent/US7547821B2/en');
  static const continuation = Source('US 2009/0282583 A1 (Google Patents)',
      'https://patents.google.com/patent/US20090282583A1/en');
  static const botaneco = Source('Protein Industries Canada on Botaneco',
      'https://proteinindustriescanada.ca/news-releases/reimagining-oilseed-processing');
  static const botanecoStake = Source('SemBioSys sells Botaneco stake',
      'https://www.biospace.com/article/releases/sembiosys-genetics-inc-agrees-to-sell-its-part-of-botaneco-to-advitech-/');

  // History
  static const mannkindOption = Source('Fierce Biotech: MannKind option',
      'https://www.fiercebiotech.com/biotech/sembiosys-receives-us-2-5-million-from-option-agreement-mannkind-for-plant-produced-insulin');
  static const optionLapses = Source('Canadian Cattlemen: option dropped',
      'https://www.canadiancattlemen.ca/daily/u-s-drug-firm-drops-safflower-insulin-option/');
  static const frankfurtMannkind = Source('Pharmafile: MannKind buys Exubera plant',
      'https://pharmafile.com/news/mannkind-picks-pfizers-exubera-facility');
  static const frankfurtSanofi = Source('Sanofi-Aventis 6-K, June 2009',
      'https://www.sec.gov/Archives/edgar/data/0001121404/000119312509133875/dex991.htm');
  static const exubera = Source('Diabetes Spectrum: why Exubera failed',
      'https://diabetesjournals.org/spectrum/article/29/3/180/32800/Commentary-Why-Was-Inhaled-Insulin-a-Failure-in');
  static const tasly = Source('Tasly JV approvals, 2012',
      'https://www.newswire.ca/news-releases/sembiosys-and-tasly-pharmaceutical-joint-venture-receives-chinese-government-approvals-and-business-license-509539781.html');
  static const windDown = Source('SemBioSys delisting, 2012',
      'https://www.newswire.ca/news-releases/sembiosys-provides-update-regarding-voluntary-delisting-from-toronto-stock-exchange-and-the-current-state-of-the-company-510124431.html');

  // Population and land
  static const usT1dClaims = Source('PMC: the 2 million Americans with T1D',
      'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11566618/');
  static const t1dIndexUs = Source('Breakthrough T1D: State of T1D 2025',
      'https://www.breakthrought1d.org/wp-content/uploads/2025/11/State-of-T1D-2025.pdf');
  static const worldT1d = Source('IDF Atlas / T1D Index 2025',
      'https://www.diabetesresearchclinicalpractice.com/article/S0168-8227(25)00291-8/fulltext');
  static const usInsulinUsers = Source('SingleCare insulin statistics',
      'https://www.singlecare.com/blog/news/insulin-statistics/');
  static const corn2026 = Source('USDA NASS Acreage, June 2026',
      'https://www.nass.usda.gov/Newsroom/2026/06-30-2026.php');
  static const aphisPermits = Source('USDA APHIS pharma permits',
      'https://www.aphis.usda.gov/biotechnology/release-permits-pharmaceuticals-industrials-value-added-proteins-human-consumption-or');

  // Sites
  static const auroraSale = Source('Stratcann: Aurora closes Sun sale',
      'https://stratcann.com/?p=27994');
  static const auroraBevo = Source('Mugglehead: sale to Bevo Farms',
      'https://mugglehead.com/aurora-cannabis-sells-medicine-hat-facility-to-bevo-farms/');
  static const auroraHalt = Source('CTV: Aurora halts construction',
      'https://www.ctvnews.ca/calgary/article/aurora-cannabis-halts-construction-on-medicine-hat-facility');
  static const auroraCost = Source('MJBizDaily: sale to Bevo Farms',
      'https://mjbizdaily.com/?p=372858');
  static const auroraAnnounce = Source('Aurora Sun announcement, 2018',
      'https://www.newswire.ca/news-releases/aurora-cannabis-to-build-aurora-sun-12-million-square-foot-facility-in-medicine-hat-alberta-679940593.html');
  static const ibioSale = Source('iBio 8-K exhibit, June 2024',
      'https://www.sec.gov/Archives/edgar/data/1420720/000142072024000027/ibio-20240531xex99d1.htm');
  static const greenlabShiru = Source('Food Business News: GreenLab + Shiru',
      'https://www.foodbusinessnews.net/articles/28081-shiru-greenlab-to-produce-food-proteins');
  static const moloneyWiki = Source('Wikipedia: Maurice Moloney',
      'https://en.wikipedia.org/wiki/Maurice_Moloney');

  // Emerging: chloroplast
  static const daniell2011 = Source('Plant Biotech J, 2011 (PMC)',
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC3480330/');
  static const daniell2007 = Source('NOD mice study, 2007 (PubMed)',
      'https://pubmed.ncbi.nlm.nih.gov/17490448/');
  static const daniell2023 = Source('Biomaterials, 2023 (PMC)',
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC10219636/');
  static const pennToday = Source('Penn Today: oral plant insulin',
      'https://penntoday.upenn.edu/news/penn-dental-medicine-plant-based-oral-delivery-insulin-regulates-blood-sugar-levels-similar-natural-insulin');
  static const containment = Source('PNAS 2007: chloroplast containment',
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC1849964/');
  static const daniellPenn = Source('Penn Dental: Henry Daniell',
      'https://www.dental.upenn.edu/faculty/henry-daniell/');
}
