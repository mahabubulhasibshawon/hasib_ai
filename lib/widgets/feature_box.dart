import 'package:flutter/material.dart';
import 'package:hasib_ai/utils/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;
  const FeatureBox({super.key, required this.color, required this.headerText, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(headerText,style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
          ),
          const SizedBox(height: 1,),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 10, left: 10),
            child: Text(descriptionText,style: TextStyle(
              fontFamily: 'Cera Pro',
              color: Pallete.blackColor
            ),),
          ),
          SizedBox(height: 2,)
        ],
      ),
    );
  }
}
