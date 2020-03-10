import 'package:cloud_firestore/cloud_firestore.dart';

//* this service handles
//* users database logic

class UsersDatabaseService {

  final String userid;
  UsersDatabaseService( {this.userid} );

  // users collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  Future updateUserProfile (String username, String description, 
   String trips, String profilePicURL) async {
    
    return await usersCollection.document(userid).setData({
      'username' : username,
      'description' : description,
      'profilepic' : profilePicURL,
      'trips' : trips,
    }); 
  }

}