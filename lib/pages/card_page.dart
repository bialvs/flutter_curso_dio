import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_1/model/card_datail.dart';
import 'package:login_1/pages/card_detail.dart';
import 'package:login_1/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  
  CardDetail? cardDetail;
  CardDeatilRepository cardDeatilRepository = CardDeatilRepository();

  @override

  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cardDetail = await cardDeatilRepository.get();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Column(
      children: [ Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: cardDetail == null ? LinearProgressIndicator() : InkWell(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => CardDatailPage(
              cardDetail: cardDetail!,
            )));
          },
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(cardDetail!.url,
                      height: 20,),
                      SizedBox(
                        width: 10,
                      ),
                      Text(cardDetail!.title,
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
                  Text(cardDetail!.text,
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
        ),
      ),
      ] 
    );
  }
}