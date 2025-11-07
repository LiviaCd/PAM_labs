import '../../../core/models/temperature_unit.dart';

double convertTemperature(double value, TemperatureUnit source, TemperatureUnit destination) {
  double valueInCelsius;

  switch (source) {
    case TemperatureUnit.fahrenheit:
      valueInCelsius = (value - 32) * 5 / 9;
      break;
    case TemperatureUnit.celsius:
      valueInCelsius = value;
      break;
    case TemperatureUnit.kelvin:
      valueInCelsius = value - 273.15;
      break;
  }

  switch (destination) {
    case TemperatureUnit.fahrenheit:
      return valueInCelsius * 9 / 5 + 32;
    case TemperatureUnit.celsius:
      return valueInCelsius;
    case TemperatureUnit.kelvin:
      return valueInCelsius + 273.15;
  }
}
