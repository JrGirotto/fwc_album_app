import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {

  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 106.82,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bola.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text('Cadastrar Usuário', style: context.textStyles.titleBlack),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameEC,
                    decoration: const InputDecoration(
                          label: Text(
                            'Nome Completo *', 
                    ),
                        ),
                        validator:
                            Validatorless.required('Nome é obrigatório'),
                      ),
                  const SizedBox(height: 20),
                  TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text('E-Mail *'),
                    ),
                          validator: Validatorless.multiple([
                            Validatorless.email('E-mail inválido'),
                            Validatorless.required('E-mail é obrigatório'),
                          ])
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordEC,
                          obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Senha *'),
                    ),
                          validator: Validatorless.multiple([
                            Validatorless.min(6, 'Mínimo de 6 caracteres'),
                            Validatorless.required('Senha é obrigatória'),
                          ])
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmPasswordEC,
                          obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Confirmar Senha *'),
                    ),
                          validator: Validatorless.multiple([
                            Validatorless.min(6, 'Mínimo de 6 caracteres'),
                            Validatorless.required(
                                'Confirmar Senha é obrigatória'),
                            Validatorless.compare(
                                passwordEC, 'Senhas diferentes'),
                          ])
                  ),
                      const SizedBox(height: 30),
                  Button.primary(
                        onPressed: () {
                          final formValid =
                              formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            showLoader();
                            widget.presenter.register(
                                name: nameEC.text,
                                email: emailEC.text,
                                password: passwordEC.text,
                                confirmPassword: confirmPasswordEC.text);
                          }
                        },
                    width: MediaQuery.of(context).size.height * .9,
                    label: 'Cadastrar',
                      ),
                  
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
