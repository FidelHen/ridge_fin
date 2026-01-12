import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ridge_fin/features/watchlist/widgets/ticker_tile.dart';

void main() {
  group('WatchlistTickerTile', () {
    testWidgets('renders title and description correctly', (tester) async {
      // Arrange
      const title = 'AAPL';
      const description = 'Apple Inc.';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WatchlistTickerTile(
              title: title,
              description: description,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(description), findsOneWidget);
    });

    testWidgets('renders trailing widget when provided', (tester) async {
      // Arrange
      const title = 'AAPL';
      const description = 'Apple Inc.';
      const trailingText = '\$150.00';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WatchlistTickerTile(
              title: title,
              description: description,
              trailing: Text(trailingText),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.text(description), findsOneWidget);
      expect(find.text(trailingText), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      // Arrange
      const title = 'AAPL';
      const description = 'Apple Inc.';
      var tapped = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WatchlistTickerTile(
              title: title,
              description: description,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(WatchlistTickerTile));
      await tester.pump();

      // Assert
      expect(tapped, isTrue);
    });

    testWidgets('does not render trailing when null', (tester) async {
      // Arrange
      const title = 'AAPL';
      const description = 'Apple Inc.';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WatchlistTickerTile(
              title: title,
              description: description,
            ),
          ),
        ),
      );

      // Assert
      // When trailing is null, the widget should render SizedBox.shrink()
      final shrinkBox = find.byWidgetPredicate(
        (widget) => widget is SizedBox && widget.width == 0.0 && widget.height == 0.0,
      );
      expect(shrinkBox, findsOneWidget);
    });

    testWidgets('has correct height', (tester) async {
      // Arrange
      const title = 'AAPL';
      const description = 'Apple Inc.';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WatchlistTickerTile(
              title: title,
              description: description,
            ),
          ),
        ),
      );

      // Assert
      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(Column),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.height, 70);
    });
  });
}
