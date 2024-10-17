import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
              onPressed: () {},
              style: ButtonStyles.i.primaryButton,
              child: const Text('Voltar'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyles.i.primaryOutlineButton,
              child: const Text('Sair'),
            ),
            const TextField(),
            Button(
                style: ButtonStyles.i.primaryButton,
                labelStyle: context.textStyles.textPrimaryFontBold,
                label: 'Salvar',
                onPressed: () {},),
            RoundedButton(icon: Icons.add, onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
