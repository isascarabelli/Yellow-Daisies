import 'package:flutter/material.dart';
import 'package:yd/firstScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool salvos = false;
  String? emailLido;
  int? senhaLida;
  TextEditingController tecSenha = TextEditingController();
  TextEditingController tecEmail = TextEditingController();

  _signIn(){
    Get.off(FirstScreen());
      /*Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FirstScreen())
      );*/
  }

  _saveData() async{
    final prefs = await SharedPreferences.getInstance();

      String email = tecEmail.text;
      int senha = int.parse(tecSenha.text);

      await prefs.setString('Email', email);
      await prefs.setInt('Senha', senha); // a chave será usada para recuperar dados

  }

  _returnEmail() async{
    final prefs = await SharedPreferences.getInstance();

    emailLido = prefs.getString('Email');

    return emailLido;
  }

  _returnSenha() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      senhaLida = prefs.getInt('Senha') ?? 0;
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                //logo
                Padding(
                  padding: EdgeInsets.only(top: width*0.12),
                  child: const Icon(
                      Icons.calendar_month_rounded,
                      size: 100,
                  ),
                ),
                const SizedBox(height: 25),
                //Hello Again
                const Text(
                  "Hello Again!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Bem vindo ao Yellow Daisies!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
                //Email

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: tecEmail,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: tecSenha,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Senha',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //forgot password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Esqueci a senha',
                      style: TextStyle(
                              color: Colors.grey[600],
                      ),),
                    ],
                  ),
                ),

                const SizedBox(height: 25.0),
                //sign in
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),

                    child: Center(
                      child: ElevatedButton(
                        style:  const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
                        ),

                        onPressed: _signIn,
                        child:
                          Padding(
                            padding: EdgeInsets.only(right: width*0.2, left: width*0.2, top: height*0.02, bottom: height*0.02),
                            child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                        ),
                          ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                //ainda não possui cadastro?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        "Não tem uma conta? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Cadastre-se aqui.",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
