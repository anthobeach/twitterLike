import 'package:flutter/material.dart';
import 'package:twitterlike/models/tweet.dart';
import "package:twitterlike/widgets/tweet_preview.dart";

class TweetDetails extends StatefulWidget{
  const TweetDetails({super.key,required this.tweet});
  final Tweet tweet;
  @override
  State<TweetDetails> createState() => TweetDetailsState();

}

class TweetDetailsState extends State<TweetDetails> {
Map<bool,Icon> icon = {
  true :  const Icon(Icons.star),
  false :  const Icon(Icons.star_border)
};

void _changeLike(){
  setState(() {
    widget.tweet.liked ? 
    widget.tweet.liked = false 
    : widget.tweet.liked = true;
  });
}

@override
Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title : Text("${widget.tweet.id}")
    ),
    body : widget.tweet.tags!=null ? 
    Column(children: [
      Flexible(child : ListView(children: [
      tweetUrlImage(context, widget.tweet.id),
      IconButton(
        onPressed: _changeLike, 
        icon: icon[widget.tweet.liked]!),
      Text("Date creation : ${widget.tweet.createdAt?.day}/${widget.tweet.createdAt?.month}/${widget.tweet.createdAt?.year}"),
      Text("Author id : ${widget.tweet.authorId}"),
      Text ("${widget.tweet.text}"),
    ])
    ),
    Flexible(child: 
    scrollableList(context, widget.tweet.tags!))
    ],)
    : ListView(children: [
      tweetUrlImage(context, widget.tweet.id),
      IconButton(
        onPressed: _changeLike, 
        icon: icon[widget.tweet.liked]!),
      Text("Date creation : ${widget.tweet.createdAt?.day}/${widget.tweet.createdAt?.month}/${widget.tweet.createdAt?.year}"),
      Text("Author id : ${widget.tweet.authorId}"),
      Text ("${widget.tweet.text}"),
    ]) 

  );
}

Widget scrollableList (BuildContext context,List tags){
  return  SizedBox(
    height: 200,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      for (int i=0;i<tags.length;i++)
      Container(
        margin : const EdgeInsets.all(10),
          color : Colors.blue,
          width: 160,
          child: Center( child :Text(
            tags[i],
            style: const TextStyle(color:Colors.white)),
          ),
          ),
    ]
  )
  );
    }
}