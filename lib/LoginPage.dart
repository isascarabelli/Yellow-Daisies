import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body:
      SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              //logo
              const Icon(
                  Icons.calendar_month_rounded,
                  size: 100,
              ),
              SizedBox(height: 25),
              //Hello Again
              Text(
                "Hello Again!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Bem vindo ao Yellow Daisies!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              //Email

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Email'
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Senha',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

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
                  decoration: BoxDecoration(
                      color: Colors.cyan[400],
                      borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
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

              SizedBox(height: 25),
              
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
    );
  }
}
