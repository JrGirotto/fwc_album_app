import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/register_page.dart';
import 'package:fwc_album_app/app/pages/auth/login/register/view/register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Loader<RegisterPage>, Messages<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário registrado com sucesso!');
    Navigator.of(context).pop(); // volta para tela de login e limpa a pilha);
  }
}
