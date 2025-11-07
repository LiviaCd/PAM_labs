import 'package:flutter/material.dart';
import 'features/converter/view/pages/temperature_converter_page.dart';

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        useMaterial3: true,
      ),
      home: const TemperatureConverterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
