import 'package:flutter/material.dart';

//const kPrimaryColor = Color(0xFF100B20);
const kPrimaryColor = Color(0xFF1877F2);
const kSecondaryColor = Color(0xFF4E4B66);
const apiKey = 'cd02c34afa26497ca935ba0c2cdc72b3';
var uID = '';
// AuthorModel model = AuthorModel.fromJson({
//   "id": "abc-news",
//   "name": "ABC News",
//   "description":
//       "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
//   "url": "https://abcnews.go.com",
//   "category": "general",
// });

String timeAgo(String timeAgo) {
  DateTime timeAgo2 = DateTime.parse(timeAgo);
  DateTime timeNow = DateTime.now();

  Duration difference = timeNow.difference(timeAgo2);
  return difference.inDays.toString();
}
