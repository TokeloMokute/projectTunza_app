import 'package:flutter/material.dart';
class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  final List<String> thelist =["Child 1","Child 2","Child 3","Child4","Child5"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
        "Children list view",
          style: new TextStyle(fontSize: 19.0),
        ),
backgroundColor: Colors.teal,

        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.person_add),
              onPressed: ()=>debugPrint("Add")
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")
          ),
        ],

      ),


      body: new Container(
        child: new ListView.builder(
            itemBuilder: (_,int index)=>ChildrenList(this.thelist[index]),
          itemCount: this.thelist.length,
        ),
      ),
    );
  }
}
class ChildrenList extends StatelessWidget{

  String childName;
  ChildrenList(this.childName);

  @override
  Widget build(BuildContext context) {

    return new Card(
      child: new Container(
        child: new Row(
          children: <Widget>[

            new CircleAvatar(
              child: new Text(childName[0]),
            ),
            new Text(childName,style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

}
