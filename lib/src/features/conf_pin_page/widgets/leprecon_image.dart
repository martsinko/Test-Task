import 'package:flutter/widgets.dart';
import '../../../../core/config/components/app_photo.dart';

class LelpreconImageWidget extends StatelessWidget {
  const LelpreconImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(fistPhotoPinPage, scale: 0.9);
  }
}