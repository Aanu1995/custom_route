import 'package:animation_and_custom_route/customRoute.dart';
import 'package:animation_and_custom_route/homepage.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

import 'fadeAnimation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/image.jpg",
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    delay: 2.4,
                    child: Text(
                      "Best waves for",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  FadeAnimation(
                    delay: 2.6,
                    child: Text(
                      ".Surfing",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: height * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Animator(
                            tweenMap: {
                              'opacity': Tween(begin: 0.5, end: 1.0),
                              'translateX': Tween(begin: -0.95, end: 0.95),
                              'rotate': Tween(begin: 0.0, end: 1.0),
                            },
                            curve: Interval(0.0, 1.0, curve: Curves.linear),
                            duration: Duration(seconds: 15),
                            repeats: 0,
                            builderMap: (animation) {
                              return Transform(
                                transform: Matrix4.translationValues(
                                    width * animation["translateX"].value,
                                    0.0,
                                    0.0),
                                child: Opacity(
                                  opacity: animation["opacity"].value,
                                  child: Text(
                                    "Hello Flutter",
                                    style: TextStyle(
                                        fontSize: 40.0, color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 50.0),
                          FadeAnimation(
                            delay: 2.8,
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 2.5),
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                CustomPageRoute(
                                    builder: (context) => HomePage()),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          FadeAnimation(
                            delay: 3.2,
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          FadeAnimation(
                            delay: 3.4,
                            child: InkWell(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
