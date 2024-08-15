import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_app/models/person.dart';

class PeopleListPage extends StatefulWidget {
  const PeopleListPage({super.key});

  @override
  State<PeopleListPage> createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  final dio = Dio();
  List<Person> people = [];

  void getHttp() async {
    final response = await dio.get('http://localhost:8000/people');
    setState(() {
      for (var item in response.data) {
        var person = Person(
            id: item['id'],
            firstName: item['first_name'],
            lastName: item['last_name'],
            interest: item['interests']);
        people.add(person);
      }
    });
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("People"), centerTitle: true),
      body: ListView(
        children: [
          ...people.map((person) => ListTile(
                title: Text("${person.firstName} ${person.lastName}"),
                subtitle: Text(person.interest.toString()),
                leading: const Icon(
                  Icons.person,
                  size: 50,
                ),
                // trailing: TextButton(onPressed: () {}, child: Text("Edit")),
              )),
        ],
      ),
    );
  }
}
