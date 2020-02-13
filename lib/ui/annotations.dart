import 'package:flutter/material.dart';
import 'package:my_annotations/helpers/annotations_helper.dart';
class Annotations extends StatefulWidget {
  final Annotation annotation;

  Annotations({this.annotation});
  @override
  _AnnotationsState createState() => _AnnotationsState();
}

class _AnnotationsState extends State<Annotations> {
  final _annotationController = TextEditingController();
  
  Annotation newAnnotation = Annotation();
  
  double _rating =1;
  
  String _priority = "";

  _colorPriority(int priorityValue){
    if (priorityValue == 2) {
      _priority = "Alta";
      return Colors.red;
    }else if(priorityValue == 1){
      _priority = "Média";
      return Colors.yellow;
    }else{
      _priority = "Baixa";
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações",style: TextStyle(fontSize: 25.0, color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: TextField(
                controller: _annotationController,
                style: TextStyle(fontSize: 20.0),
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Anotação',
                  hintStyle: TextStyle(fontSize: 25.0)
                ),
              ),
            ),
          ),
          Container(
          padding: EdgeInsets.only(top: 20.0,),
          child: Column(
            children: <Widget>[
              Text("Nivel de Prioridade", style: TextStyle(fontSize: 25.0),),
              Slider(
                value: _rating,
                onChanged: (newRating){
                  setState(()=> _rating = newRating);

                },
                activeColor: _colorPriority(_rating.toInt()),
                min: 0,max: 2,divisions: 2,
                label: "$_priority",
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15.0),
          child: FlatButton(
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.save, size: 40.0,color: Colors.white,),
                Text(" Salvar",style: TextStyle(fontSize: 30.0,color: Colors.white ),)
              ],
            ),
            onPressed: (){
              newAnnotation.annotation = _annotationController.text;
              newAnnotation.priority = _priority;
              Navigator.pop(context, newAnnotation);
            },
          ),
        )
        ],
      ),
    );
  }
}
