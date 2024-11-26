import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context ,index ){
          final user= users[index];
          final name =user['name']['first'];
          final email =user['email'];
          final imageUrl =user['picture']['thumbnail'];
        return ListTile(
          leading: CircleAvatar(
            child: Image.network(imageUrl),),
          title: Text(name.toString()),
          subtitle: Text(email),
        );
          
      }),
     floatingActionButton: FloatingActionButton(
      onPressed: fetchUsers,
      ),
    );
  }
  void fetchUsers() async {
    print('fetchUsers called');
    const url ='https://randomuser.me/api/?results=100';
    final uri =Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
          users = json['results'];
    });
print('fetchUsers completed');
  }
}