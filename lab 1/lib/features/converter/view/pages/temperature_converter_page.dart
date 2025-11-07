import 'package:flutter/material.dart';

import '../../../../core/models/temperature_unit.dart';
import '../../utils/conversion.dart';
import '../widgets/curve_painter.dart';
import '../widgets/custom_keypad.dart';
import '../widgets/unit_selector.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  TemperatureUnit _sourceUnit = TemperatureUnit.fahrenheit;
  TemperatureUnit _destinationUnit = TemperatureUnit.celsius;

  double _outputValue = 36.94;

  final TextEditingController _inputController = TextEditingController(text: "98.5");
  final FocusNode _inputFocusNode = FocusNode();

  void _showSourceUnitSelector() {
    UnitSelector.show(
      context,
      title: "Select Source Unit",
      selectedUnit: _sourceUnit,
      onUnitSelected: (unit) {
        setState(() => _sourceUnit = unit);
        _convert();
      },
    );
  }

  void _showDestinationUnitSelector() {
    UnitSelector.show(
      context,
      title: "Select Destination Unit",
      selectedUnit: _destinationUnit,
      onUnitSelected: (unit) {
        setState(() => _destinationUnit = unit);
        _convert();
      },
    );
  }

  void _convert() {
    final value = double.tryParse(_inputController.text);
    if (value != null) {
      // clamp before conversion
      final clamped = value.clamp(-273.15, 10000.0);
      setState(() {
        _outputValue = convertTemperature(clamped, _sourceUnit, _destinationUnit);
      });
    }
  }

  void _onKeypadTap(String value) {
    String current = _inputController.text;

    if (value == '⌫') {
      current = current.isNotEmpty ? current.substring(0, current.length - 1) : '';
    } else if (value == '.' && !current.contains('.')) {
      current += value;
    } else if (value == '-') {
      // only allow '-' at the start
      current = current.startsWith('-') ? current.substring(1) : '-' + current;
    } else if (RegExp(r'^\d$').hasMatch(value)) {
      // prevent leading zeros like "000"
      if (current == '0') {
        current = value;
      } else if (current == '-0') {
        current = '-' + value;
      } else {
        current += value;
      }
    }


    final parsed = double.tryParse(current);
    if (parsed != null) {
      if (parsed < -273.15) {
        current = "-273.15";
      } else if (parsed > 10000) {
        current = "10000";
      }
    }

    setState(() {
      _inputController.text = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8BC34A),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Temperature Converter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Source Unit Selector
                  GestureDetector(
                    onTap: _showSourceUnitSelector,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _sourceUnit.label,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Input TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: _inputController,
                      focusNode: _inputFocusNode,
                      keyboardType: TextInputType.none,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  // Curved Separator
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: CustomPaint(
                        painter: CurvePainter()
                    ),
                  ),
                ],
              ),
            ),
            // Output Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Column(
                children: [
                  Text(
                    _outputValue.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Destination Unit Selector
                  GestureDetector(
                    onTap: _showDestinationUnitSelector,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _destinationUnit.label,
                          style: const TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.keyboard_arrow_down, color: Color(0xFF888888)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomKeypad(onKeyTap: _onKeypadTap, onConvert: _convert),
          ],
        ),
      ),
    );
  }
}
