import 'package:news_app/features/search/data/models/author_model.dart';

List<AuthorModel> authors = [
  AuthorModel.fromJson({
    "id": "abc-news",
    "name": "ABC News",
    "description":
        "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
    "url": "https://abcnews.go.com",
    "category": "general",
  }),
  AuthorModel.fromJson({
    "id": "bbc-news",
    "name": "BBC News",
    "description":
        "Use BBC News for up-to-the-minute news, breaking news, video, audio and feature stories. BBC News provides trusted World and UK news as well as local and regional perspectives. Also entertainment, business, science, technology and health news.",
    "url": "http://www.bbc.co.uk/news",
    "category": "general",
  }),
  AuthorModel.fromJson({
    "id": "fox-sports",
    "name": "Fox Sports",
    "description":
        "Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.",
    "url": "http://www.foxsports.com",
    "category": "sports",
  }),
  AuthorModel.fromJson({
    "id": "bbc-sport",
    "name": "BBC Sport",
    "description":
        "The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.",
    "url": "http://www.bbc.co.uk/sport",
    "category": "sports",
  }),
  AuthorModel.fromJson({
    "id": "medical-news-today",
    "name": "Medical News Today",
    "description": "Medical news and health news headlines posted throughout the day, every day.",
    "url": "http://www.medicalnewstoday.com",
    "category": "health",
  }),
  AuthorModel.fromJson({
    "id": "the-wall-street-journal",
    "name": "The Wall Street Journal",
    "description":
        "WSJ online coverage of breaking news and current headlines from the US and around the world. Top stories, photos, videos, detailed analysis and in-depth reporting.",
    "url": "http://www.wsj.com",
    "category": "business",
  }),
  AuthorModel.fromJson({
    "id": "wirtschafts-woche",
    "name": "Wirtschafts Woche",
    "description":
        "Das Online-Portal des führenden Wirtschaftsmagazins in Deutschland. Das Entscheidende zu Unternehmen, Finanzen, Erfolg und Technik.",
    "url": "http://www.wiwo.de",
    "category": "business",
  }),
];
