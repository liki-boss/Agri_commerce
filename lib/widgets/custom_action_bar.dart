import 'package:agri_commerce/constants.dart';
import 'package:agri_commerce/screens/cart_page.dart';
import 'package:agri_commerce/screens/saved_page.dart';
import 'package:agri_commerce/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String? title;
  final bool? hasBackArrrow;
  final bool? hasTitle;
  final bool? hasBackground;
  final bool? hasSaved;
  final bool? hasSpace;
  final bool? hasCart;

  CustomActionBar(
      {this.title,
      this.hasSpace,
      this.hasBackArrrow,
      this.hasTitle,
      this.hasSaved,
      this.hasCart,
      this.hasBackground});

  firebase_services _firebaseServices = firebase_services();

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;
    bool _hasSaved = hasSaved ?? true;
    bool _hasSpace = hasSpace ?? false;
    bool _hasCart = hasCart ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground ? LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
            ],
            begin: Alignment(0, 0),
            end: Alignment(0, 1),
          ): null
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                      "assets/images/back_arrow.png"
                  ),
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
              ),
            ),
          if(_hasSpace)
            Spacer(flex: 1,),
          if(_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          if(_hasSpace)
            Spacer(flex: 1,),
          if(_hasCart)
            GestureDetector(
              child: Row(
                children: [
                  if(_hasSaved)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SavedPage(),
                        ));
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.centerRight,
                        child: Image(
                          image: AssetImage(
                              "assets/images/heart.png"
                          ),
                          color: Colors.black,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ));
                    },
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: Alignment.centerRight,
                      child: Image(
                        image: AssetImage(
                            "assets/images/customer.png"
                        ),
                        color: Colors.black,
                        width: 18.0,
                        height: 20.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ));
                    },
                    child: Container(
                      width: 10.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      alignment: Alignment.center,

                      child: StreamBuilder<QuerySnapshot>(
                        stream: _usersRef
                            .doc(_firebaseServices.getUserId())
                            .collection("Cart")
                            .snapshots(),
                        builder: (context, snapshot) {
                          int _totalItems = 0;

                          if (snapshot.connectionState ==
                                  ConnectionState.active &&
                              snapshot.data != null) {
                            List _documents = snapshot.data!.docs;
                            _totalItems = _documents.length;
                          }

                          return Text(
                            "$_totalItems",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}