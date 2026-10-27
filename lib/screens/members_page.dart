import 'package:bts_wiki/screens/members_detail_page.dart';
import 'package:flutter/material.dart';

import '../models/members_model.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Membros do BTS')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width < 600
              ? 2
              : width < 900
              ? 3
              : width < 1200
              ? 4
              : 5;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: Member.members.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              final member = Member.members[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemberDetailsPage(member: member),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: member.imagePath != null
                            ? Image.asset(
                                member.imagePath!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : const Center(child: Icon(Icons.person, size: 64)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              member.stageName,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              member.position,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
