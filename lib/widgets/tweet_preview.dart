import 'package:flutter/material.dart';
import 'package:twitterlike/models/tweet.dart';
import "package:twitterlike/widgets/tweet_details.dart";

class TweetPreview extends StatefulWidget{
  const TweetPreview({super.key,required this.tweet});
  final Tweet tweet;
  @override
  State<TweetPreview> createState() => TweetPreviewState();

}

class TweetPreviewState extends State<TweetPreview> {
Map<bool,Icon> icon = {
  true :  const Icon(Icons.star),
  false :  const Icon(Icons.star_border)
};
@override
Widget build (BuildContext context){
  return Column(
    children: [
      ListTile(
    title: Text("${widget.tweet.id}"),
    leading: tweetUrlImage(context, widget.tweet.id),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TweetDetails(tweet: widget.tweet ,) )
        );
    },
  ), 
      icon[widget.tweet.liked]!,
    ],
  );
}
}
Widget tweetUrlImage (BuildContext context,idTweet){
    return FutureBuilder(
      future: getIdImage(idTweet), 
      builder: (context,snapshot){
        if (snapshot.hasData){
          return Image.network("$baseUrl/assets/${snapshot.data}");
        }
        return const Text("No image load");
      }
      );
  }

  Widget tweetImage (BuildContext context,idTweet){
    return FutureBuilder(
      future: getImage(idTweet), 
      builder: (context,snapshot){
        if (snapshot.hasData){
          return snapshot.data!;
        }
        return const Text("No image load");
      }
      );
  }