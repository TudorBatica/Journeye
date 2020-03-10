import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/widgets/loadingwidget/loading.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  //this key is used to
  //to identify the register form
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  //(data from text form fields)
  String email = '';
  String password = '';
  String username = '';
  String registerError = '';
  String firstname = '';
  String lastname = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                    TextFormField(
                        //!e-mail text form
                        validator: (value) {
                          if (value.isEmpty) return 'Please enter your email';
                          if (!value.contains('@'))
                            return 'Your email is not valid';
                          return null;
                        },
                        cursorColor: Colors.white,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.deepPurple)),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    TextFormField(
                      //!password text form
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter a password';
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    TextFormField(
                      //! username text form 
                      validator: (value) {
                        if(value.isEmpty)
                          return 'Please enter a username';
                        return null;
                      },
                      onChanged: (value) { setState(() => username = value); },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        prefixIcon: Icon(
                          FontAwesomeIcons.idCard,
                          color: Colors.white,
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color.fromRGBO(0, 0, 0, 0.75),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                    MaterialButton(
                        //sign up button
                        elevation: 15.0,
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.065,
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                        child: Text('Create Account',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(email,
                                    password, username);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                registerError =
                                    'Something went wrong. Please verify that your email is valid.';
                              });
                            } else {
                              //sign up successful !
                              Navigator.pop(context);
                            }
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Text(
                      registerError,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                ),
              ],
            ),
          );
  }
}
