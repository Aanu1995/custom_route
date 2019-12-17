import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/batman.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text("Show dialog animation"),
              onPressed: () => myDialog(context),
            )
          ],
        ),
      ),
    );
  }

  myDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black38,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 1000),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
      pageBuilder: (contextcontext, animation, secondaryAnimation) {
        return AlertDialog(
          title: Text("Dialog Animation"),
          content: Text(
            "This shows animation before displaying dialog",
            style: TextStyle(fontSize: 16.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ok",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
