import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final String? username;

  const SettingsPage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Settings for ${username ?? 'Not identified'}')
        ],
      ),
    );
  }
}
