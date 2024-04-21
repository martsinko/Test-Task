import 'package:flutter/material.dart';
import '../../../../../core/config/components/app_photo.dart';

class IconEmailWidget extends StatelessWidget {
  const IconEmailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconEmail,
      scale: 0.85,
    );
  }
}