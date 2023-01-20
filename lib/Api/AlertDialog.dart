import 'package:flutter/material.dart';

showAlertDialog({required BuildContext context,required String title,required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: SingleChildScrollView(
            child: Column(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Continue'),
              ),
            ),
          ],
          
        );
      });
}
