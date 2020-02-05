import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cotação de Moeda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

TextStyle perg = TextStyle(color: Colors.blue),
          caixaTxt = TextStyle(color: Colors.red);

TextEditingController real = TextEditingController(), moeda = TextEditingController(), cotacao = TextEditingController();

double resultado, intreal, intcotacao;
String opcaoMoeda, resultadoTexto = ("");

class _MyHomePageState extends State<MyHomePage> {
  

  void converterMoeda() {
    setState(() {
      intreal = double.parse(real.text);
      intcotacao = double .parse(cotacao.text);
      opcaoMoeda = moeda.text;
      
        switch (opcaoMoeda) {
          case  '1':
            resultado = intcotacao*intreal;
            resultadoTexto = intreal.toStringAsFixed(2) + ' Reais valem ' + resultado.toStringAsFixed(2) + ' Dolar Americano';
            break;
          
          case  '2':
            resultado = intcotacao*intreal;
            resultadoTexto = intreal.toStringAsFixed(2) + ' Reais valem ' + resultado.toStringAsFixed(2) + ' Dolar Canadense';
            break;
          
          case  '3':
            resultado = intcotacao*intreal;
            resultadoTexto = intreal.toStringAsFixed(2) + ' Reais valem ' + resultado.toStringAsFixed(2) + ' Euros';
            break;
          
          default: 
            resultadoTexto = 'Digite uma das opções corretamente!'; 
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea( 
          child: Container(
            color: Colors.black87,
            
            child: Container(child: ListView(
              children: <Widget>[
                Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.,
                    children: <Widget>[
                      Text('Informe o valor que deseja converte: (Real)', style: perg),
                      TextField(controller: real, style: caixaTxt)
                    ]
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Text('Informe a moeda que deseja converter:\n1-Dolar Americano\n2-Dolar Canadense\n3-Euro', style: TextStyle()),
                      TextField(controller: moeda, style: caixaTxt)
                    ]
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Text('Informa o valor da cotação', style: perg),
                      TextField(controller: cotacao, style: caixaTxt),
                      RaisedButton(onPressed: converterMoeda, color: Colors.red,child: Text('Converter'),),
                      Text("$resultadoTexto" , style: perg)
                    ]
                  ),
                ),
          

                

              ],
            )),
          )
      ),
    );
  }
}
