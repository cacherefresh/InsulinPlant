import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insulin_plant/data/capacity.dart';
import 'package:insulin_plant/data/slides.dart';
import 'package:insulin_plant/main.dart';

void main() {
  test('capacity math matches the notes', () {
    expect(Capacity.acres(2070000), closeTo(1656, 1));
    expect(Capacity.acres(9500000), closeTo(7600, 1));
    expect(Capacity.acres(1) * Capacity.sqFtPerAcre, closeTo(34.8, 0.1));
    expect(commas(1234567), '1,234,567');
  });

  test('all 10 slides parse with a title and headline', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final slides = await loadSlides();
    expect(slides, hasLength(10));
    for (final s in slides) {
      expect(s.title, isNotEmpty);
      expect(s.headline, isNotNull, reason: s.title);
    }
    expect(slides.last.robPlaceholder, isNotNull);
  });

  testWidgets('every tab and About render at phone width without overflow',
      (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const InsulinPlantApp());
    // The Pitch tab loads its slides from assets; give that real time to finish
    // so its spinner doesn't keep pumpAndSettle from settling.
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 500)));
    await tester.pump();

    for (final label in ['Home', 'Pitch', 'Patent', 'Farm', 'Sites', 'Emerging']) {
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
      // Scroll to the bottom so every card gets laid out.
      final list = find.byType(Scrollable).hitTestable().first;
      await tester.fling(list, const Offset(0, -20000), 5000);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: label);
      if (label == 'Pitch') {
        for (var i = 2; i <= 10; i++) {
          await tester.tap(find.byTooltip('Next slide'));
          await tester.pumpAndSettle();
          expect(find.text('SLIDE $i OF 10'), findsOneWidget);
          await tester.fling(
              find.byType(Scrollable).hitTestable().first, const Offset(0, -20000), 5000);
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: 'slide $i');
        }
      }
    }

    await tester.tap(find.byTooltip('About me'));
    await tester.pumpAndSettle();
    expect(find.text('Rob Coffman'), findsOneWidget);
    await tester.fling(find.byType(Scrollable).last, const Offset(0, -20000), 5000);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
