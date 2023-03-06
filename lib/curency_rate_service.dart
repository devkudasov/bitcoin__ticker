import 'package:bitcoin_ticker/secrets.dart';
import 'package:http/http.dart' as http;

class CurrencyRateService {
  String cripto;
  CurrencyRateService(this.cripto);

  Future<http.Response> fetchRate(String currency) {
    return http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$cripto/$currency?apiKey=$kCurrencyApiKey'),
    );
  }
}
