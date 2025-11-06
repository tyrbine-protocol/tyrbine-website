// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class OffchainApi {

//   static Future getPriceForPoolsTokens() async {
//     var tokens = vaultsData.map((data) => data.mint == "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr" ? "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v" : data.mint).toList();

//     var uri = "https://api.jup.ag/price/v2?ids=";

//     uri += tokens.join(',');

//     try {
//       var response = await http.get(Uri.parse(uri));

//       if (response.statusCode != 200) {
//         debugPrint("Error: ${response.statusCode}, ${response.body}");
//         return {};
//       }

//       final Map<String, dynamic> jsonDecode = json.decode(response.body)['data'];
//       return jsonDecode;
//     } catch (e) {
//       debugPrint("Error: ${e.toString()}");
//       return {};
//     }
//   }
  
// }
