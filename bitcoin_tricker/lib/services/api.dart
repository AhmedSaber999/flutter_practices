import 'package:http/http.dart' as http;

class ApiService{

  static dynamic getCoinExchange(String coin, String currency) async{
    Uri url = Uri(
      scheme: 'https',
      host: 'rest.coinapi.io',
      path: 'v1/exchangerate/$coin/$currency',
    );
    var header = {'X-CoinAPI-Key': '60D1C11B-B3D1-4EC5-930A-FA0E0F011DEA'};
    var response = await http.get(url, headers: header);
    if(response.statusCode == 200){
      return response.body;
    }
    print(response.body);
  }
}