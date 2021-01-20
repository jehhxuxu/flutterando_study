import 'package:desafio_conversor/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final TextEditingController toCurrencyText;
  final TextEditingController fromCurrencyText;
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toCurrencyText, this.fromCurrencyText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    double fromValue = double.parse(fromCurrencyText.text.replaceAll(
          ',',
          '.',
        )) ??
        1.0;
    double finalValue = 0;

    switch (toCurrency.name) {
      case 'Real':
        finalValue = fromValue * fromCurrency.real;
        break;
      case 'Dolar':
        finalValue = fromValue * fromCurrency.dolar;
        break;
      case 'Euro':
        finalValue = fromValue * fromCurrency.euro;
        break;
      default:
        finalValue = fromValue * fromCurrency.bitcoin;
    }
    toCurrencyText.text = finalValue.toStringAsFixed(2);
  }
}
