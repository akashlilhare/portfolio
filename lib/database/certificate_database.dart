class Certificate {
  String title;
  String university;

  Certificate({required this.title, required this.university});
}

List<Certificate> certificateList = [
  Certificate(
      title: "Data Structures",
      university: "University of California San Diego HSE University"),
  Certificate(title: "Algorithmic Toolbox", university: "University of California San Diego HSE University"),
  Certificate(
      title: "Python for Data Science & Machine Learning from A-Z",
      university: "Udemy"),
  Certificate(title: "The Complete Flutter and Dart Guid", university: "Udemy"),
];
