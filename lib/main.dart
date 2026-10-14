import 'package:flutter/material.dart';
import 'MembersPage.dart';

void main() {
  runApp(const BTSApp());
}

class BTSApp extends StatelessWidget {
  const BTSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTS ARMY',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 202, 178, 244),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BTS ARMY'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              
              'Olá, ARMY! 💜',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explore o universo do BTS.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 212, 195, 242),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BTS',
                    style: TextStyle(
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Música, membros e muito mais.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _HomeButton(
                    icon: Icons.people,
                    title: 'Membros',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MembersPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _HomeButton(icon: Icons.album, title: 'Álbuns'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _HomeButton(icon: Icons.music_note, title: 'Músicas'),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _HomeButton(icon: Icons.quiz, title: 'Quiz'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _HomeButton({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 36),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
