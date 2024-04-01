import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:twitterlike/models/tweet.dart";

//Fonction aynchrone pour récupérer les données de l'API
void main(){
  test("Récupération d'items depuis l'API",() async{
    try{
      final response = await dio.get("https://twitterlike.shrp.dev/items/tweets/0536904a-5aa2-40fd-bd11-f6d1f10e3b9e");
      Map<String,dynamic> data = response.data;
      data.forEach(
        (key, value) => debugPrint("data['$key'] : ${value.runtimeType}")
        );
    } on DioException catch(e){
      expect(e.response!=null, true);
    }
    });
  test("Récupération des items sous forme d'un objet de type Tweet",() async{
    final response = await dio.get("https://twitterlike.shrp.dev/items/tweets/0536904a-5aa2-40fd-bd11-f6d1f10e3b9e");
    final tweet = Tweet.fromJson(response.data["data"]);
    expect(tweet.runtimeType,Tweet);
    debugPrint("tweet.id : ${tweet.id}");
    debugPrint("tweet.authorId : ${tweet.authorId}");
    debugPrint("tweet.createdAt : ${tweet.createdAt}");
    debugPrint("tweet.text : ${tweet.text}");
    debugPrint("tweet.tags : ${tweet.tags}");
  });
  test("Récupération d'une image",() async{
    String idTweet = "0536904a-5aa2-40fd-bd11-f6d1f10e3b9e";
    final image = await getImage(idTweet);
    debugPrint("$image");
  });
}


