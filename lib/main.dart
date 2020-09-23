import 'dart:convert';

import 'package:flutter/material.dart';
import './entities/note.dart';
import 'package:http/http.dart' as http;
import './Screen/profile.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = List<Note>();
  int index = 0;
  Future<List<Note>> fetchNotes() async {
    var url = 'https://www.iroidsolutions.com/interview/test.json';
    var response = await http.get(url);

    var notes = List<Note>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListView.builder(
        itemBuilder: (context, index) {
          print("index:" + index.toString());
          return GestureDetector(
            onTap: () {
              this.index = index;
              Navigator.of(context).pushNamed(Profile.routeName);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    Image.network(
                      _notes[index].image,
                      height: 75,
                      width: 75,
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _notes[index].name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _notes[index].email,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Text(
                          _notes[index].phone,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _notes.length,
      ),
      routes: {
        Profile.routeName: (ctx) => Profile(_notes, index),
      },
    );
  }
}
