import 'dart:convert';

import 'package:bitcoin_ticker/secrets.dart';
import 'package:http/http.dart' as http;

class CurrencyRateService {
  String crypto;

  CurrencyRateService(this.crypto);

  Future<_CurrencyRate> fetchRate(String currency) async {
    final response = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apiKey=$kCurrencyApiKey'),
    );

    if (response.statusCode == 200) {
      return _CurrencyRate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load rate');
    }
  }
}

class _CurrencyRate {
  final double rate;

  const _CurrencyRate({required this.rate});

  factory _CurrencyRate.fromJson(Map<String, dynamic> json) {
    return _CurrencyRate(
      rate: json['rate'],
    );
  }
}
