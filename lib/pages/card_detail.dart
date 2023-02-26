import 'package:flutter/material.dart';
import 'package:login_1/model/card_datail.dart';

class CardDatailPage extends StatelessWidget {

  final CardDetail cardDetail;
  const CardDatailPage ({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: Icon(Icons.close)),
                    Row(
                      children: [
                        Image.network(cardDetail.url,
                        height: 20,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(cardDetail.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(cardDetail.text,
                      textAlign: TextAlign.justify,                
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {}, 
                        child: Text('Ler mais')),
                    )          
                  ],
                ),
              ),
      ),
    );
  }
}