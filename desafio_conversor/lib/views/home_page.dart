import 'package:desafio_conversor/controllers/home_controller.dart';
import 'package:desafio_conversor/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController;
  final TextEditingController fromCurrencyText = TextEditingController();
  final TextEditingController toCurrencyText = TextEditingController();
  List<CurrencyModel> currencies;

  @override
  void initState() {
    homeController = HomeController(
      fromCurrencyText: fromCurrencyText,
      toCurrencyText: toCurrencyText,
    );
    currencies = homeController.currencies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30.0, top: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/conversor.png',
                height: 130,
                width: 130,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            currencyConverter(
                currencyItem: homeController.fromCurrency,
                textEditingController: fromCurrencyText,
                onChanged: (value) {
                  setState(() {
                    homeController.fromCurrency = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            currencyConverter(
                currencyItem: homeController.toCurrency,
                textEditingController: toCurrencyText,
                onChanged: (value) {
                  setState(() {
                    homeController.toCurrency = value;
                  });
                }),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                homeController.convert();
              },
              padding: EdgeInsets.all(15),
              color: Color(0xffFFCB05),
              child: Text(
                'CONVERTER',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget currencyConverter({
    CurrencyModel currencyItem,
    TextEditingController textEditingController,
    Function(CurrencyModel) onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              value: currencyItem,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Color(0xffFFCB05),
              ),
              onChanged: onChanged,
              items: currencies
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e.name),
                      value: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: textEditingController,
            cursorColor: Color(0xffFFCB05),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffFFCB05),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffFFCB05),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
