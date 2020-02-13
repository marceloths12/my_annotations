import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
final String annotationTable = "annotationTable";
final String idColum = "idColum";
final String annotationColum = "annotationColum";
final String priorityColum = "priorityColum";
class AnnotationHelper {
  static final  AnnotationHelper _instance = AnnotationHelper.internal();
  factory AnnotationHelper() => _instance;
  AnnotationHelper.internal();

 Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "annotationNew.db");
    return await openDatabase(path,version: 1, onCreate: (Database db, int newVersion)async{
      await db.execute(
        "CREATE TABLE $annotationTable($idColum INTEGER PRIMARY KEY , $annotationColum TEXT, $priorityColum TEXT )"
      );
    });
  }
  
  Future<Annotation> saveAnnotation(Annotation annotation)async{
    Database dbAnnotaion = await db;
    annotation.id = await dbAnnotaion.insert(annotationTable, annotation.toMap());
    return annotation;
  }

  Future<List> getAllAnnotation()async{
    Database dbAnnotation = await db;
    List listMap = await dbAnnotation.rawQuery("SELECT * FROM $annotationTable");
    List<Annotation> listAnnotation = List();
    for (Map m in listMap) {
      listAnnotation.add(Annotation.forMap(m));
    }
    return listAnnotation; 
  }
  Future close()async{
    Database dbAnnotation = await db;
      dbAnnotation.close();
    }
}

class Annotation {
  int id;
  String annotation;
  String priority;

  Annotation();
//Passando um MAP pra ou objeto
Annotation.forMap(Map map){
  id = map[idColum];
  annotation = map[annotationColum];
  priority = map[priorityColum];
}

//Passando oobjeto para um MAP
  Map toMap(){
    Map<String, dynamic> map = {
      idColum: id,
      annotationColum: annotation,
      priorityColum: priority
      };
      if (id != null) {
        map[idColum] = id;
    }
    return map;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "id: $id, annotation: $annotation, priority: $priority";
  }

}