// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesProvider on _NotesProviderBase, Store {
  Computed<List<Note>>? _$getListOfNotesComputed;

  @override
  List<Note> get getListOfNotes => (_$getListOfNotesComputed ??=
          Computed<List<Note>>(() => super.getListOfNotes,
              name: '_NotesProviderBase.getListOfNotes'))
      .value;

  late final _$listOfNotesAtom =
      Atom(name: '_NotesProviderBase.listOfNotes', context: context);

  @override
  List<Note> get listOfNotes {
    _$listOfNotesAtom.reportRead();
    return super.listOfNotes;
  }

  @override
  set listOfNotes(List<Note> value) {
    _$listOfNotesAtom.reportWrite(value, super.listOfNotes, () {
      super.listOfNotes = value;
    });
  }

  late final _$saveNotesAsyncAction =
      AsyncAction('_NotesProviderBase.saveNotes', context: context);

  @override
  Future<void> saveNotes() {
    return _$saveNotesAsyncAction.run(() => super.saveNotes());
  }

  late final _$loadNotesAsyncAction =
      AsyncAction('_NotesProviderBase.loadNotes', context: context);

  @override
  Future<void> loadNotes() {
    return _$loadNotesAsyncAction.run(() => super.loadNotes());
  }

  late final _$_NotesProviderBaseActionController =
      ActionController(name: '_NotesProviderBase', context: context);

  @override
  void increment(String text) {
    final _$actionInfo = _$_NotesProviderBaseActionController.startAction(
        name: '_NotesProviderBase.increment');
    try {
      return super.increment(text);
    } finally {
      _$_NotesProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(int index) {
    final _$actionInfo = _$_NotesProviderBaseActionController.startAction(
        name: '_NotesProviderBase.removeNote');
    try {
      return super.removeNote(index);
    } finally {
      _$_NotesProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editNote(int index, String text) {
    final _$actionInfo = _$_NotesProviderBaseActionController.startAction(
        name: '_NotesProviderBase.editNote');
    try {
      return super.editNote(index, text);
    } finally {
      _$_NotesProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOfNotes: ${listOfNotes},
getListOfNotes: ${getListOfNotes}
    ''';
  }
}
