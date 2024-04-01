import "package:flutter/material.dart";
import "package:twitterlike/home.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:twitterlike/widgets/tweets_master.dart';
import "package:twitterlike/widgets/tweet_preview.dart";
class TwitterLike extends StatelessWidget {
  const TwitterLike({super.key});

@override
Widget build(BuildContext context){
  return MaterialApp(
    title: "Twitter Like",
    theme : ThemeData(
      colorScheme : ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 252, 230, 142)),
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.pacifico(),
        titleMedium: GoogleFonts.pacifico(),
        titleSmall: GoogleFonts.pacifico(),
      )
     ),
     home : const TweetsMaster(),
    );
}
}
