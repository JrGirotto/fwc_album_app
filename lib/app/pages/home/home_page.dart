import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/widgets/sticker_percent_width.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: ColorsApp.i.primary,
      appBar: AppBar(
        backgroundColor: ColorsApp.i.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
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
                    percent: user?.totalCompletePercent ?? 0,
                  ),
                  const SizedBox(height: 20),
                  Text('${user?.totalStickers ?? 0} figurinhas',
                      style: context.textStyles.titleWhite),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/all_icon.png'),
                    label: 'Todos',
                    value: user?.totalAlbum ?? 0,
                  ),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/missing_icon.png'),
                    label: 'Faltando',
                    value: user?.totalComplete ?? 0,
                  ),
                  const SizedBox(height: 20),
                  StatusTile(
                    icon: Image.asset('assets/images/repeated_icon.png'),
                    label: 'Repetidas',
                    value: user?.totalDuplicates ?? 0,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/my-stickers');
                    },
                    width: MediaQuery.of(context).size.width * .90,
                    outline: true,
                    style: context.buttonStyles.yellowOutlineButton,
                    labelStyle:
                        context.textStyles.textSecondaryFontExtraBold.copyWith(
                      color: context.colors.yellow,
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
