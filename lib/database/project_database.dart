import 'package:portfoli/database/skills_database.dart';

class Project {
  final int index;
  final String title;
  final String subtitle;
  final List<String> features;
  final List<String> tag;
  final String imageSrc;
  final List<Skill> techUsed;
  final List<String>
  projectSrc; //[0] for github, [1] for playstore, [2] for website

  Project( {required this.subtitle,
    required this.index,
    required this.features,
    required this.tag,
    required this.imageSrc,
    required this.title,
    required this.projectSrc,
    required this.techUsed});
}

Project covidTracker = Project(
    title: "Covid-19 Tracker",
    subtitle:
    "Covid-19 Tracker is a flutter mobile app to track real-time covid-19 cases all over the world. In this app, I used an open-source API to fetch data and display it to the user",
    features: [
      "Daily Covid-19 case update.",
      "Show Country-wise covid 19 cases.",
      "Show Precaution issued by WHO",
      "Give Information about symptoms of Covid-19",
      "Visualize data with the help of graphs."
    ],
    projectSrc: ["https://github.com/akashlilhare/covid19_tracker","",""],
    tag: ["All Project","Mobile App"],
    imageSrc: "assets/project_assets/1.jpg",
    techUsed: [flutter, dart], index: 0);

Project newsApp = Project(
    subtitle:
    "News mobile app is a flutter mobile app that fetches data from newsapi.org and displays news to the user in 8 different categories.",
    features: [
      "Fetch real-time news from top news providers.",
      "Show news in 8 different categories.",
      "Show news according to country."
    ],
    tag: ["All Project","Mobile App"],
    imageSrc: "assets/project_assets/2.jpg",
    title: "News App",
    projectSrc: ["https://github.com/akashlilhare/news_app","",""],
    techUsed: [flutter, dart], index: 1);

Project homeWorkoutApp = Project(
    subtitle:
    "Home Workouts provides daily workout routines for all your main muscle groups. In just a few minutes a day, you can build muscles and keep fit at home without having to go to the gym. No equipment or coach is needed, all exercises can be performed with just your body weight.",
    features: [
      "100+ Download in play store",
      "Store user data in SQLite database.",
      "Visualize user data with the help of graphs and charts.",
      "Added notification system to remind users"
    ],
    tag: ["All Project","Mobile App"],
    imageSrc: "assets/project_assets/3.jpg",
    title: "Home Workout App",
    projectSrc: [
      "",
      "https://play.google.com/store/apps/details?id=com.akashlilhare.homeworkout",""
    ],
    techUsed: [flutter, dart, sqlite], index: 2);

Project flShop = Project(
    subtitle:
    "Fl shop is a Flutter app where users can list their products for sale and, anyone can buy the product.",
    features: [
      "Easy login and registration with Firebase Authentication.",
      "Order get added to Firebase Database.",
      "Shopping cart, Order summary and Manage product",
    ],
    tag: ["All Project","Mobile App"],
    imageSrc: "assets/project_assets/4.jpg",
    title: "FlShop",
   // TODO: Add source Check for evey project
    projectSrc: ["","",""],
    techUsed: [flutter, dart, firebase], index: 3);

Project todoList = Project(
    subtitle: "Todoit is a task management app to help you stay organized and manage your day-to-day. It allows users to manage their tasks from a smartphone.",
    features: [
      "User friendly task management.",
          "Grouping tasks in handy task lists.",
          "Checkmark the finished task and delete the task.",
          "Smart home screen widgets show instantly what to do.",
    ],
    tag: ["All Project","Mobile App"],
    imageSrc: "assets/project_assets/5.jpg",
    title: "Todoit",
    projectSrc: ["https://github.com/akashlilhare/todoit","",""],
    techUsed: [flutter, dart, sqlite], index: 4);

Project heartDiseaseAnalysis = Project(
    subtitle: "Heart disease is one of the dangerous diseases in the world where it may cause death and the patient who has this disease may undergo a serious long term disability. So in this project I try to predict, person is suffering from heart disease or not with the help of historic data",
    features: [
      "Analysis of dataset of 209 patient",
      "Analysis of dataset with 8 attributes",
      "Apply various machine learning model to get accurate prediction",
      "Get Best Accuracy of 0.89 with Logistic Regression algorithm"
    ],
    //TODO : remove other tags
    tag: ["Machine Learning", "All Project", "Python", "Web Site"],
    imageSrc: "assets/project_assets/6.jpg",
    title: "Heart Disease Analysis",
    projectSrc: ["https://github.com/akashlilhare/heart-disease-analysis","",""],
    techUsed: [python], index: 5);


List<Project> projectList = [
  covidTracker,
  newsApp,
  homeWorkoutApp,
  flShop,
  todoList,
  heartDiseaseAnalysis,
];
