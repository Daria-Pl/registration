import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Registration()
          ],
        ),
      ),
    );
  }
}


class Registration extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Container(
        width: 412,
        height: 732,
        decoration: BoxDecoration(
          color : Color.fromRGBO(66, 95, 200, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 230,
                  left: 0,
                  child: Container(
                      width: 412,
                      height: 550,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                        child: new Form(
                            key: _formKey,
                            child: new Column(
                              children: <Widget>[
                                new Text('Добро пожаловать!', style: TextStyle(fontSize: 32.0, fontFamily: 'Roboto', fontWeight: FontWeight.normal)),

                                new SizedBox(height: 40.0,),

                                new Text('E-mail:', style: TextStyle(fontSize: 20.0),),
                                new TextFormField(validator: (value){
                                  if (value!.isEmpty) return 'Пожалуйста введите свой Email';

                                  String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                                  RegExp regExp = new RegExp(p);

                                  if (regExp.hasMatch(value)) return null;

                                  return 'Это не E-mail';
                                }),

                                new SizedBox(height: 20.0),

                                new Text('Пароль:', style: TextStyle(fontSize: 20.0),),
                                new TextFormField(obscureText: true, validator: (value){
                                  if (value!.isEmpty) return 'Пожалуйста введите пароль';

                                  if (value.length < 6) return 'Пароль слишком короткий';
                                }),

                                new SizedBox(height: 30.0),
                                new RaisedButton(onPressed: (){
                                  if(_formKey.currentState!.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('Данные введены верно'), backgroundColor: Color.fromRGBO(66, 95, 200, 1),));
                                },
                                    child: Text('Войти', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    ),
                                    color: Color.fromRGBO(66, 95, 200, 1)
                                )
                              ],
                            )
                        ),
                      )
                  )
              ),
              Positioned(
                  top: -48,
                  left: 175,
                  child: Container(
                      width: 250,
                      height: 269,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/91e873108f6681778c930ea2e6173109removebgpreview2.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),
              Positioned(
                  top: -21,
                  left: -14,
                  child: Container(
                      width: 207,
                      height: 238,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/images/Image33.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),
            ]
        )
    );
  }
}
