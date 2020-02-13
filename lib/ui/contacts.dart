import 'package:flutter/material.dart';
import 'package:my_annotations/helpers/custumers_helper.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper.getAllContact().then(
      (list){
        print(list);
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
      // GestureDetector(
      //   child: Container(
      //     width: 140.0,
      //     height: 140,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle
      //       image: 
      //     ),
      //   ),
      // )
      ],)
    );
  }
}