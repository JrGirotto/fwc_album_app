import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/widgets/sticker_percent_width.dart';

class HomePage extends StatelessWidget {

  const HomePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        backgroundColor: ColorsApp.i.primary,
        actions: [
          IconButton(
            onPressed: () {
              context.get<GlobalContext>().loginExpire();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  //const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(bottom: 35),
                    width: MediaQuery.of(context)
                        .size
                        .width, // 150(data: data, child: child), child: child),
                    child: Image.asset(
                      'assets/images/bola.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  StickerPercentWidth(
                    percent: 60,
                  ),
                  const SizedBox(height: 20),
                  Text('45 figurinhas', style: context.textStyles.titleWhite),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/all_icon.png'),
                    label: 'Todos',
                    value: 10,
                  ),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/missing_icon.png'),
                    label: 'Faltando',
                    value: 10,
                  ),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/repeated_icon.png'),
                    label: 'Repetidas',
                    value: 10,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    onPressed: () {},
                    width: MediaQuery.of(context).size.width * .90,
                    outline: true,
                    style: context.buttonStyles.yellowOutlineButton,
                    labelStyle:
                        context.textStyles.textSecondaryFontExtraBold.copyWith(
                      color: context.colorsApp.yellow,
                    ),
                    label: 'Minhas Figurinhas',
                  ),
                ]),
              ),
            ),
          );
        }),
      ),
    );
              
            

  }
      
      
}
