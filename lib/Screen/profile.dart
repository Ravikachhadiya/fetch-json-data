import 'package:flutter/material.dart';
import '../entities/note.dart';

class Profile extends StatelessWidget {
  static const routeName = 'profile';
  final List<Note> notes;
  final int index;
  Profile(this.notes, this.index);

  @override
  Widget build(BuildContext context) {
    print("hello : " + index.toString());

    print(notes);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
        ),
      ),
      body: Row(
        children: <Widget>[
          Image.network(
            notes[index].image,
            height: 75,
            width: 75,
          ),
        ],
      ),
    );
  }
}
