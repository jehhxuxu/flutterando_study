import 'package:desafio_conversor/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
          currencyConverter(),
          SizedBox(
            height: 10,
          ),
          currencyConverter(),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            onPressed: () {},
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
    );
  }

  Widget currencyConverter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Color(0xffFFCB05),
              ),
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                  child: Text('Real'),
                ),
                DropdownMenuItem(
                  child: Text('Dolar'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
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
