class Person {
  int? id;
  String firstName;
  String lastName;
  String? interest;

  Person(
      {this.id,
      required this.firstName,
      required this.lastName,
      this.interest});
}
