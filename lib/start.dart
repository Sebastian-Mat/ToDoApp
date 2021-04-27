import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class Start extends StatelessWidget {
  Widget _buildScreen(Size size, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 60.0),
          height: size.height * 0.67,
          child: Image.asset("assets/images/TodoLogo.png",
              width: size.width * 0.7),
        ),
        Container(
          height: size.height * 0.33,
          child: Column(
            children: <Widget>[
              MaterialButton(
                elevation: 3.0,
                minWidth: 220.0,
                height: 40.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text("Sign In",
                    style: TextStyle(color: Color(0xffADD2EB), fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ButtonTheme(
                    minWidth: 220.0,
                    height: 40.0,
                    child: OutlineButton(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color(0xff494D5F),
                        style: BorderStyle.solid,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: Color(0xff494D5F), fontSize: 20.0)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff22A1F8),
              Color(0xffADD2EB),
            ])),
        child: _buildScreen(size, context),
      ),
    );
  }
}
