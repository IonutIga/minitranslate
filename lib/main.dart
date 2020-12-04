import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class TranslateButton {
  TranslateButton({this.id, this.text, this.audio});

  int id;
  String text;
  String audio;
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  final List<TranslateButton> _list = <TranslateButton>[
    TranslateButton(
        id: 1,
        text: 'Eu',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=eu&tl=ro&total=1&idx=0&textlen=2'),
    TranslateButton(
        id: 2,
        text: 'Ich',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=ich&tl=de&total=1&idx=0&textlen=3'),
    TranslateButton(
        id: 3,
        text: 'Aș dori să mănânc.',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=A%C8%99%20dori%20s%C4%83%20m%C4%83n%C3%A2nc.&tl=ro&total=1&idx=0&textlen=18'),
    TranslateButton(
        id: 4,
        text: 'Ich möchte essen.',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Ich%20m%C3%B6chte%20essen.&tl=de&total=1&idx=0&textlen=17'),
    TranslateButton(
        id: 5,
        text: 'Te iubesc!',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Te%20iubesc!&tl=ro&total=1&idx=0&textlen=10'),
    TranslateButton(
        id: 6,
        text: 'Ich liebe dich!',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Ich%20liebe%20dich!&tl=de&total=1&idx=0&textlen=15'),
    TranslateButton(
        id: 7,
        text: 'De unde ești?',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=De%20unde%20e%C8%99ti%3F&tl=ro&total=1&idx=0&textlen=13'),
    TranslateButton(
        id: 8,
        text: 'Wo kommen Sie her?',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Wo%20kommen%20Sie%20her%3F&tl=de&total=1&idx=0&textlen=18'),
    TranslateButton(
        id: 9,
        text: 'Vreau să lucrez.',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Vreau%20s%C4%83%20lucrez.&tl=ro&total=1&idx=0&textlen=16'),
    TranslateButton(
        id: 10,
        text: 'Ich möchte arbeiten.',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Ich%20m%C3%B6chte%20arbeiten.&tl=de&total=1&idx=0&textlen=20'),
    TranslateButton(
        id: 11,
        text: 'Unde pot să dorm?',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Unde%20pot%20s%C4%83%20dorm%3F&tl=ro&total=1&idx=0&textlen=17'),
    TranslateButton(
        id: 12,
        text: 'Wo kann Ich schlafen?',
        audio:
            'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Wo%20kann%20ich%20schlafen&tl=de&total=1&idx=0&textlen=20'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Romanian to German'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return RaisedButton(
              shape: const CircleBorder(),
              color: index % 2 == 0 ? Colors.indigoAccent : Colors.amber,
              onPressed: () async {
                print(_list[index].text);
                await _audioPlayer.play(_list[index].audio);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  _list[index].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
