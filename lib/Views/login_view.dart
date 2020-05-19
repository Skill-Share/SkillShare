

import 'package:SkillShare/core/service/authentication/auth_service.dart';
import 'package:flutter/material.dart';

class Loginview extends StatefulWidget {
  final Function toggleView;
  Loginview({this.toggleView});
  @override
  _LoginviewState createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.deepOrangeAccent,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//       THIS IS TO DISPLAY THE ERROR WHEN THERE IS AN ERROR SIGNING IN 
                 SizedBox(
                   height: 20,
                   child: Text(error, style: TextStyle(color: Colors.white),),
                 ),
//    BEGINNING OF  THE FORM FIELD
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
//      THE CONTAINER HOUSING THE EMAIL INPUT

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.white,),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              ),
                          validator: (val)
                             => val.isEmpty ?  'input a valid mail' : null
                          ,
                          onChanged: (val){
                            setState(() {
                             email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
//      THE CONTAINER HOUSING THE PASSWORD INPUT


               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                          decoration: InputDecoration(
                               prefixIcon: Icon(Icons.security, color: Colors.white,),
                               hintText: 'Password',
                               hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              ),
                                  validator: (val)
                                  =>  val.isEmpty ?  'input a valid password' : null
                                  ,
                                  obscureText: true,
                                  onChanged: (val){
                                    setState(() {
                                    password = val;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 77,),
//        THE BUTTON TO AUTHENICATE THE USER

                        FlatButton(
                          color: Colors.black12 ,
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          onPressed: () async{
                                   if (_formkey.currentState.validate()) {
                                  var result = await _auth.signWithEmailandPassword(email, password);
                                  if(result == null){
                                    setState(() {
                                      error = "invalid email or password";
                                    });
                                  }
                                }  
                              
                          }, 
                          child: Text("LOGIN", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),))
                          ,
                          SizedBox(height: 29,),
//        THE BUTTON TO LEAD THE USER TO THE  SIGN UP PAGE

                          FlatButton(
                          color: Colors.black12 ,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {
                              widget.toggleView();
                            },
                          child: Text("dont have an account? Sign Up", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),))
                          ,
                          
                    ],
                  ))
              ],
            ),
          ),
        );
    
    
  }
}