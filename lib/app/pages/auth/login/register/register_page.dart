import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
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
                    decoration: const InputDecoration(
                      label: Text('Nome Completo *'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('E-Mail *'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Senha *'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Confirmar Senha *'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button.primary(
                    onPressed: () {},
                    width: MediaQuery.of(context).size.height * .9,
                    label: 'Cadastrar',
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
