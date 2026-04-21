import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({
    required this.id,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: Text('Details for ID: $id'),
      ),
    );
  }
}
