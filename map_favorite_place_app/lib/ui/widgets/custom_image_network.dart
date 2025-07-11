import 'dart:ui';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {

  final String _url;

  const CustomImageNetwork(this._url, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsetsGeometry.symmetric(
          vertical: 20
      ),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    ),
  );
}
