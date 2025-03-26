import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String $result = '';
  bool $parenthesesOpen = true;

  ///ANCHOR - Função que trata o clique nos botões da calculadora.
  void handleButtonClick(String value) {
    setState(() {
      if (value == 'C') {
        $result = '';
        return;
      }
      if (value == '( )') {
        parenthesesOpenClose();
        return;
      }
      if (value == '=') {
        $result = calculate($result).toString();
        return;
      }
      $result += value;
    });
  }

  ///ANCHOR - Função que abre ou fecha parênteses.
  void parenthesesOpenClose() {
    setState(() {
      if ($parenthesesOpen) {
        $result += '(';
        $parenthesesOpen = false;
      } else {
        $result += ')';
        $parenthesesOpen = true;
      }
    });
  }

  ///ANCHOR - Função que calcula a expressão matemática.
double calculate(String mathExpression) {
  try {
    mathExpression = mathExpression.replaceAllMapped(
      RegExp(r'(\d+)%(\d+)'), 
      (match) => '(${match[1]}/100*${match[2]})'
    );

    GrammarParser p = GrammarParser();
    Expression exp = p.parse(mathExpression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  } catch (e) {
    return double.nan; // Retorna "NaN" se a expressão for inválida.
  }
}

  @override
  ///ANCHOR - Função que constrói a interface da calculadora.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Calculadora'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: Text(
                  $result,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('C');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('C', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('1');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('1', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('4');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('4', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('7');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('7', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('( )');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('( )', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('8');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('8', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('5');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('5', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('2');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('2', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('0');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('0', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('%');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('%', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('9');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('9', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('6');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('6', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('3');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('3', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('/');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('/', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('*');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('x', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('-');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('-', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('+');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('+', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            handleButtonClick('=');
                          },
                          child: CircleAvatar(
                            radius: 38,
                            child: Text('=', style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
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
