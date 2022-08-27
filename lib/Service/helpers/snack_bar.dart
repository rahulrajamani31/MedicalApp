// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';

class Snackbar {
  void showSnack(String message, GlobalKey<ScaffoldState> _scaffoldKey,
          Function undo) =>
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          action: undo != null
              ? SnackBarAction(
                  textColor:
                      Theme.of(_scaffoldKey.currentState!.context).primaryColor,
                  label: "Undo",
                  onPressed: () => undo,
                )
              : null,
        ),
      );
}
