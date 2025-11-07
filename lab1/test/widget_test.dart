import 'package:flutter/material.dart';
import 'package:flutter_apps/app.dart';
import 'package:flutter_apps/core/models/temperature_unit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Temperature Converter App Tests', () {
    testWidgets('App should load correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TemperatureConverterApp());

      // Verify that the app bar title is present
      expect(find.text('Convertor Temperatură'), findsOneWidget);

      // Verify that the input field is present
      expect(find.byType(TextField), findsOneWidget);

      // Verify that radio buttons for units are present
      expect(find.text('Celsius'), findsNWidgets(2)); // Appears in both source and destination sections
      expect(find.text('Fahrenheit'), findsNWidgets(2));
      expect(find.text('Kelvin'), findsNWidgets(2));

      // Verify that convert button is present
      expect(find.text('Convertește'), findsOneWidget);
    });

    testWidgets('Should have proper UI components', (WidgetTester tester) async {
      await tester.pumpWidget(const TemperatureConverterApp());

      // Verify all required UI components are present
      expect(find.text('Introduceți temperatura:'), findsOneWidget);
      expect(find.text('Unitatea sursă:'), findsOneWidget);
      expect(find.text('Unitatea destinație:'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(RadioListTile<TemperatureUnit>), findsNWidgets(6)); // 3 for source + 3 for destination
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Should have correct temperature unit options', (WidgetTester tester) async {
      await tester.pumpWidget(const TemperatureConverterApp());

      // Verify all temperature units are available in both sections
      expect(find.text('Celsius'), findsNWidgets(2));
      expect(find.text('Fahrenheit'), findsNWidgets(2));
      expect(find.text('Kelvin'), findsNWidgets(2));

      // Verify symbols are displayed
      expect(find.text('°C'), findsNWidgets(2));
      expect(find.text('°F'), findsNWidgets(2));
      expect(find.text('K'), findsNWidgets(2));
    });
  });
}