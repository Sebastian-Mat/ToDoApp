import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_services.dart';
import 'validation.dart';
import "login.dart";

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  Validation validation = new Validation();
  String userInput = "", passInput = "", emailInput = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff22A1F8),
                        Color(0xffADD2EB),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ))),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  width: size.width * 0.75,
                  height: size.height * 0.90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: Color(0xff494D5F),
                            fontFamily: "PoetsenOne",
                            fontSize: size.width * 0.18),
                      ),
                      Text(
                        "Create a new account",
                        style: TextStyle(
                          color: Color(0xffC3C3C7),
                          fontFamily: "Pavanam",
                          fontSize: size.width * 0.03,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.13),
                          width: size.width * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xffF4F4F4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(7, 3, 7, 1),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: userController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              //errorText: "You must fill the blank",
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: Color(0xff494D5f),
                                  fontFamily: "PalanquinDark",
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Color(0xff494D5F),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          width: size.width * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xffF4F4F4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(7, 3, 7, 1),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              //errorText: "You must fill the blank",
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xff494D5f),
                                  fontFamily: "PalanquinDark",
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.alternate_email_rounded,
                                color: Color(0xff494D5F),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: size.height * 0.025),
                          width: size.width * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xffF4F4F4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(7, 3, 7, 1),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: true,
                            controller: passController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color(0xff494D5f),
                                  fontFamily: "PalanquinDark",
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Color(0xff494D5F),
                              ),
                            ),
                          )),
                      Container(
                          height: 0.06 * size.height,
                          width: 0.35 * size.width,
                          margin: EdgeInsets.only(
                              top: size.height * 0.06,
                              bottom: size.height * 0.11),
                          child: RaisedButton(
                            onPressed: () async {
                              setState(() {
                                userInput = userController.text.trim();
                                passInput = passController.text.trim();
                                emailInput = emailController.text.trim();
                              });
                              if (validation.isEmpty(userInput) ||
                                  validation.isEmpty(passInput) ||
                                  validation.isEmpty(emailInput)) {
                                validation.showToastText();
                              } else {
                                String message = await context.read<AuthService>().signUp(
                                      emailData: emailInput,
                                      passwordData: passInput,
                                      usernameData: userInput,
                                    );
                                if (message  == "Signed Up" ){
                                      Navigator.of(context).pop();
                                    } else {
                                      validation.showToastMessage(message);
                                    }
                              }
                            },
                            elevation: 5.0,
                            color: Color(0xff494D5f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontFamily: "Pavanam",
                                fontSize: size.height * 0.025,
                              ),
                            ),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do you have an account?",
                              style: TextStyle(
                                  color: Color(0xffC3C3C7),
                                  fontFamily: "Pavanam",
                                  fontSize: size.height * 0.021),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Color(0xff494D5f),
                                    fontSize: size.height * 0.021,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
