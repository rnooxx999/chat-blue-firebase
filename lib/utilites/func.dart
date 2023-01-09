import 'package:flutter/material.dart';

void showLoading(BuildContext context, String text) {
  showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [CircularProgressIndicator(), Text(text)],
          ),
          actions: [TextButton(onPressed: () {}, child: Text("Loading..."))],
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
    {required BuildContext context,
    required String message,
    required String postActionText,
    required Function posAction,
    String? negActionText,
    Function? negAction}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  posAction(context);
                },
                child: Text(postActionText))
          ],
        );
      });
}
