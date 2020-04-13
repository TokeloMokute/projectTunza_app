import 'package:flutter/material.dart';
import 'profilepage.dart';
import 'caretakerpage.dart';
import 'childpage.dart';
import 'manageregionalcategory.dart';
import 'manageworkcategory.dart';



class MainHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('TunzaApp Home'),


        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){

          })

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("Test"),decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.cover,image: AssetImage("assets/logo/ic_launcher.png"))), accountEmail: Text("test@tester.io"),currentAccountPicture: Text("P"),otherAccountsPictures: <Widget>[Text("C")],),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.work),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProfilePage("Admin Profile"))),
            ),
            Divider(),
            ListTile(
              title: Text('Add Caretaker'),
              trailing: Icon(Icons.child_friendly),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CaretakerPage("Caretaker"))),
              ),
            Divider(),
            ListTile(
              title: Text('Add child'),
              trailing: Icon(Icons.child_care),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ChildPage("Child"))),
            ),
            Divider(),

            Divider(),
            ListTile(
              title: Text('Manage Regional Category'),
              trailing: Icon(Icons.local_post_office),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ManageRegionalCategory("Manage Regional Category"))),
            ),
            Divider(),
            ListTile(
              title: Text('Manage Work Category'),
              trailing: Icon(Icons.business_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ManageWorkCategory("Manage Work Category"))),
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.cancel),
              onTap: ()=> Navigator.of(context).pop(),
            ),

          ],
        ),
      ),

    );
  }

}