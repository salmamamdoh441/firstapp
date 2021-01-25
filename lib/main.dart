import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main()
{
  runApp(calculator());
}
class calculator extends StatefulWidget {
  @override
  _XOgameState createState() => _XOgameState();
}

class _XOgameState extends State<calculator> {
  String input='';
  String output='';
  List <String> buttons=['C','Del','%','/','9','8','7','*','6','5','4','-','3','2','1','+','0','.','Ans','='];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: [
            SizedBox(height: 2,),

            SizedBox(height: 2,),  Expanded(



              child: Column(
                children: [
                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(input,style: TextStyle(fontSize: 30,color: Colors.deepPurple[500]),)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(output,style: TextStyle(fontSize: 40,color: Colors.deepPurple[600]),)),
                  ),

                ],
              ),
            ),

            Expanded(flex:2,

              child: Container(


                child: GridView.builder(itemCount:20,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,childAspectRatio: 1,

                ), itemBuilder: (context,index) {


                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: (){
                        if(buttons[index]=='C'){
                          setState(() {
                            input='';
                            output='';

                          });
                        }
                        else if(buttons[index]=='Del'){
                          setState(() {
                            input=input.substring(0,input.length-1);
                          });
                        }
                        else if(buttons[index]=='='){
                          setState(() {
                            equalbutton();

                          });
                        }
                        else if(buttons[index]=='Ans'){
                          setState(() {
                            input = output;
                          });
                        }
                        else if(buttons[index]=='%'||buttons[index]=='*'||buttons[index]=='/'||buttons[index]=='+'||buttons[index]=='-'){
                          input.endsWith('/')||input.endsWith('*')||input.endsWith('-')||input.endsWith('+')?null:input+=buttons[index];
                        }

                        else
                          setState(() {
                            input+=buttons[index];
                          });

                      },

                      child:Container(
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(25),
                              color: containerColor(buttons[index])


                          ),
                          child:Center(child: Text(buttons[index].toString(),style: TextStyle(fontSize: 25,color: Colors.black),))


                      ),

                    ),
                  );
                }),
              ),


            )
          ],
        ),),
    );
  }

  bool IsOperator(String x){
    if(
    x=='C'
    )
      return true;
    else
      return false;
  }
  Color containerColor(String c){if (IsOperator==true){
    return Colors.deepPurple;
  }
  else if (c=='C'){
    return Colors.green;

  } else if (c=='%'||c=='/'||c=='*'||c=='-'||c=='+'||c=='='){
    return Colors.deepPurple;
  }
  else if (c=='Del'){
    return Colors.red;
  }
  else {
    return Colors.white;
  }

  }

  void equalbutton(){
    Expression expression= Parser().parse(input);
    double endoutput=expression.evaluate(EvaluationType.REAL, ContextModel());
    setState(() {
      output=endoutput.toString();
    });

  }

}