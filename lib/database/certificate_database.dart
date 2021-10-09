class Certificate {
  String title;
  String university;

  Certificate({required this.title, required this.university});
}

List<Certificate> certificateList = [
  Certificate(
      title: "Data Structure And Algorithm",
      university: "University of san diago"),
  Certificate(title: "100 days of python", university: "Udemy"),
  Certificate(
      title: "Machine learning master class",
      university: "University of san diago"),
  Certificate(title: "Programing with CPP", university: "Udemy"),
];
