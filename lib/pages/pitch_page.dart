import 'package:flutter/material.dart';

import '../data/slides.dart';
import '../widgets/common.dart';

/// Swipeable 10-slide deck. Content lives in pitch_deck/*.md.
class PitchPage extends StatefulWidget {
  const PitchPage({super.key});

  @override
  State<PitchPage> createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  late final Future<List<Slide>> _slides = loadSlides();
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _go(int page) => _controller.animateToPage(page,
      duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Slide>>(
      future: _slides,
      builder: (context, snap) {
        if (snap.hasError) return Center(child: Text('Could not load slides: ${snap.error}'));
        if (!snap.hasData) return const Center(child: CircularProgressIndicator());
        final slides = snap.data!;
        return Column(children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (p) => setState(() => _page = p),
              children: [
                for (final (i, s) in slides.indexed)
                  _SlideView(slide: s, number: i + 1, total: slides.length),
              ],
            ),
          ),
          _DeckControls(
            page: _page,
            total: slides.length,
            onPrev: _page > 0 ? () => _go(_page - 1) : null,
            onNext: _page < slides.length - 1 ? () => _go(_page + 1) : null,
          ),
        ]);
      },
    );
  }
}

class _SlideView extends StatelessWidget {
  const _SlideView({required this.slide, required this.number, required this.total});
  final Slide slide;
  final int number;
  final int total;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = Theme.of(context).colorScheme;
    return PageBody(children: [
      Text('SLIDE $number OF $total',
          style: t.labelMedium?.copyWith(color: c.primary, letterSpacing: 1.2)),
      Text(slide.title, style: t.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
      if (slide.headline != null)
        Card(
          color: c.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(slide.headline!,
                style: t.headlineSmall?.copyWith(
                    color: c.onPrimaryContainer, fontWeight: FontWeight.w600)),
          ),
        ),
      if (slide.paragraphs.isNotEmpty || slide.bullets.isNotEmpty)
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final p in slide.paragraphs)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: RichLine(p, style: t.bodyLarge),
                  ),
                for (final b in slide.bullets)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('•  ', style: t.bodyLarge),
                      Expanded(child: RichLine(b, style: t.bodyLarge)),
                    ]),
                  ),
              ],
            ),
          ),
        ),
      if (slide.robPlaceholder != null) RobPlaceholder(slide.robPlaceholder!),
      if (slide.tags.isNotEmpty || slide.sources.isNotEmpty)
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (final tag in slide.tags) Tag(tag, warning: tag == 'Estimate'),
          for (final s in slide.sources) SourceLink(s),
        ]),
      if (slide.notes.isNotEmpty)
        Card(
          child: ExpansionTile(
            leading: const Icon(Icons.record_voice_over_outlined),
            title: const Text('Speaker notes'),
            shape: const Border(),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [for (final n in slide.notes) RichLine(n, style: t.bodyMedium)],
          ),
        ),
    ]);
  }
}

class _DeckControls extends StatelessWidget {
  const _DeckControls({
    required this.page,
    required this.total,
    required this.onPrev,
    required this.onNext,
  });
  final int page;
  final int total;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(children: [
        IconButton(
            tooltip: 'Previous slide', onPressed: onPrev, icon: const Icon(Icons.chevron_left)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < total; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: i == page ? 16 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: i == page ? c.primary : c.outlineVariant,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
            tooltip: 'Next slide', onPressed: onNext, icon: const Icon(Icons.chevron_right)),
      ]),
    );
  }
}

/// Text with `**bold**` spans.
class RichLine extends StatelessWidget {
  const RichLine(this.text, {super.key, this.style});
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final parts = text.split('**');
    return Text.rich(TextSpan(style: style, children: [
      for (final (i, p) in parts.indexed)
        TextSpan(
            text: p,
            style: i.isOdd ? const TextStyle(fontWeight: FontWeight.w700) : null),
    ]));
  }
}
