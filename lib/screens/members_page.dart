import 'package:bts_wiki/screens/members_detail_page.dart';
import 'package:flutter/material.dart';

import '../models/members_model.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Membros do BTS')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: Member.members.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: 
                Member.members[index].imagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        Member.members[index].imagePath!,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    )
                  :
                  Text(Member.members[index].stageName[0])
              ), //Exibe a primeira letra do nome do membro como avatar
              title: Text(
                Member.members[index].name,
              ), //Exibe o nome completo do membro
              subtitle: Column ( //Exibe a posição e o aniversário do membro e caso eu queira adicionar mais de uma informação é necessário colocar o 
              //Column para que as informações fiquem uma embaixo da outra
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(Member.members[index].position),
                Text(Member.members[index].birthday),
                ]
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailsPage(member:Member.members[index])
                  ));
              }
            ),
          );
        },
      ),
    );
  }
}

