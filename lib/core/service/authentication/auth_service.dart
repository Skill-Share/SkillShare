import 'package:firebase_auth/firebase_auth.dart';
import 'package:SkillShare/core/View_Models/user_model.dart';
 
class Authservice{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _userFromFirebase( FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid ) : null;
  }

  
  // stream
  Stream<UserModel> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebase);
  }


  // signin anon
    Future signinAnon() async{
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebase(user);
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }


  //signin with email and password
   Future signWithEmailandPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and password
  Future registerWithEmailandPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //signout
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
