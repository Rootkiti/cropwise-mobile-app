import 'dart:convert';

import 'package:http/http.dart' as http;


class BaseClients{
var client = http.Client();
  Future<dynamic> post(String api, dynamic object) async{
    var url = Uri.parse(api);
    var _payload = json.encode(object);
    var _header = {
        "accept": "application/json",
        "Content-Type": "application/json"
    };
    var response = await client.post(url, body: _payload, headers: _header);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return 'Sorry, Try Again';
    }

  }

}