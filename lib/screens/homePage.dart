import 'package:flutter/material.dart';
import 'package:hasib_ai/utils/pallete.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasib'),
        leading: Icon(Icons.menu),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Pallete.assistantCircleColor,
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage( 'assets/images/virtualAssistant.png',))
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              border: Border.all(
                color: Pallete.borderColor
              ),
              borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Good Morning, What task can I do for you?',style: TextStyle(fontSize: 25, fontFamily: 'Cera Pro'),),
            ),
          ),
        //   suggestions list
          Container(
            margin: EdgeInsets.only(top: 20, left: 22),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Here are a few commands', style: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ),
        //   feature list
          Column(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
