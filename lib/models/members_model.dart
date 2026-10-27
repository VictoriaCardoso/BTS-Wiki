//Esse é o modelo de dados para os membros do grupo. Ele contém informações como nome, nome artístico, posição, aniversário e descrição do membro.
class Member {
  final String? imagePath; //Caminho da imagem do membro, que é opcional e pode ser nulo. 
  final String name;
  final String stageName;
  final String position;
  final String birthday;
  final String description;

  const Member({
    this.imagePath,
    required this.name, //Required quer dizer que o campo é obrigatório, ou seja, não pode ser nulo.
    required this.stageName,
    required this.position,
    required this.birthday,
    required this.description,
  });

  static const List<Member> members = [
    Member(
      //Lista de membros do grupo BTS
      name: 'Kim Namjoon',
      stageName: 'RM',
      position: 'Lider e rapper',
      birthday: '12/09/1994',
      description: '''RM é o líder do BTS e é conhecido por suas habilidades de rap e sua inteligência. Ele é fluente em inglês e é responsável por muitas das letras das músicas do grupo''',
      imagePath: 'assets/images/members/namjoon.jpeg'
    ),
    Member(
      name: 'Kim Seokjin',
      stageName: 'Jin',
      position: 'Vocalista',
      birthday: '04/12/1992',
      description: '''Jin é o vocalista do BTS e é conhecido por sua voz suave e poderosa. Ele também é conhecido por seu senso de humor e por ser o WWH (Worldwide Handsome) do grupo''',
      imagePath: 'assets/images/members/jin.jpeg'
    ),
    Member(
      name: 'Min Yoongi',
      stageName: 'Suga',
      position: 'Rapper',
      birthday: '09/03/1993',
      description: '''Suga é o rapper do BTS e é conhecido por suas habilidades de rap e por suas letras profundas e emocionantes. Ele também é produtor musical e já lançou músicas solo''',
      imagePath: 'assets/images/members/suga.jpeg'
    ),
    Member(
      name: 'Jung Hoseok',
      stageName: 'J-Hope',
      position: 'Rapper e dançarino',
      birthday: '18/02/1994',
      description: '''J-Hope é o rapper e dançarino do BTS e é conhecido por suas habilidades de dança e por sua energia positiva. Ele também é produtor musical e já lançou músicas solo''',
      imagePath: 'assets/images/members/jhope.jpeg'
    ),
    Member(
      name: 'Park Jimin',
      stageName: 'Jimin',
      position: 'Vocalista e dançarino',
      birthday: '13/10/1995',
      description: '''Jimin é o vocalista e dançarino do BTS e é conhecido por sua voz suave e poderosa, além de suas habilidades de dança. Ele também é conhecido por sua personalidade carismática''',
      imagePath: 'assets/images/members/jimin.jpeg'
    ),
    Member(
      name: 'Kim Taehyung',
      stageName: 'V',
      position: 'Vocalista',
      birthday: '30/12/1995',
      description: '''V é o vocalista do BTS e é conhecido por sua voz única e profunda. Ele também é ator e já participou de dramas coreanos''',
      imagePath: 'assets/images/members/v.jpeg'
    ),
    Member(
      name: 'Jeon Jungkook',
      stageName: 'Jungkook',
      position: 'Vocalista e dançarino',
      birthday: '01/09/1997',
      description: '''Jungkook é o vocalista e dançarino do BTS e é conhecido por suas habilidades vocais e de dança. Ele também é conhecido por sua personalidade humilde e por ser o maknae (o mais jovem) do grupo''',
      imagePath: 'assets/images/members/jungkook.jpeg'
    ),
  ];
}
