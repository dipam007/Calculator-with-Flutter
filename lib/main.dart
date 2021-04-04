

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: MyHomePage(title:'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";
  String preoutput="0";
  String _output="0";
  double num1=0;
  double num2=0;
  String operand = "";
  int flag=0;
  String message = "";

  void showToast()
  {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

  buttonPressed(String buttontext)
  {
    if(buttontext == "Clear"){
         _output="0";
         num1=0;
         flag=0;
         num2=0;
         operand = "";
         preoutput="";
      }
    else if(buttontext == "+" || buttontext == "-" || buttontext == "*" || buttontext == "/"){
      num1=double.parse(output);
      preoutput = output;
      flag=0;
      operand = buttontext;
      _output = "0";
    }
    else if(buttontext == "."){
      if(_output.contains(".")){
         message='You have Already Use a DOT !!!';
          showToast();
      }
      else{
        _output=_output + buttontext;
      }
    }
    else if(buttontext == "=" && flag==0){
    if(num1==0){
      message="Type a Number and perform operation";
      showToast();
    }
    else{
            num2 = double.parse(output);
            flag = 1;
            preoutput = preoutput + "\n" + operand + "  " + output;
            if (operand == "+") {
              _output = (num1 + num2).toString();
            }
            else if (operand == "-") {
              _output = (num1 - num2).toString();
            }
            else if (operand == "*") {
              _output = (num1 * num2).toString();
            }
            else if (operand == "/") {
              _output = (num1 / num2).toString();
            }
            num1 = 0;
            num2 = 0;
            operand = "";
        }
    }
    else{
      if(flag!=1)
        _output = _output + buttontext;
      else{
        message="Output Already Shown";
        showToast();
      }
    }

    print(_output);
    setState(() {
      output= double.parse(_output).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text(widget.title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: Colors.white),),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.1),
              padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                      color: Colors.brown[200],
                      alignment: Alignment.bottomRight,
                      child: Text("    "+preoutput +"\n"+ operand, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),)
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 100,
                      color: Colors.pink[200],
                      alignment: Alignment.bottomRight,
                      child: Text(output, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26, color: Colors.white),)
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("1"),
                        onPressed: ()=> {buttonPressed("1")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("2"),
                        onPressed: ()=> {buttonPressed("2")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("3"),
                        onPressed: ()=> {buttonPressed("3")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("*", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("*")},
                        color: Colors.lightGreenAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("4"),
                        onPressed: ()=> {buttonPressed("4")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("5"),
                        onPressed: ()=> {buttonPressed("5")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("6"),
                        onPressed: ()=> {buttonPressed("6")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("+", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("+")},
                        color: Colors.lightGreenAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("7"),
                        onPressed: ()=> {buttonPressed("7")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("8"),
                        onPressed: ()=> {buttonPressed("8")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("9"),
                        onPressed: ()=> {buttonPressed("9")},
                        color: Colors.amber,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("-", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("-")},
                        color: Colors.lightGreenAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text(".", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed(".")},
                        color: Colors.lightBlueAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 170,
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("0", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("0")},
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("/", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("/")},
                        color: Colors.lightGreenAccent,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("Clear", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("Clear")},
                        color: Colors.lime,
                        textColor: Colors.brown,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        elevation: 8,
                        splashColor: Colors.blue,
                        height: 50,
                        child: Text("=", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                        onPressed: ()=> {buttonPressed("=")},
                        color: Colors.pinkAccent,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ],
            ),
          ),
            ]
        ),
      )
    );
  }
}
