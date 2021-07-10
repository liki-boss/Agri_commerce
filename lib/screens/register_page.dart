import 'package:agri_commerce/constants.dart';
import 'package:agri_commerce/services/firebase_services.dart';
import 'package:agri_commerce/widgets/custom_btn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class Register extends StatefulWidget {
  // final String registerId;

  // Register({this.registerId});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  bool hidePassword = true;
  firebase_services _firebaseServices = firebase_services();

  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repeatPassword = TextEditingController();
  TextEditingController _profilePicture = TextEditingController();
  late String profilePic;

  var _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100.0, left: 150.0),
          ),
          Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 110.0, bottom: 10, left: 23, right: 23),
                        child: Container(
                          child: Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: Constants.boldHeading,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: _autovalidate,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, bottom: 10, left: 23, right: 23),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _email,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                ),
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    String pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Enter a valid email address!';
                                    else
                                      return null;
                                  } else
                                    return 'Email field cannot be empty!';
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10, left: 23, right: 23),
                              child: TextFormField(
                                controller: _username,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                  prefixIcon: Icon(Icons.account_circle),
                                ),
                                validator: (value) {
                                  if (value != null && value.isEmpty)
                                    return 'Username cannot be empty!';
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8, left: 23, right: 23),
                              child: TextFormField(
                                controller: _password,
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.vpn_key),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                    )),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty)
                                      return 'Password field cannot be empty!';
                                    else if (value.length < 8)
                                      return 'Min password length is 8';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10, left: 23, right: 23),
                              child: TextFormField(
                                controller: _repeatPassword,
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirm password',
                                    prefixIcon: Icon(Icons.vpn_key),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                    )),
                                validator: (value) {
                                  if (value != null && value.isEmpty)
                                    return 'Password field cannot be empty!';
                                  else if (value != null && value.length < 8)
                                    return 'Min password length is 8';
                                  else if (_password.text != value)
                                    return "Passwords do not match!";
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 8, left: 0, right: 0),
                              child: CustomBtn(
                                text: "Register",
                                onPressed: () {
                                  if (_formKey.currentState!.validate())
                                    customSignUp();
                                  else
                                    setState(() {
                                      _autovalidate = true;
                                    });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Or SignIn/SignUp with",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, left: 16, right: 16),
                        child: IconButton(
                            iconSize: 80,
                            onPressed: () {
                              handleGoogleSignIn();
                            },
                            icon: Image.asset(
                              'assets/images/google.jpg',
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Visibility(
            visible: loading,
            child: Center(
              child: Container(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future handleGoogleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    User? firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('name')
          .doc(firebaseUser.uid)
          .collection("Details")
          .where('email', isEqualTo: firebaseUser.email)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length == 0) {
        FirebaseFirestore.instance
            .collection('name')
            .doc(firebaseUser.uid)
            .collection("Details")
            .doc(_firebaseServices.getProductId())
            .set({
          "email": firebaseUser.email,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoURL
        });

        await preferences.setString("email", firebaseUser.email ?? '');
        await preferences.setString("username", firebaseUser.displayName ?? '');
        await preferences.setString(
            "profilePicture", firebaseUser.photoURL ?? '');
      } else {
        await preferences.setString("email", documents[0].get("email"));
        await preferences.setString("username", documents[0].get("username"));
        await preferences.setString(
            "profilePicture", documents[0].get("profilePicture"));
      }

      Fluttertoast.showToast(
          msg: "Successfully logged in!",
          backgroundColor: Colors.blue,
          textColor: Colors.white);

      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      ;
    } else {
      Fluttertoast.showToast(
          msg: "Login failed!",
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      setState(() {
        loading = false;
      });
    }
  }

  Future customSignUp() async {
    setState(() {
      loading = true;
    });

    try {
      //TODO: Email verification

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
      profilePic =
          "https://image.shutterstock.com/image-vector/vector-simple-male-profile-icon-260nw-1388357696.jpg";

      final CollectionReference userDetails =
          FirebaseFirestore.instance.collection('name');

      User? _user = FirebaseAuth.instance.currentUser;
      if (_user != null)
        Future _addDetails() {
          return userDetails
              .doc(_user.uid)
              .collection("Details")
              .doc(_firebaseServices.getProductId())
              .set({
            "email": _email.text,
            "username": _username.text,
            "profilePicture": profilePic,
          });
        }

      // _addDetails();
      Fluttertoast.showToast(
          msg: "Successfully registered!",
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            backgroundColor: Colors.blue,
            textColor: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
            backgroundColor: Colors.blue,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      loading = false;
    });
  }
}
