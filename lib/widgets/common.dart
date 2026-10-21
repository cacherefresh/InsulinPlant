import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sources.dart';

/// Scrollable page body, centered and capped at a readable width.
class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        for (final c in children)
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(width: double.infinity, child: c),
              ),
            ),
          ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary)),
    );
  }
}

/// The big opening statement at the top of a tab.
class Lead extends StatelessWidget {
  const Lead({super.key, required this.headline, this.body});
  final String headline;
  final String? body;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headline, style: t.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
        if (body != null) ...[
          const SizedBox(height: 8),
          Text(body!, style: t.bodyLarge),
        ],
      ],
    );
  }
}

class SourceLink extends StatelessWidget {
  const SourceLink(this.source, {super.key});
  final Source source;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: const Icon(Icons.open_in_new, size: 16),
      label: Text(source.label),
      labelStyle: Theme.of(context).textTheme.labelSmall,
      visualDensity: VisualDensity.compact,
      onPressed: () => launchUrl(Uri.parse(source.url), webOnlyWindowName: '_blank'),
    );
  }
}

/// Marks a number that is an estimate or a company's own claim, not a
/// measured fact.
class Tag extends StatelessWidget {
  const Tag(this.text, {super.key, this.warning = true});
  const Tag.estimate({super.key})
      : text = 'Estimate',
        warning = true;
  const Tag.claim({super.key})
      : text = 'Company claim',
        warning = false;

  final String text;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final bg = warning ? c.tertiaryContainer : c.secondaryContainer;
    final fg = warning ? c.onTertiaryContainer : c.onSecondaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: fg)),
    );
  }
}

/// The workhorse card: optional big value, title, body, badges, sources.
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    this.icon,
    this.value,
    required this.title,
    this.body,
    this.bullets = const [],
    this.badges = const [],
    this.sources = const [],
    this.highlight = false,
    this.child,
  });

  final IconData? icon;
  final String? value;
  final String title;
  final String? body;
  final List<String> bullets;
  final List<Widget> badges;
  final List<Source> sources;
  final bool highlight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Card(
      color: highlight ? c.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (value != null)
              Text(value!,
                  style: t.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: highlight ? c.onPrimaryContainer : c.primary)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: c.primary),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(title,
                      style: t.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            if (body != null) ...[
              const SizedBox(height: 6),
              Text(body!, style: t.bodyMedium),
            ],
            for (final b in bullets)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(b, style: t.bodyMedium)),
                  ],
                ),
              ),
            if (child != null) ...[const SizedBox(height: 10), child!],
            if (badges.isNotEmpty || sources.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [...badges, for (final s in sources) SourceLink(s)],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Two-column fact table inside a card.
class FactTable extends StatelessWidget {
  const FactTable(this.rows, {super.key});
  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      children: [
        for (final (k, v) in rows)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 110,
                  child: Text(k,
                      style: t.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ),
                Expanded(child: Text(v, style: t.bodyMedium)),
              ],
            ),
          ),
      ],
    );
  }
}

/// Vertical timeline of dated events.
class Timeline extends StatelessWidget {
  const Timeline(this.events, {super.key});
  final List<(String, String, Source?)> events;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Column(
      children: [
        for (final (date, text, source) in events)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 72,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(date,
                        style: t.labelMedium?.copyWith(
                            color: c.primary, fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(width: 2, color: c.outlineVariant),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text, style: t.bodyMedium),
                        if (source != null) ...[
                          const SizedBox(height: 4),
                          SourceLink(source),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// A clearly visible slot for text only Rob writes. Never filled by an agent.
class RobPlaceholder extends StatelessWidget {
  const RobPlaceholder(this.prompt, {super.key});
  final String prompt;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.errorContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.error, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🔴 [ROB — YOUR WORDS]',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: c.error, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(prompt, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
