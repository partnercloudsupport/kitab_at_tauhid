import 'package:flutter/material.dart';

import '../book/chapter.dart';
import 'book_tabs_screen.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                  title: Text(
                    "${chapters[position].russianTitle}",
                  ),
                  subtitle: Text(chapters[position].arabicTitle),
                  leading: CircleAvatar(
                    child: Text(position.toString()),
                  ),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookTabsScreen(position: position)),
                      ));
            }));
  }
}