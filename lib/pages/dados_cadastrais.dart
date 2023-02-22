import 'package:flutter/material.dart';
import 'package:login_1/repositories/linguagens-repository.dart';
import 'package:login_1/repositories/nivel_repository.dart';
import 'package:login_1/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {


   const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {

    TextEditingController nomeControler = TextEditingController(text: "");
    TextEditingController dataDeNacimentoControler = TextEditingController(text: "");
    DateTime? dataDeNascimento;
    var nivelRepository = NivelRepository();
    var linguagensRepository = LinguagensRepository();
    var niveis = [];
    var linguagens = [];
    var nivelSelecionado = '';
    var linguagensSelecionadas = [];
    double salarioEscolhido = 0;
    int tempoDeExperiencia = 0;

  @override

  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantiadeMaxima){
    var itens = <DropdownMenuItem<int>> [];
    for (var i = 0; i <= quantiadeMaxima; i++){
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,));
    }
    return itens;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Cadastro'),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const TextLabel(texto: 'Nome:'),
              TextField(
                controller: nomeControler,
              ),
              // ::::::::::::::::: CAMPO DATA DE NASCIMENTO ::::::::::::
              const TextLabel(texto: 'Data de nascimento:'),
              TextField(
                controller: dataDeNacimentoControler,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(1900, 1, 1), 
                    lastDate: DateTime(2029, 1, 1));
                    if (data != null){
                      dataDeNacimentoControler.text = data.toString();
                      dataDeNascimento = data;
                    }
                },
              ),
              // ::::::::::::::::::::::: INFORMAÇÃO DE NÍVEL :::::::::::::::
              const TextLabel(texto: 'Nível: '),
              Column(children: 
                niveis.map((nivel) => RadioListTile(
                  title: Text(nivel.toString()),
                  selected: nivelSelecionado == nivel,
                  value: nivel.toString(), 
                  groupValue: nivelSelecionado, 
                  onChanged: (value) {
                    setState(() {
                     nivelSelecionado = value.toString();
                    });
                  })).toList(),
              ),
              //:::::::::::::::::: LINGUAGENS :::::::::::::::::::
              const TextLabel(texto: 'Linguagens preferidas: '), 
              Column(children: linguagens.map( (linguagens) =>
                CheckboxListTile(
                title: Text(linguagens.toString()),
                value: linguagensSelecionadas.contains(linguagens), 
                onChanged: (bool? value) {
                    if (value!) {
                      linguagensSelecionadas.add(linguagens);
                    } else {
                      linguagensSelecionadas.remove(linguagens);
                    }
                  setState(() {
                    
                  });        
                }),).toList(), 
              ),
              // :::::::::::::::::::: TEMPO DE EXPERIÊNCIA :::::::::::::::::
               const TextLabel(texto: 'Tempo de experiência: '),
               DropdownButton(
                value: tempoDeExperiencia,
                isExpanded: true,
                items: returnItens(30), 
                onChanged: (value) {
                  setState(() {
                    tempoDeExperiencia = int.parse(value.toString());
                  });
                }),
              // :::::::::::::::::::::: PRETENÇÃO SALARIAL ::::::::::::::::
              TextLabel(texto: 'Pretenção salarial: R\$ ${salarioEscolhido.round().toString()}'),
              Slider(
              min: 0,
              max: 10000,
              value: salarioEscolhido, 
              onChanged: (double value) {
                setState(() {
                  salarioEscolhido = value;
                });
              }),
              TextButton(
                onPressed: () {},
               child: Text('Salvar')),
              ],          
            ),
          ),
        ),
      )
    );
   }
}