import 'package:http/http.dart' as http;
import 'package:urlshortenerweb/model.dart';
import 'dart:convert';


class PurschaseApiClient {
  static const baseUrl = "https://raw.githubusercontent.com/klaycarda/klaycarda/master/url%20(2).json";
  final http.Client httpClient = http.Client();


  Future<Purch> getPurschase() async {
    print("----------api çağrıldı");
    final radyoCevap = await httpClient.get(baseUrl,headers: {

    });
    print(radyoCevap);

    final radyoCevapJSON =
        jsonDecode(radyoCevap.body);
    print(radyoCevap.body.toString()+"**********");
    return Purch.fromJson(radyoCevapJSON);
  }
}
