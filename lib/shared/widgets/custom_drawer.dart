import 'package:flutter/material.dart';
import 'package:login_1/pages/login_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                  onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        context: context, 
                        builder: (BuildContext bc) {
                          return Wrap(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                title: Text('Câmera'),
                                leading: Icon(Icons.camera),
                              ),
                              ListTile(
                                title: Text('Galeria'),
                                leading: Icon(Icons.album_outlined),
                              ),
                            ],
                          );
                        });
                    },
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 109, 21, 124),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Image.network('https://hermes.digitalinnovation.one/assets/diome/logo.png')),
                      accountName: Text('Beatriz Alves'), 
                      accountEmail: Text('email@email.com')),
                ),
                  InkWell (
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Dados cadastrais'),
                          ],
                        ),
                        ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DadosCadastraisPage()));
                    },
                  ),
                  Divider(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.circle_outlined),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Configurações'),
                          ],
                          ),
                        ),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child:Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Termos de uso'),
                          ],
                        ),
                       ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        context: context, 
                        builder: (BuildContext bc) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            child: Column(
                              children: [
                                Text('Termos de uso',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.justify,
                              )
                              ],
                            ),
                          );
                        });
                    },
                  ),
                  Divider(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Sair'),
                          ],
                          ),
                        ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (BuildContext bc) {
                          return AlertDialog(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                              ),
                            title: Text('DIO'),
                            content: Wrap(
                              children: [
                                Text('Deseja sair do aplicativo?')],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, 
                                  MaterialPageRoute(builder: (context) => const Login() ));
                                }, 
                                child: Text('Sair')),
                                TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                }, 
                                child: Text('Voltar'))
                            ],
                          );
                        });
                    },
                  ),
                ],
              ),
            );
  }
}