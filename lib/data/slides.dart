import 'package:flutter/services.dart';

import 'sources.dart';

/// One pitch slide, parsed from pitch_deck/slide_NN_*.md. The format is
/// documented in pitch_deck/README.md.
class Slide {
  Slide({required this.title});

  final String title;
  String? headline;
  final List<String> paragraphs = [];
  final List<String> bullets = [];
  final List<String> notes = [];
  final List<String> tags = [];
  final List<Source> sources = [];
  String? robPlaceholder;
}

final _link = RegExp(r'^- \[(.+)\]\((https?://[^)]+)\)$');
const _robMarker = '🔴 [ROB — YOUR WORDS]';

Slide parseSlide(String markdown) {
  late Slide slide;
  var inSources = false;
  for (final raw in markdown.split('\n')) {
    final line = raw.trim();
    if (line.isEmpty) continue;
    if (line.startsWith('# ')) {
      slide = Slide(title: line.substring(2));
    } else if (line.startsWith('## ')) {
      slide.headline = line.substring(3);
    } else if (line == 'Sources:') {
      inSources = true;
    } else if (inSources && _link.hasMatch(line)) {
      final m = _link.firstMatch(line)!;
      slide.sources.add(Source(m[1]!, m[2]!));
    } else if (line == '!estimate') {
      slide.tags.add('Estimate');
    } else if (line == '!claim') {
      slide.tags.add('Company claim');
    } else if (line.startsWith('> ')) {
      slide.notes.add(line.substring(2));
    } else if (line.startsWith(_robMarker)) {
      slide.robPlaceholder = line.substring(_robMarker.length).trim();
    } else if (line.startsWith('- ')) {
      slide.bullets.add(line.substring(2));
    } else {
      slide.paragraphs.add(line);
    }
  }
  return slide;
}

Future<List<Slide>> loadSlides([AssetBundle? bundle]) async {
  final b = bundle ?? rootBundle;
  final manifest = await AssetManifest.loadFromAssetBundle(b);
  final paths = manifest
      .listAssets()
      .where((p) => p.startsWith('pitch_deck/slide_') && p.endsWith('.md'))
      .toList()
    ..sort();
  return [for (final p in paths) parseSlide(await b.loadString(p))];
}
