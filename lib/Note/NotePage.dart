import 'package:flutter/material.dart';
import 'package:flutter_x/Note/DatabaseHelper.dart';
import 'package:flutter_x/Note/Todo.dart';

class NotePage extends StatefulWidget {


  @override
  NotePageState createState() => NotePageState();
}

class NotePageState extends State<NotePage> {

  TextEditingController textController = new TextEditingController();

  List<Todo> taskList = new List();

  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {
          taskList.add(Todo(id: element['id'], title: element["title"]));
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Enter a task"),
                    controller: textController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addToDb,
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: taskList.isEmpty
                    ? Container()
                    : ListView.builder(itemBuilder: (ctx, index) {
                  if (index == taskList.length) return null;
                  return ListTile(
                    title: Text(taskList[index].title),
                    leading: Text(taskList[index].id.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(taskList[index].id),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    setState(() {
      taskList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDb() async {
    String task = textController.text;
    var id = await DatabaseHelper.instance.insert(Todo(title: task));
    setState(() {
      taskList.insert(0, Todo(id: id, title: task));
    });
  }

}
