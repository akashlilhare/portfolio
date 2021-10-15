class Skill {
  final String title;
  final String imageSrc;
  final int rating;

  Skill({required this.title, required this.imageSrc, required this.rating});
}

Skill cpp =
    Skill(title: "C++", imageSrc: "assets/skills_assets/cpp.png", rating: 70);
Skill flutter = Skill(
    title: "Flutter", imageSrc: "assets/skills_assets/flutter.png", rating: 80);
Skill dart =
    Skill(title: "Dart", imageSrc: "assets/skills_assets/dart.png", rating: 70);
Skill html =
    Skill(title: "HTML", imageSrc: "assets/skills_assets/html.png", rating: 60);
Skill css =
    Skill(title: "CSS", imageSrc: "assets/skills_assets/css.png", rating: 50);
Skill javascript = Skill(
    title: "Javascript",
    imageSrc: "assets/skills_assets/javascript.png",
    rating: 60);
Skill firebase = Skill(
    title: "Firebase",
    imageSrc: "assets/skills_assets/firebase.png",
    rating: 50);
Skill mongodb = Skill(
    title: "MongoDB", imageSrc: "assets/skills_assets/mongodb.png", rating: 60);
Skill mysql = Skill(
    title: "MySql", imageSrc: "assets/skills_assets/mysql.png", rating: 80);
Skill nodejs = Skill(
    title: "Nodejs", imageSrc: "assets/skills_assets/nodejs.png", rating: 40);
Skill react = Skill(
    title: "React", imageSrc: "assets/skills_assets/react.png", rating: 50);
Skill git =
    Skill(title: "Git", imageSrc: "assets/skills_assets/git.png", rating: 70);
Skill github = Skill(
    title: "Github", imageSrc: "assets/skills_assets/github.png", rating: 70);
Skill python = Skill(
    title: "Python", imageSrc: "assets/skills_assets/python.png", rating: 60);
Skill sqlite = Skill(
    title: "SQLite", imageSrc: "assets/skills_assets/sqllite.png", rating: 80);



List<Skill> programingLanguages = [cpp, dart, html, css, javascript, python];
List<Skill> frameWorks = [flutter, react, nodejs];
List<Skill> dataBases = [mongodb, mysql, firebase, sqlite];
List<Skill> otherSkills = [git, github];

List<List<Skill>> skills = [programingLanguages,frameWorks,dataBases,otherSkills];