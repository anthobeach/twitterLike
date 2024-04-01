import "dart:typed_data";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
class Tweet {
  // Get data from API and convert that to Tweet dart object
  String?  id;
  String? text;
  DateTime? createdAt;
  String? authorId;
  List?  tags;
  bool liked;

  Tweet({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.authorId,
    required this.tags,
    required this.liked,
  });

  factory Tweet.fromJson(Map<String,dynamic> json){
      return Tweet(
        id:  json["id"], 
        text: json["text"], 
        createdAt: DateTime.tryParse(json["date_created"]), 
        authorId: json["user_created"], 
        tags: json["tags"],
        liked: false);
  }
  }

const baseUrl = "https://twitterlike.shrp.dev";
final dio = Dio();

Future<List<Tweet>> fetchTweet() async{
  List<Tweet> tweets = [];
  try {
    Response response = await dio.get("$baseUrl/items/tweets");
    if (response.statusCode == 200 || response.statusCode == 304){
      for (Map<String,dynamic> json in response.data["data"]){
        Tweet tweet = Tweet.fromJson(json);
        tweets.add(tweet);
      }
    }
  } on DioException catch (e) {
    if (e.response!=null)
    {
      debugPrint("Data : ${e.response?.data}");
      debugPrint("Headers : ${e.response?.headers}");
      debugPrint("Request Options : ${e.response?.requestOptions}");

    }
    else {
      debugPrint("Request Options : ${e.requestOptions}");
      debugPrint("Message : ${e.message}");
    }
    throw Exception("Failded to load tweets");

  }
  return tweets;
}

Future<String> getIdImage(String idTweet) async{
  String idImage = "";
  try {
     Response response = await dio.get("$baseUrl/items/tweets/$idTweet");
     if (response.statusCode == 200 || response.statusCode == 304){
      return response.data["data"]["image"];
     }
  } on DioException catch (e) {
    if (e.response!=null)
    {
      debugPrint("Data : ${e.response?.data}");
      debugPrint("Headers : ${e.response?.headers}");
      debugPrint("Request Options : ${e.response?.requestOptions}");

    }
    else {
      debugPrint("Request Options : ${e.requestOptions}");
      debugPrint("Message : ${e.message}");
    }
   throw Exception("Failed to get image id");
  }
  return idImage;
}

Future<Image> getImage(String idTweet) async {
  try {
    String? idImage = await getIdImage(idTweet);
    Response response = await dio.get("$baseUrl/assets/$idImage");
    if (response.statusCode == 200 || response.statusCode == 304){
      String data = response.data;
      List<int> units = data.codeUnits;
      Uint8List bytes = Uint8List.fromList(units);
      return Image.memory(bytes);
    }
    } on DioException catch (e) {
    if (e.response!=null)
    {
      debugPrint("Data : ${e.response?.data}");
      debugPrint("Headers : ${e.response?.headers}");
      debugPrint("Request Options : ${e.response?.requestOptions}");

    }
    else {
      debugPrint("Request Options : ${e.requestOptions}");
      debugPrint("Message : ${e.message}");
    }
  
  }
  throw Exception("Failed to load image");
}









