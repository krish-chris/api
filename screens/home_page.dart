import 'package:apicall/services/user_api.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API call'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              margin: EdgeInsets.fromLTRB(15,5,15,5),
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,15,30,15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NAME : ${user.fullName}'),
                    Text('GENDER : ${user.gender}'),
                    Text('EMAIL : ${user.email}'),
                    Text('NATIONALITY : ${user.nat}'),
                    Text('PHONE : ${user.phone}'),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}