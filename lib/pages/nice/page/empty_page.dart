import "package:flutter/material.dart";

class EmptyPage extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empty page"),
      ),
      body: Text("Empty"),
    );
  }
}
