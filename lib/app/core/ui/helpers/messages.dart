import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    final overlay = Overlay.of(context);
    showTopSnackBar(
      overlay,
      CustomSnackBar.error(
        message: message,
        backgroundColor: context.colorsApp.primary,
      ),
    );
  }
  void showInfo(String message) {
    final overlay = Overlay.of(context);
    showTopSnackBar(
      overlay,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }

  void showSuccess(String message) {
    final overlay = Overlay.of(context);
    showTopSnackBar(
      overlay,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }
}
