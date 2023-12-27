import 'package:flutter/material.dart';
import 'package:login_e_anotacoes/const/dimensions.dart';

InputDecoration inputDecorationAddNote() {
  return InputDecoration(
    hintText: 'Digite sua anotação',
    hintStyle: const TextStyle(
      color: Colors.black,
      fontSize: Dimensions.textFieldHintFontSize,
      fontWeight: FontWeight.w500,
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.textFieldBorderRadius),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Dimensions.textFieldContentPaddingHorizontal,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: Dimensions.textFieldFocusedBorderWidth,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: Dimensions.textFieldEnabledBorderWidth,
      ),
    ),
  );
}

//cria um metodo que vai passar os parametros de um textformfield incluindo o controller, a função onEditingComplete
TextFormField inputFieldAddNote(
  TextEditingController controller, {
  required Function onEditingComplete,
}) {
  return TextFormField(
    controller: controller,
    textAlign: TextAlign.center,
    decoration: inputDecorationAddNote(),
    style: const TextStyle(
      fontWeight: Dimensions.textFieldStyleFontWeight,
      fontSize: Dimensions.textFieldStyleFontSize,
      color: Colors.black,
      fontFamily: "Exo2",
    ),
    onEditingComplete: () {
      onEditingComplete();
    },
  );
}

Row noNotesAvailable() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.notes,
        size: Dimensions.noteIconSize * 0.8,
        color: Colors.black.withOpacity(0.5),
      ),
      const SizedBox(
        width: Dimensions.textFieldSpacing,
      ),
      Text(
        'Nenhuma anotação encontrada',
        style: TextStyle(
          fontSize: Dimensions.pageTitleFontSize * 0.8,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

void showNoteDescriptionDialog(String description, BuildContext context) {
    //mostra um dialog customizado seguindo os padrões do projeto de cores e fontes, com titulo Descrição da anotação e um icone para fechar o dialog
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Dimensions.cardMarginHorizontal * 0.7,
              vertical: Dimensions.cardMarginVertical,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.cardPaddingVertical,
              horizontal: Dimensions.cardPaddingHorizontal,
            ),
            height: Dimensions.cardHeight * 0.7,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Dimensions.textFieldBorderRadius),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.notePaddingLeft),
                      child: Text(
                        'Descrição da anotação',
                        style: TextStyle(
                            fontSize: Dimensions.noteTitleFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close,
                          color: Colors.red,
                          size: Dimensions.noteIconSize * 0.8),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: Dimensions.noteDividerThickness,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: Dimensions.noteTitleFontSize,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }