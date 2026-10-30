# BTS Wiki 💜

Um projeto pessoal desenvolvido com **Flutter** e **Dart** para aprender desenvolvimento de interfaces multiplataforma. O BTS Wiki reúne informações sobre os integrantes do BTS em uma interface interativa, com carrossel de cartões, fotografias e páginas de detalhes.

Atualmente, o desenvolvimento e os testes estão concentrados nas versões **Web** e **Linux**. O projeto mantém uma estrutura multiplataforma e poderá receber testes para Android em uma etapa futura.

## ✨ Funcionalidades

- Tela inicial.
- Carrossel horizontal com os sete integrantes do BTS.
- Cartões com fotografias, nomes artísticos e posições.
- Navegação por setas.
- Seção “Sobre” sincronizada com o integrante selecionado.
- Ficha individual de cada integrante.
- Layout responsivo para diferentes tamanhos de janela.

## 🛠️ Tecnologias

- Flutter
- Dart
- Material 3

## 📁 Estrutura do projeto

```text
lib/
├── main.dart
├── models/
│   └── member.dart
└── screens/
    ├── home_page.dart
    ├── members_page.dart
    └── member_details_page.dart

assets/
└── images/
    └── members/
```

## 🚀 Como executar

### Pré-requisitos

- Flutter SDK instalado e configurado.
- Git instalado.
- Suporte ao desktop Linux habilitado para executar a versão Linux.

Verifique a instalação:

```bash
flutter doctor -v
```

### 1. Clonar o repositório

```bash
git clone URL_DO_REPOSITORIO
cd NOME_DA_PASTA
```

### 2. Instalar as dependências

```bash
flutter pub get
```

### 3. Executar na Web

```bash
flutter config --enable-web
flutter run -d web-server
```

Abra no navegador o endereço local apresentado no terminal.

### 4. Executar no Linux

```bash
flutter config --enable-linux-desktop
flutter run -d linux
```

Para verificar os dispositivos disponíveis:

```bash
flutter devices
```

## 🧭 Próximos passos

- Implementar pesquisa de integrantes.
- Aprimorar a interface e a responsividade.
- Expandir as informações das fichas individuais.
- Realizar testes e ajustes específicos para Android.

---

Desenvolvido como projeto pessoal de aprendizado com Flutter. 💜
