import 'package:flutter/material.dart';
import 'mainhomescreen.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String json=response.body;
  Future<String> validateAndSave()async{
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      print('The form is valid. Email: $_email, Password: $_password');
      var url = 'http://35.226.249.253/api/login';
      var response = await http.post(url,body: {'email' : _email, 'password': _password});
      if (response.statusCode == 200)
        {
          return response.body;//find a way to parse this json string so as to fetch the token from it
        }
    else if(response.statusCode != 200)
      {

      }
    }
    else{
      print('The form is not valid. Email: $_email, Password: $_password');

    }
  }

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
        resizeToAvoidBottomPadding: true,

        body: new Stack(
          fit: StackFit.expand,
            children: <Widget>[
              new Image(
                  image: new AssetImage('assets/logo/ic_launcher.png'),
                  fit: BoxFit.cover,
                  color: Colors.black87,
                  colorBlendMode: BlendMode.darken,
              ),
              new Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new Image.asset(('assets/logo/ic_launcher.png'),
                    scale: _iconAnimation.value * 100,
                  ),
                  new Form(
                    key: formKey,
                      child: Theme(
                        data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.blueGrey,
                          inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20.0
                            )
                          )
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(40.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                           new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter email address",

                            ),
                             onSaved: (value) => _email=value,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText:true,
                            validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
                            onSaved: (value) => _password=value,
                          ),
                           new Padding(
                               padding: const EdgeInsets.only(top: 20.0)
                           ),
                            new MaterialButton(
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: new Text('Login'),
                                onPressed:()async{

                                  print(await validateAndSave());
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>MainHomeScreen()),
                                    );
                            },)
                           ],
                          ),
                        ),
                      )

                  )
                ],
              )
            ],

        )
    );
  }
}

