import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double val1 = 0;
  double val2 = 0;
  String op = '';
  String res = '';
  String text = '0';
  String O = '';
  String finres='';

  String sum() {
    res = (val1 + val2).toString();
    val1 = double.parse(res);
    return point(res);
  }

  String sub() {
    res = (val1 - val2).toString();
    val1 = double.parse(res);

    return point(res);
  }

  String mul() {
    res = (val1 * val2).toString();
    val1 = double.parse(res);
    return point(res);
  }

  String div() {
    res = (val1 / val2).toString();
    val1 = double.parse(res);
    return point(res);
  }

  String point(dynamic p) {
    if (p.toString().contains('.')) {
      List dot = p.toString().split('.');
      if (!(int.parse(dot[1]) > 0)) {
        return p = dot[0].toString();
      }
    }
    return p;
  }


void calc(String num)
{
  if(num=='c')
  {
    res='';
    text='';
    val1=0;
    val2=0;
  }
  else if(num=='='&& O=='=') {
    if (op == '+') {
      text=sum();
    }
    else if (op == '-') {
    text=sub();
    }
    else if (op == '*') {
      text=mul();

    }
    else if (op == '/') {
      text=div();
    }
  }
  else if(num=='+'||num=='-'||num=='*'||num=='/'||num=='=')
    {
      if(val1==0)
        {
          val1=double.parse(res);
        }
      else
        {
          val2=double.parse(res);
        }
      if(O=='+'){
        text=sum();
      }
      else if(O=='-')
        {
          text=sub();
        }
      else if(O=='*'){
        text=mul();
      }
      else if(O=='/')
        {
          text=div();
        }
      op=O;
      O=num;
      res='';
    }
  else if(num=='%')
    {
      res=(val1/100).toString();
      text=point(res);
    }
else if(num=='.') {
    if (!res.toString().contains('.')) {
      res=res.toString()+'.';
    }
    text=res;
  }
else{
  res=res+num;
  text=res;
  }
setState(() {
  finres=text;
});
}
  fun(String n)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Expanded(
        child: FloatingActionButton(backgroundColor: Colors.grey,
          onPressed: (){
          setState((){
                  calc(n);
              }
          );
        },
            child: Text('$n',
              style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.black ),),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Calculator'),backgroundColor: Colors.brown,
    ),
      body: Center(
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Column(
          children: [
          Text('$finres',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,
          ),
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),
                color: Colors.black,),
                  height: 1,
                // width: 900,
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            fun('c'),
            fun('<-'),
            fun('%'),
            fun('/'),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            fun('7'),
            fun('8'),
            fun('9'),
            fun('*'),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            fun('4'),
            fun('5'),
            fun('6'),
            fun('-'),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            fun('1'),
            fun('2'),
            fun('3'),
            fun('+'),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            fun('0'),
            fun('.'),
            fun('='),
          ],),
        ],),
      ),
      ),
    );
  }
}
