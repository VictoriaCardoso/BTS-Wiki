import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});
  final List<String> members = const [
    'RM',
    'Jin',
    'Suga',
    'J-Hope',
    'Jimin',
    'V',
    'Jungkook',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Membros do BTS')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(members[index][0]),
              ), //Exibe a primeira letra do nome do membro como avatar
              title: Text(members[index]), //Exibe o nome completo do membro
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
