import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({super.key});

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heigth*0.07),
        child: AppBar(
        backgroundColor: Colors.yellow[600],
        elevation: 0,
        )
      ),
      backgroundColor: Colors.cyan[200],
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            AlertDialog(
              backgroundColor: Colors.yellow[600],
              content: Container(
                height: heigth*0.7,
                width: width*0.69,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Sobre o Yellow Daisies:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Futura',
                      ),
                    ),
                   const Text(
                        "O aplicativo Yellow Daisies oferece aos seus usuários a ferramenta ideal para planejamento e organização diária e mensal. Ele auxilia na organização das tarefas diárias, mantendo um checklist com sua lista de tarefas, e ainda possibilita a organização de todas as tarefas futuras, com a função “My calendar”, que te lembra de eventos importantes, mesmo que esses aconteçam muito tempo depois.",
                     textAlign: TextAlign.justify,
                     style: TextStyle(
                       fontSize: 14,
                       fontFamily: 'Futura',
                     ),
                   ),
                    Text(""),
                    const Text(
                      "Sobre a desenvolvedora:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Futura',
                      ),
                    ),
                    const Text(
                      "Isabela Ferreira Scarabelli é estudante de Engenharia da Computação da PUC-Minas e é formada em nível técnico em desenvolvimento de sistemas pelo Colégio Técnico da UFMG.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                   Text(""),
                   Row(
                     children: [
                        IconButton(
                           icon: Image.asset('assets/images/linkedin.png'),
                           iconSize: heigth*0.02,
                           onPressed: (){},
                        ),
                       const Text(
                           "Isabela Scarabelli",
                           style: TextStyle(
                             fontSize: 13,
                           ),
                         ),
                       ],
                   ),
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset('assets/images/github.png'),
                          iconSize: heigth*0.02,
                          onPressed: (){},
                        ),
                        const Text(
                            "isascarabelli",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ]
                    ),
                       Row(
                         children: [
                           IconButton(
                             icon: Image.asset('assets/images/instagram.png'),
                             iconSize: heigth*0.02,
                             onPressed: (){},
                           ),
                           const Text(
                               "bela_fscarabelli",
                               style: TextStyle(
                                 fontSize: 13,
                               ),
                           ),
                         ],
                       ),
                    ]
              )
              )
            )
          ]
        ),
      ),
    );
  }
}
