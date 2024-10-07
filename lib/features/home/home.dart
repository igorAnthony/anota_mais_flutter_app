import 'package:flutter/material.dart';
import 'package:anotacoes_flutter_app/features/notes/presentation/notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          physics: NeverScrollableScrollPhysics(),
          child: NotesPage()),
      ),
    );
  }
}