import 'package:flutter/material.dart';
import 'models/members_model.dart';


class MemberDetailsPage extends StatelessWidget{
  final Member member; //Recebe o membro selecionado da lista de membros
  const MemberDetailsPage({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(member.stageName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //Alinha o conteúdo da coluna à esquerda
          children:[
            Text( //Exibe o nome completo do membro com uma fonte maior e em negrito
              member.name,
              style: const TextStyle(
                fontSize: 24, //Tamanho da fonte
                fontWeight: FontWeight.bold, //Deixa o texto em negrito
              )
            ),
            const SizedBox(height: 12), //Adiciona um espaço entre o nome completo e o nome artístico do membro
            Text(
              'Nome artístico: ${member.stageName}',
            ),
            const SizedBox(height: 8), //Adiciona um espaço entre o nome artístico e a posição do membro
            Text('Posição: ${member.position}'),
            const SizedBox(height: 8), //Adiciona um espaço entre a posição e o aniversário do membro
            Text('Aniversário: ${member.birthday}'),
            const SizedBox(height: 20), //Adiciona um espaço entre o aniversário e a descrição do membro
            Text(
              'Sobre:',
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 8), //Adiciona um espaço entre o título "Sobre" e a descrição do membro
            Text(member.description),
          ]
        
        )
        )
    );
  }
}
