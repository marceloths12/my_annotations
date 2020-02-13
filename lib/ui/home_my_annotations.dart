import 'package:flutter/material.dart';
import 'package:my_annotations/ui/contacts.dart';
import 'package:my_annotations/ui/home_annotation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Inicial",style: TextStyle(fontSize: 25.0, color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top:15.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> HomeAnootations() )
                  );
              }, 
              child: Column(
                children: <Widget>[
                  Container(
                    width: 140.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage("images/Notepad.png")
                      ),
                    ),
                  ),
                  Text("Anotações", style: TextStyle(color: Colors.blue,fontSize: 40.0, ),)
                ],
              )
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contacts())
                  );
              }, 
              child: Column(
                children: <Widget>[
                  Container(
                    width: 140.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage("images/Contacts.png")
                      )
                    ),
                  ),
                  Text("Contatos", style: TextStyle(color: Colors.blueAccent,fontSize: 40.0, ),)
                ],
              )
            ),
          ),
        ],
      ),
      )
    );
  }
}