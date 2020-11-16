import 'package:agri_commerce/constants.dart';
import 'package:agri_commerce/screens/register_page.dart';
import 'package:agri_commerce/services/firebase_services.dart';
import 'package:agri_commerce/widgets/custom_btn.dart';
import 'package:agri_commerce/widgets/custom_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  bool hidePassword = true;
  firebase_services _firebaseServices = firebase_services();

  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repeatPassword = TextEditingController();
  TextEditingController _profilePicture = TextEditingController();
  String profilePic;

  var _autovalidate = false;




  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 35.0,
                  ),
                  child: Text(
                    "Welcome User,\nLogin to your account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 150.0, bottom: 10, left: 0, right: 0),
                      child: CustomInput(
                        hintText: "Email...",
                        onChanged: (value) {
                          _loginEmail = value;
                        },
                        onSubmitted: (value) {
                          _passwordFocusNode.requestFocus();
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    CustomInput(
                      hintText: "Password...",
                      onChanged: (value) {
                        _loginPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, bottom: 8, left: 0, right: 0),
                      child: CustomBtn(
                        text: "Login",
                        onPressed: () {
                          _submitForm();
                        },
                        isLoading: _loginFormLoading,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    "Or SignIn with",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 8, left: 16, right: 16),
                  child: IconButton(
                      iconSize: 80,
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      icon: Image.asset('assets/images/google.jpg',)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 25.0,
                  ),
                  child: CustomBtn(
                    text: "Create New Account",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    outlineBtn: true,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future handleGoogleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    User firebaseUser =
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

        await preferences.setString("email", firebaseUser.email);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("profilePicture", firebaseUser.photoURL);
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
}
