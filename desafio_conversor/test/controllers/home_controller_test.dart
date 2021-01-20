import 'package:desafio_conversor/controllers/home_controller.dart';
import 'package:desafio_conversor/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  TextEditingController fromCurrencyText = TextEditingController();
  TextEditingController toCurrencyText = TextEditingController();
  var controller = HomeController(
    fromCurrencyText: fromCurrencyText,
    toCurrencyText: toCurrencyText,
  );
  test('converter real para dolar', () {
    fromCurrencyText.text = '11.26';
    toCurrencyText.text = '0';
    controller.convert();
    expect(controller.toCurrencyText.text, '2.03');
  });
  test('converter dolar para real', () {
    fromCurrencyText.text = '1.0';
    toCurrencyText.text = '0';
    controller.fromCurrency = CurrencyModel(
      name: 'Dolar',
      real: 5.63,
      dolar: 1.0,
      euro: 0.85,
      bitcoin: 0.000088,
    );
    controller.toCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dolar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
    );
    controller.convert();
    expect(toCurrencyText.text, '5.63');
  });
}
