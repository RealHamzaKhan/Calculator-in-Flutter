import 'package:calculator/components/mybutton.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String userInput='';
  String Result='';
  void getResult()
  {
    String finalUserInput=userInput.replaceAll('x', '*');
    finalUserInput=finalUserInput.replaceAll('÷', '/');
    Parser p=Parser();
    Expression expression=p.parse(finalUserInput);
    ContextModel contextModel= ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL, contextModel);
    Result=eval.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(alignment: Alignment.bottomRight,child: Text(userInput,style: TextStyle(color: Colors.white,fontSize: 30),)),
                    SizedBox(height: 10,),
                    Text(Result,style: TextStyle(color: Colors.white,fontSize: 30),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: buttonsBoxColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton('AC',extraFeaturesColor,(){
                          setState(() {
                            userInput = '';
                            Result='';
                          });

                        }),
                        MyButton('+/-',extraFeaturesColor,(){
                          setState(() {
                            userInput += '+/-';
                          });

                        }),
                        MyButton('%',extraFeaturesColor,(){
                          setState(() {
                            userInput += '%';
                          });

                        }),
                        MyButton('÷',expressionsColor,(){
                          setState(() {
                            userInput += '÷';
                          });

                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton('7',numbersColor,(){
                          setState(() {
                            userInput += '7';
                          });

                        }),
                        MyButton('8',numbersColor,(){
                          setState(() {
                            userInput += '8';
                          });

                        }),
                        MyButton('9',numbersColor,(){
                          setState(() {
                            userInput += '9';
                          });

                        }),
                        MyButton('x',expressionsColor,(){
                          setState(() {
                            userInput += 'x';
                          });

                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton('4',numbersColor,(){
                          setState(() {
                            userInput += '4';
                          });

                        }),
                        MyButton('5',numbersColor,(){
                          setState(() {
                            userInput += '5';
                          });

                        }),
                        MyButton('6',numbersColor,(){
                          setState(() {
                            userInput += '6';
                          });

                        }),
                        MyButton('-',expressionsColor,(){
                          setState(() {
                            userInput += '-';
                          });

                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton('1',numbersColor,(){
                          setState(() {
                            userInput += '1';
                          });

                        }),
                        MyButton('2',numbersColor,(){
                          setState(() {
                            userInput += '2';
                          });

                        }),
                        MyButton('3',numbersColor,(){
                          setState(() {
                            userInput += '3';
                          });

                        }),
                        MyButton('+',expressionsColor,(){
                          setState(() {
                            userInput += '+';
                          });

                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton('↻',numbersColor,(){
                          setState(() {
                            userInput = userInput.substring(0,userInput.length-1);
                          });

                        }),
                        MyButton('0',numbersColor,(){
                          setState(() {
                            userInput += '0';
                          });

                        }),
                        MyButton('.',numbersColor,(){
                          setState(() {
                            userInput += '.';
                          });

                        }),
                        MyButton('=',expressionsColor,(){
                          setState(() {
                            getResult();
                          });

                        }),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            


          ],
        ),
      ),
    );
  }
}
