import 'package:flutter/material.dart';
import 'package:anotacoes_flutter_app/const/dimensions.dart';
import 'package:anotacoes_flutter_app/features/notes/provider/notes_provider.dart';
import 'package:anotacoes_flutter_app/features/notes/widgets/notes_widgets.dart';
import 'package:anotacoes_flutter_app/widgets/utils.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _textController = TextEditingController();
  final NotesProvider _notesProvider = NotesProvider();
  bool _isEditing = false;
  int _editingIndex = 0;
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _notesProvider.loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(gradient: AppWidgets.gradientBackground()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.cardMarginHorizontal,
                vertical: Dimensions.cardMarginVertical,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.cardPaddingVertical,
                horizontal: Dimensions.cardPaddingHorizontal,
              ),
              height: Dimensions.cardHeight,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.textFieldBorderRadius),
                color: Colors.white,
              ),
              child: _notesProvider.listOfNotes.isNotEmpty
                  ? AnimatedList(
                      key: _animatedListKey,
                      initialItemCount: _notesProvider.listOfNotes.length,
                      itemBuilder: (context, index, animation) {
                        if (index == 0 ||
                            index == _notesProvider.listOfNotes.length + 1) {
                          return _buildDummyItem(animation);
                        } else {
                          return _buildItem(index - 1,
                              animation); // Ajustar o índice para os outros itens
                        }
                      },
                    )
                  : noNotesAvailable()
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimensions.cardMarginHorizontal),
              child: inputFieldAddNote(
                _textController,
                onEditingComplete: () {
                  if (_isEditing) {
                    _notesProvider.editNote(
                        _editingIndex, _textController.text);
                    _isEditing = false;
                  } else {
                    _notesProvider.increment(_textController.text);
                    setState(() {
                      _animatedListKey.currentState
                          ?.insertItem(_notesProvider.listOfNotes.length - 1);
                    });
                  }
                  _textController.clear();
                },
              )),
        ],
      ),
    );
  }

  Widget _buildItem(int index, Animation<double> animation) {
    if (index < 0 || index >= _notesProvider.listOfNotes.length) {
      return Container();
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: Dimensions.notePaddingLeft),
                child: InkWell(
                  onTap: () {
                    if (index < _notesProvider.listOfNotes.length) {
                      showNoteDescriptionDialog(_notesProvider.listOfNotes[index].description, context);
                    }
                  },
                  child: Text(
                    _notesProvider.listOfNotes[index].title,
                    style: const TextStyle(
                        fontSize: Dimensions.noteTitleFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _isEditing = true;
                      _editingIndex = index;
                      _textController.text =
                          _notesProvider.listOfNotes[index].description;
                    },
                    child: const Icon(Icons.create_outlined,
                        color: Colors.black,
                        size: Dimensions.noteIconSize * 0.9),
                  ),
                  const SizedBox(
                    width: Dimensions.textFieldSpacing,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDeleteConfirmationDialog(index);
                    },
                    child: const Icon(Icons.cancel,
                        color: Colors.red, size: Dimensions.noteIconSize * 0.9),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: Dimensions.noteDividerThickness,
          ),
        ],
      ),
    );
  }

  Widget _buildDummyItem(Animation<double> animation) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: const SizedBox.shrink());
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: AppWidgets.titleText("Deseja excluir esta anotação?",
              color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextButton(
              onPressed: () {
                _notesProvider.removeNote(index);
                setState(() {
                  _animatedListKey.currentState?.removeItem(index,
                      (context, animation) => _buildItem(index, animation),
                      duration: const Duration(milliseconds: 500));
                });
                Navigator.pop(context);
              },
              child: const Text("Confirmar", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}

