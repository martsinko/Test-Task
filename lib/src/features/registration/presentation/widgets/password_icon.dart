import 'package:flutter/material.dart';
import '../../../../../core/config/components/app_photo.dart';

class IconPasswordWidget extends StatelessWidget {
  const IconPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(iconPassword, scale: 0.85);
  }
}