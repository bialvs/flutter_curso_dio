import 'package:flutter/material.dart';
import 'package:login_1/pages/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(63, 62, 62, 0),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 5,
                      child: Image.network('https://hermes.digitalinnovation.one/assets/diome/logo.png',
                      height: 100.0,),
                    ),
                    Expanded(child: Container()),                  
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Já tem cadastro?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight:FontWeight.bold,
                  color: Colors.white,
                ),),
                const SizedBox(
                  height: 15,
                ),
                const Text('Faça seu login e make the change_',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),),
                 const SizedBox(
                  height: 60,
                ),
                 // ::::::::: CAMPO DO E-MAIL :::::::::
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      
                    },
                     style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                       enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 109, 21, 124),
                        ),
                      ),
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.white,),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 109, 21, 124),
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // ::::::::: CAMPO DA SENHA :::::::::
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: isObscureText,
                    controller: senhaController,
                    onChanged: (value) {
                      
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.only(top: 0),
                              enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 109, 21, 124),
                        ),
                      ),
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Colors.white,),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Color.fromARGB(255, 109, 21, 124),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromARGB(255, 109, 21, 124),
                        ),
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // ::::::::: BOTÃO :::::::::
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (emailController.text.trim() == 'email@email.com' && senhaController.text.trim() == '123'){
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erro ao efetuar o login, verifique seu e-mail e sua senha!'))
                          );
                        }
                      }, 
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(7),
                          )
                        ),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 109, 21, 124))
                      ),
                      child: Text('ENTRAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),)),
                  ),
                ),
                const SizedBox(
                  height: 170,
                ),
                // ::::::::: COMPO ESQUECI A SENHA :::::::::
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Esqueci minha senha",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                // ::::::::: COMPO CRIAR CONTA :::::::::
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Criar conta",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}