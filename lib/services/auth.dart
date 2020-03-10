import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/services/usersdatabase.dart';

//* this class handles 
//* authentication logic

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //? sign in anon (just for testing purposes, will delete)
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //create custom user object from 
  //FirebaseUser
  User _convertToUser(FirebaseUser user) {
    return user != null ? User(userid: user.uid) : null;
  } 

  //auth changed user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map((FirebaseUser user) => _convertToUser(user));
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);    
    FirebaseUser firebaseUser = result.user;
    return _convertToUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password,
  String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;

      //create a new document for the user
      await UsersDatabaseService(userid: firebaseUser.uid).updateUserProfile(username, 'Hi there!', 'none', 
      'https://www.ccd.edu/sites/default/files/PhotoAvatar.jpg');

      return _convertToUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
}