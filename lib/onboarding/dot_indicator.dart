import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
 final bool active ;
   const DotIndicator({super.key ,required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(milliseconds: 300),
      height: 10,
      width: active? 20: 10,
      decoration: BoxDecoration(
        color: active ? Color(0xffe2be7f) : Colors.grey[400] ,
        borderRadius: BorderRadius.circular(20) ,

      ),
    );
  }
}
