import 'package:flutter/material.dart';
import 'package:twitterlike/widgets/tweet_preview.dart';
import "package:twitterlike/models/tweet.dart";

class TweetsMaster extends StatefulWidget{
  const TweetsMaster({super.key});

  @override
  State<TweetsMaster> createState() => TweetsMasterState();

}

class TweetsMasterState extends State<TweetsMaster> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : FutureBuilder<List<Tweet>>(
        future: fetchTweet(), 
        builder: (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator());
          } else if (snapshot.hasData){
          final tweets = snapshot.data!;
          return ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              final tweet = tweets[index];
              return TweetPreview(tweet: tweet);
            },
           );} else {
            return const Center(
              child : Text("No Tweet available")
              );
           }
        })
    );
  }
}