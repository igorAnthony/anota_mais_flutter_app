import 'dart:convert';

import 'package:login_e_anotacoes/models/note_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'notes_provider.g.dart';

class NotesProvider = _NotesProviderBase with _$NotesProvider;

abstract class _NotesProviderBase with Store {
  @observable
  List<Note> listOfNotes = [];

  @computed
  List<Note> get getListOfNotes => listOfNotes;

  @action
  void increment(String text) {
    listOfNotes.add(Note(
      id: listOfNotes.length + 1,
      title: text.length > 10 ? text.substring(0, 10) : text,
      description: text,
    ));
    saveNotes();
  }
  @action
  void removeNote (int index){
    listOfNotes.removeAt(index);
    saveNotes();
  }
  @action
  void editNote (int index, String text){
    listOfNotes[index].title = text.substring(0, 10);
    listOfNotes[index].description = text;
    saveNotes();
  }

  @action
  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = [];
    listOfNotes.forEach((element) { 
      notes.add(jsonEncode(element.toJson()));
    });
    await prefs.setStringList('notes', notes);
  }

  @action
  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notes = prefs.getStringList('notes');
    if (notes != null) {
      notes.forEach((element) { 
        listOfNotes.add(Note.fromJson(jsonDecode(element)));
      });
    }
  }
}