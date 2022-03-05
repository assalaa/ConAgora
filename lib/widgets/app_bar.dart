import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
Widget Custom_AppBar() {
  const _blueColor = Color(0xFF0D1863);
  const _greenColor = Color(0xFFEFB32C);
  return AppBar(
    elevation: 0,

    // shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    title: Text(
      "Accueil",
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _blueColor,
        ),
      ),
    ),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: () {},
        child: const Text('Se connecter', style: TextStyle(color: _greenColor)),
      )
    ],
  );
}
