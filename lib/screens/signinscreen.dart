import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/services/auth.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_app/widgets/loadingwidget/loading.dart';

//*this is the screen that enables the user
//*to sign in

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  //this key is used to
  //to identify the register form
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  //(data from text form fields)
  String email = '';
  String password = '';
  String signinError = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.055,
                          bottom: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: TextFormField(
                            //e-mail text form
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Please enter your email';
                              if (!value.contains('@'))
                                return 'Your email is not valid';
                              return null;
                            },
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'E-Mail',
                              hintStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Color.fromRGBO(0, 0, 0, 0.75),
                            ),
                            onChanged: (value) {
                              setState(() => email = value);
                            }),
                      ),
                      TextFormField(
                        //password text form
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Please enter your password';
                          if (value.length < 6)
                            return 'Please enter a longer password\n(at least 6 characters long)';
                          return null;
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.deepPurple)),
                          prefixIcon: Icon(
                            FontAwesomeIcons.key,
                            color: Colors.white,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromRGBO(0, 0, 0, 0.75),
                        ),
                        onChanged: (value) {
                          setState(() => password = value);
                        },
                      ),
                      SizedBox(height: 10.0),
                      MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          '\nI don\'t remember my password!\n',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2),
                        ),
                        onPressed: () => print('uitat'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      MaterialButton(
                          //sign in button
                          elevation: 15.0,
                          //minWidth: MediaQuery.of(context).size.width * 0.4,
                          //height: MediaQuery.of(context).size.height * 0.065,
                          //color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurple,
                                  Color.fromRGBO(80, 60, 200, 1),
                                ]
                              )
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width * 0.4,
                                minHeight: MediaQuery.of(context).size.height * 0.065,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 16)
                              ),
                            )
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  signinError =
                                      'Sign in failed.\nPlease check your email and password and try again.';
                                });
                              } else {
                                //sign in successful
                                Navigator.pop(context);
                              }
                            }
                          }
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        signinError,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    elevation: 8.0,
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.065,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(children: [
                          WidgetSpan(child: Icon(FontAwesome5Brands.google)),
                          TextSpan(
                              text: " Sign in with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ])),
                  ),
                  SizedBox(height: 10.0),
                  MaterialButton(
                    elevation: 8.0,
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.065,
                    color: Color.fromRGBO(59, 89, 152, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(children: [
                          WidgetSpan(child: Icon(FontAwesome5Brands.facebook_f)),
                          TextSpan(
                              text: "Sign in with Facebook",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ])),
                  ),
                ],
              ),
            ),
          );
  }
}
