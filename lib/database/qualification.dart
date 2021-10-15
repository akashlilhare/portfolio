
class Qualification{
  final String title;
  final String subTitle;
  final List<String> date;

  Qualification(
      {required this.title, required this.subTitle, required this.date});
}

List<Qualification> educationList = [
  Qualification(
      title: "B.E. Information Technology",
      subTitle: "Shri Shankracharya Technical Campus, Bhilai",
      date: ["July 2018 - ", "Present"]),
  Qualification(
      title: "Higher Secondary School Certificate",
      subTitle: "Kendriya Vidyalaya, Dongargarh",
      date: ["March 2017 - ", "March 2018"]),
  Qualification(
      title: "Higher School Certificate",
      subTitle: "Kendriya Vidyalaya, Dongargarh",
      date: ["March 2015 - ", "March 2016"]),
];

List<Qualification> workList = [
  Qualification(
      title: "Software Engineer Intern",
      subTitle: "WinkWack",
      date: ["April 2021 - ", "July 2021"]),
  Qualification(
      title: "Software Engineer",
      subTitle: "Fit and Flex",
      date: ["September 2020 - ", "August 2021"]),
];