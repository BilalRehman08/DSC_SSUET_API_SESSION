import 'package:api/service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  submitForm() async {
    ApiService _apiService = ApiService();
    List<Users> eachposts = await _apiService.fetchUsers();
    return eachposts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: submitForm(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    title: Text(
                      "${snapshot.data![index].name}",
                      style: const TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
