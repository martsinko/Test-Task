import 'package:flutter/material.dart';
import '../../../../../core/config/components/app_photo.dart';

class LeprekonImageWidget extends StatelessWidget {
  const LeprekonImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
        image: AssetImage(fistPhotoSignUp));
  }
}