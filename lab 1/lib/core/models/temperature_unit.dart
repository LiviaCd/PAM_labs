enum TemperatureUnit { celsius, fahrenheit, kelvin }

extension TemperatureUnitX on TemperatureUnit {
  String get symbol {
    switch (this) {
      case TemperatureUnit.celsius:
        return "°C";
      case TemperatureUnit.fahrenheit:
        return "°F";
      case TemperatureUnit.kelvin:
        return "K";
    }
  }

  String get label {
    switch (this) {
      case TemperatureUnit.celsius:
        return "CELSIUS";
      case TemperatureUnit.fahrenheit:
        return "FAHRENHEIT";
      case TemperatureUnit.kelvin:
        return "KELVIN";
    }
  }
}
