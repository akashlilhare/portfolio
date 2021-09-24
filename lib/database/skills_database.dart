class Skill {
  final String title;
  final String imageSrc;

  Skill({
    required this.title,
    required this.imageSrc,
  });
}

Skill cpp = Skill(title: "C++", imageSrc: "assets/skills_assets/cpp.png");
Skill flutter = Skill(title: "Flutter", imageSrc: "assets/skills_assets/flutter.png");
Skill dart = Skill(title: "Dart", imageSrc: "assets/skills_assets/dart.png");
Skill html = Skill(title: "HTML", imageSrc: "assets/skills_assets/html.png");
Skill css = Skill(title: "CSS", imageSrc: "assets/skills_assets/css.png");
Skill javascript = Skill(title: "Javascript", imageSrc: "assets/skills_assets/javascript.png");
Skill firebase = Skill(title: "Firebase", imageSrc: "assets/skills_assets/firebase.png");
Skill mongodb = Skill(title: "MongoDB", imageSrc: "assets/skills_assets/mongodb.png");
Skill mysql = Skill(title: "MySql", imageSrc: "assets/skills_assets/mysql.png");
Skill nodejs = Skill(title: "Nodejs", imageSrc: "assets/skills_assets/nodejs.png");
Skill react = Skill(title: "React", imageSrc: "assets/skills_assets/react.png");
Skill git = Skill(title: "Git", imageSrc: "assets/skills_assets/git.png");
Skill github = Skill(title: "Github", imageSrc: "assets/skills_assets/github.png");
Skill python = Skill(title: "Python", imageSrc: "assets/skills_assets/python.png");
Skill sqlite = Skill(title: "SQLite", imageSrc: "assets/skills_assets/sqllite.png");

List<Skill> skills = [
  cpp,
  flutter,
  dart,
  html,
  css,
  javascript,
  firebase,
  mongodb,
  mysql,
  nodejs,
  react,
  git,
  github,
  python,
  sqlite,
];
