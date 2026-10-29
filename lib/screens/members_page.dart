import 'package:bts_wiki/models/members_model.dart';
import 'package:flutter/material.dart';
import 'package:bts_wiki/screens/members_detail_page.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final PageController _pageController = PageController(viewportFraction: 0.72);

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openDetails(Member member) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberDetailsPage(member: member),
      ),
    );
  }

  void _restoreCarouselPosition() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted || !_pageController.hasClients) return;

    if (_pageController.page?.round() != _currentIndex) {
      _pageController.jumpToPage(_currentIndex);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final selectedMember = Member.members[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Membros do BTS')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth >= 850;
          _restoreCarouselPosition();

          if (isWideScreen) {
            // Computador: carrossel e descrição lado a lado.
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildCarouselSection(context, cardHeight: 470),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 5,
                        child: _buildAboutSection(context, selectedMember),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // Telas estreitas: conteúdo empilhado.
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            child: Column(
              children: [
                _buildCarouselSection(context, cardHeight: 390),
                const SizedBox(height: 24),
                _buildAboutSection(context, selectedMember),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarouselSection(
    BuildContext context, {
    required double cardHeight,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Conheça os integrantes',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Deslize para explorar cada membro.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: cardHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: Member.members.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final member = Member.members[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: _MemberCarouselCard(
                  member: member,
                  onTap: () => _openDetails(member),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Voltar ao integrante anterior.
            IconButton(
              tooltip: 'Membro anterior',
              onPressed: _currentIndex > 0
                  ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
              icon: const Icon(Icons.chevron_left),
            ),

            // Indicadores da posição no carrossel.
            ...List.generate(Member.members.length, (index) {
              final isSelected = index == _currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isSelected ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isSelected ? colors.primary : colors.outlineVariant,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),

            // Avançar para o próximo integrante.
            IconButton(
              tooltip: 'Próximo membro',
              onPressed: _currentIndex < Member.members.length - 1
                  ? () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context, Member member) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'SOBRE',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colors.primary,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              member.stageName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              member.description,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
            FilledButton.tonalIcon(
              onPressed: () => _openDetails(member),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Ver ficha completa'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberCarouselCard extends StatelessWidget {
  final Member member;
  final VoidCallback onTap;

  const _MemberCarouselCard({required this.member, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: member.imagePath != null
                  ? Image.asset(
                      member.imagePath!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: colors.surfaceContainerHighest,
                          alignment: Alignment.center,
                          child: const Icon(Icons.person, size: 72),
                        );
                      },
                    )
                  : Container(
                      color: colors.surfaceContainerHighest,
                      alignment: Alignment.center,
                      child: const Icon(Icons.person, size: 72),
                    ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: colors.primaryContainer,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      member.stageName,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 280),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        member.position,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: colors.onSecondaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
