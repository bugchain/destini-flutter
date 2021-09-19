import 'package:flutter/material.dart';

import 'story_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StoryBrain storyBrain = StoryBrain();

  void onButtonClick() {
    setState(() {
      if (storyBrain.isShouldRestart()) {
        storyBrain.restart();
      } else {
        storyBrain.nextStory();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Center(
            child: Text(
              storyBrain.getStoryTitle(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.red.shade50, backgroundColor: Colors.red),
            child: Text(
              storyBrain.getStoryChoice1(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: onButtonClick,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: Visibility(
            visible: !storyBrain.isShouldRestart(),
            child: ElevatedButton(
              child: Text(
                storyBrain.getStoryChoice2(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: onButtonClick,
            ),
          ),
        ),
      ],
    );
  }
}
