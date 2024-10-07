import 'package:flutter/material.dart';
import 'package:anotacoes_flutter_app/const/colors.dart';
import 'package:anotacoes_flutter_app/const/dimensions.dart';
import 'package:anotacoes_flutter_app/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.google.com.br');

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> iniciaUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Não foi possível iniciar a URL: $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(gradient: AppWidgets.gradientBackground()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.formHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.titleText('Usuário'),
                    const SizedBox(height: Dimensions.textFieldSpacing),
                    AppWidgets.inputField(
                      "Usuário",
                      Icons.person,
                      usuarioController,
                    ),
                    const SizedBox(height: Dimensions.textFieldSpacing),
                    AppWidgets.titleText('Senha'),
                    const SizedBox(height: Dimensions.textFieldSpacing),
                    AppWidgets.inputField(
                      "Senha",
                      Icons.lock,
                      senhaController,
                      isPassword: true,
                    ),
                    const SizedBox(height: Dimensions.buttonMarginTop),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await Future.delayed(const Duration(seconds: 2));
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            }
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.buttonPaddingHorizontal,
                            vertical: Dimensions.buttonPaddingVertical,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimensions.buttonBorderRadius,
                            ),
                          ),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(strokeWidth: 2)
                            : Text(
                                'Entrar',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: iniciaUrl,
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.privacyTextFontSize,
                    fontFamily: "Exo2",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
