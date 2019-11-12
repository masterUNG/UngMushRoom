import 'package:flutter/material.dart';
import 'package:ungmushroom/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field

  // Method
  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: MyStyle().textColor,
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        label: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: MyStyle().textColor),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'User :',
          labelStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: MyStyle().textColor),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Mush Room',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: MyStyle().textColor,
        fontStyle: FontStyle.italic,
        fontFamily: 'Wallpoet',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Color.fromARGB(150, 255, 255, 255),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    SizedBox(
                      height: 16.0,
                    ),
                    showAppName(),
                    emailText(),
                    passwordText(),
                    SizedBox(
                      height: 8.0,
                    ),
                    loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
