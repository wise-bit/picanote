import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_flutter/bloc/picture.dart';

class API {
  static void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static Future<String> postNewUser(String idToken) async {
    String url = "https://us-central1-uottahj.cloudfunctions.net/app/new_user";

    // trim the string by getting the first 10 charactersp
    //  print("???");
    //  print(idToken);
    printWrapped(idToken);
    final response =
        await http.post(url, headers: {"Authorization": "$idToken"});

    // print(response.body);
    // print(response.body);
    return response.body;
  }

//FwKb7
  static Future<String> getNanoId(String idToken) async {
    String url = "https://us-central1-uottahj.cloudfunctions.net/app/nanoid";
    final response =
        await http.get(url, headers: {"Authorization": "$idToken"});
    return (json.decode(response.body)["smallid"]);
  }

  static Future<List<Picture>> getInfo(String idToken) async {
    String url = "https://us-central1-uottahj.cloudfunctions.net/app/info";
    final response =
        await http.get(url, headers: {"Authorization": "$idToken"});
    // array.map((c) => Event.fromJson(c)).toList()

    return (json.decode(response.body) as List)
        .map((i) => Picture.fromJson(i))
        .toList();
  }

  /*
    String theJSON;
    getJSON().then((String res){
      setState(() {
        theJSON = res;
      });
    });
}

*/
}
