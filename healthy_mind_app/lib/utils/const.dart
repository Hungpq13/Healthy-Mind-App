// ignore: unused_import
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const LinkAsset = 'assets/images/icons/';

class AssetCustom {
  static String getLinkImage(String nameImage) =>
      '$LinkAsset${nameImage.replaceAll(' ', '').toLowerCase()}.png';
}


