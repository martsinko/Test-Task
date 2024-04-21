import 'package:flutter/widgets.dart';
import '../../../../core/config/components/app_photo.dart';

class LeprekonIconWidget extends StatelessWidget {
  const LeprekonIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(fistPhotoPinPage, scale: 0.9);
  }
}