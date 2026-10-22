import 'package:flutter/material.dart';

import 'models/members_model.dart';

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
                child: Text(Member.members[index].name[0]),
              ), //Exibe a primeira letra do nome do membro como avatar
              title: Text(
                Member.members[index].name,
              ), //Exibe o nome completo do membro
              subtitle: Text(Member.members[index].position),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
