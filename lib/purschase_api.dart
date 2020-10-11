import 'package:http/http.dart' as http;
import 'package:urlshortenerweb/model.dart';
import 'dart:convert';


class PurschaseApiClient {
  static const baseUrl = "http://file.akalayci.com/s/bE4KSrqETRxXaqF/download";
  final http.Client httpClient = http.Client();


  Future<Purch> getPurschase() async {
    final radyoCevap = await httpClient.get(baseUrl,headers: {

    });
    print(radyoCevap);

    final radyoCevapJSON =
        jsonDecode(radyoCevap.body);
    return Purch.fromJson(radyoCevapJSON);
  }
}
