import 'package:flutter/material.dart';

import '../../../../core/models/temperature_unit.dart';


class UnitSelector {
  static void show(
      BuildContext context, {
        required String title,
        required TemperatureUnit selectedUnit,
        required Function(TemperatureUnit) onUnitSelected,
      }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              ...TemperatureUnit.values.map((unit) {
                return RadioListTile<TemperatureUnit>(
                  title: Text(unit.label, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                  value: unit,
                  groupValue: selectedUnit,
                  activeColor: Colors.lightGreen,
                  onChanged: (value) {
                    Navigator.pop(context);
                    onUnitSelected(value!);
                  },
                );
              }).toList(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
