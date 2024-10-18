import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/presenter/register_presenter_impl.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/register_page.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>(
          (i) => RegisterPresenterImpl(authRepository: i()),
        )
      ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}
