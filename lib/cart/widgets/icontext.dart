import 'package:flutter/cupertino.dart';
import 'package:test/cart/widgets/smalltext.dart';

import 'package:test/utility/dimentions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final text;
  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize25,),
        SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}
