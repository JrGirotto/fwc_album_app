import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsApp.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                      child:
                          Text('Login', style: context.textStyles.titleWhite)),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('E-mail obrigatório'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: passwordEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(6, 'Mínimo de 6 caracteres'),
                  ]),
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    'Esqueceu a senha?',
                    style: context.textStyles.textSecondaryFontMedium
                        .copyWith(color: Colors.yellow, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 25),
                Button(
                    width: MediaQuery.of(context).size.width * .9,
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Entrar',
                    onPressed: () {
                      showLoader();
                      final formValid =
                          formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        widget.presenter.login(emailEC.text, passwordEC.text);
                      }
                    }),
              ]),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  Spacer(),
                  Text.rich(
                    style: context.textStyles.textSecondaryFontMedium
                        .copyWith(color: Colors.white),
                    TextSpan(text: 'Não tem uma conta?', children: [
                      TextSpan(
                        text: ' Cadastre-se',
                        style: context.textStyles.textSecondaryFontMedium
                            .copyWith(color: Colors.yellow),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed('/auth/register');
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
