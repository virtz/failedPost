import 'package:flutter/material.dart';
import 'package:test1/ui/post.dart';
import 'dart:convert';
import '../models/genre.dart';
import '../services/api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var genres = List<Genre>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Genre>(
        future: _getGenres(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: genres.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  elevation: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Post()));
                    },
                    child: ListTile(
                      title: Text(genres[index].genreName),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  initState() {
    super.initState();
    _getGenres();
  }

  dispose() {
    super.dispose();
  }

  _getGenres() {
    Api.getGenres().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        genres = list.map((model) => Genre.fromJson(model)).toList();
      });
    });
  }

}
