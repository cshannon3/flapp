import 'package:flutter/material.dart';

Color themeBackground = Colors.blueGrey;
List<String> categories = ["Learning", "Thinking", "Doing", "Interacting", "Instructing", "Playing"];
List<String> types = ["Quote", "Thought", "Author Point", "Associative", "Idea"];

Map<String, Icon> typeIcons={
  "Quote": Icon(Icons.chat_bubble),
  "Thought": Icon(Icons.book),
  "Author Point": Icon(Icons.people),
  "Associative" : Icon(Icons.collections),
  "Idea": Icon(Icons.lightbulb_outline),
};