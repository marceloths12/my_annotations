import 'package:flutter/material.dart';
import 'package:my_annotations/helpers/annotations_helper.dart';
import 'package:my_annotations/ui/annotations.dart';
class HomeAnootations extends StatefulWidget {
  @override
  _HomeAnootationsState createState() => _HomeAnootationsState();
}

class _HomeAnootationsState extends State<HomeAnootations> {
  AnnotationHelper helper = AnnotationHelper();

  List<Annotation> annotation = List();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllAnnotations();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações",style: TextStyle(fontSize: 25.0, color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:
      ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: annotation.length,
          itemBuilder: (context, index){
            return _contactCard(context, index);
          }
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: (){
          _showAnnotationPage();
        },
        backgroundColor:Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  Widget _contactCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage("images/Notepad.png")
                ),
              ),
            ),
          Padding(
              padding: EdgeInsets.only(left: 10.0),
              child:
              Text(annotation[index].annotation ?? "texto não inserido",
                style: TextStyle(fontSize: 22.0,color: Colors.black,
                fontWeight: FontWeight.bold)
              ),
            )
          ],
        ),
        ),
      ),
      // onTap: (){
      //   _showOptions(context,index);
      // },
    );
  }
  void _showAnnotationPage({Annotation annotation})async{
    final recAnnotation = await Navigator.push(context,
      MaterialPageRoute(builder:(context)=>Annotations(annotation: annotation,))
      );
      if(recAnnotation != null){
        if(annotation != null){
          return;
        }else{
          await helper.saveAnnotation(recAnnotation);
        }
        _getAllAnnotations();
      }
  }
  _getAllAnnotations(){
    helper.getAllAnnotation().then((list){
      setState(() {
        annotation = list;
      });
    });
  }
}