import 'sources.dart';

/// Acreage math. Mirrors MyLifesWork/.../00_Capacity_Math.md — change a
/// constant here and every card on the Farm Size tab follows.
abstract final class Capacity {
  /// SemBioSys's published claim: >1 kg insulin per acre of open-field
  /// safflower, enough for 2,500 patients for a year (Globe and Mail, 2006).
  static const patientsPerAcreNameplate = 2500;

  /// Share of harvested insulin that survives purification to finished
  /// product. ENGINEERING ESTIMATE — no published source.
  static const downstreamRecovery = 0.5;

  static const sqFtPerAcre = 43560;
  static const acresPerSqMile = 640;

  /// USDA NASS Acreage report, June 30 2026: 95.3 million acres planted.
  static const usCornAcres = 95300000;

  static double acresNameplate(int patients) => patients / patientsPerAcreNameplate;
  static double acres(int patients) => acresNameplate(patients) / downstreamRecovery;

  static double cornShare(int patients) => acres(patients) / usCornAcres;
}

class Phase {
  const Phase({
    required this.name,
    required this.who,
    required this.patients,
    required this.sources,
    this.illustrative = false,
    this.note,
  });

  final String name;
  final String who;
  final int patients;
  final List<Source> sources;
  final bool illustrative;
  final String? note;

  double get acres => Capacity.acres(patients);
  double get acresNameplate => Capacity.acresNameplate(patients);
}

const phases = [
  Phase(
    name: 'Small greenhouse',
    who: '100 patients',
    patients: 100,
    sources: [Sources.globe2006],
    illustrative: true,
    note: 'One patient needs about 35 sq ft, roughly a closet.',
  ),
  Phase(
    name: 'Small farm',
    who: '10,000 patients',
    patients: 10000,
    sources: [Sources.globe2006],
    illustrative: true,
  ),
  Phase(
    name: 'Every Type 1 in the US',
    who: '~2.07 million people',
    patients: 2070000,
    sources: [Sources.usT1dClaims, Sources.t1dIndexUs],
    note: 'A claims-based 2025 study counts 2.07M. The T1D Index model counts '
        '1.5M, which would mean about 1,200 acres.',
  ),
  Phase(
    name: 'Every insulin user in the US',
    who: '~8.4 million people (Type 1 and Type 2)',
    patients: 8400000,
    sources: [Sources.usInsulinUsers],
  ),
  Phase(
    name: 'Every Type 1 on Earth',
    who: '~9.5 million people',
    patients: 9500000,
    sources: [Sources.worldT1d],
  ),
];

/// "1,234" style formatting without pulling in intl.
String commas(num n) {
  final s = n.round().toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

/// Human-sized footprint: square feet under ~1 acre, acres otherwise.
String footprint(double acres) {
  if (acres < 1) return '${commas(acres * Capacity.sqFtPerAcre)} sq ft';
  final sqMi = acres / Capacity.acresPerSqMile;
  if (sqMi >= 1) return '${commas(acres)} acres · ${sqMi.toStringAsFixed(1)} sq mi';
  return '${commas(acres)} acres';
}
