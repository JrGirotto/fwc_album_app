import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader<SplashPage>, Messages<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                showLoader();
                await Future.delayed(const Duration(seconds: 2));
                hideLoader();
              },
              style: ButtonStyles.i.primaryButton,
              child: const Text('Voltar'),
            ),
            OutlinedButton(
              onPressed: () {
                showInfo('Info');
              },
              style: ButtonStyles.i.primaryOutlineButton,
              child: const Text('Sair'),
            ),
            const TextField(),
            Button(
              style: ButtonStyles.i.primaryButton,
              labelStyle: context.textStyles.textPrimaryFontBold,
              label: 'Salvar',
              onPressed: () {
                showError("Erro!");
              },
            ),
            RoundedButton(
              icon: Icons.add,
              onPressed: () {
                showSuccess('Sucessooooo!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
