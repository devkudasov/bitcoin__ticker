import 'package:flutter/material.dart';

import 'curency_rate_service.dart';

class CurrencyCard extends StatefulWidget {
  CurrencyCard({Key? key, required this.crypto, required this.currency}) : super(key: key);
  
  String crypto;
  String currency;

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  String rate = '';

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  void didUpdateWidget(covariant CurrencyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    fetch();
  }

  void fetch() async {
    CurrencyRateService currencyRateService = CurrencyRateService(widget.crypto);
    var result = await currencyRateService.fetchRate(widget.currency);
    setState(() {
      rate = result.rate.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 ${widget.crypto} = $rate ${widget.currency}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
