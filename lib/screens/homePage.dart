import 'package:flutter/material.dart';
import 'package:hasib_ai/utils/openai_service.dart';
import 'package:hasib_ai/utils/pallete.dart';
import 'package:hasib_ai/widgets/feature_box.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();

  @override
  void initState() {
    super.initState();
  }

  // initialize speech to text
  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  Future<void> onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasib'),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.assistantCircleColor,
                    ),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                        'assets/images/virtualAssistant.png',
                      ))),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin:
                  const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.borderColor),
                  borderRadius:
                      BorderRadius.circular(20).copyWith(topLeft: Radius.zero)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Good Morning, What task can I do for you?',
                  style: TextStyle(fontSize: 25, fontFamily: 'Cera Pro'),
                ),
              ),
            ),
            //   suggestions list
            Container(
              margin: const EdgeInsets.only(top: 20, left: 22),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  Text(
                    'Here are a few commands',
                    style: TextStyle(
                        fontFamily: 'Cera Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //   feature list
            const Column(
              children: [
                FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'ChatGPT',
                    descriptionText:
                        'A samrter way to stay organized and informed with ChatGPT'),
                FeatureBox(
                    color: Pallete.secondSuggestionBoxColor,
                    headerText: 'Dall-E',
                    descriptionText:
                        'Get inspired and stay creative with your personal assistant powered by Dall-E'),
                FeatureBox(
                    color: Pallete.firstSuggestionBoxColor,
                    headerText: 'Smart Voice Assistant',
                    descriptionText:
                        'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            startListening();
            print('listengng');
          } else if (speechToText.isListening) {
            await openAIService.isArtPromptAPI(lastWords);
            stopListening();
            print('stop listenting');
          }
          else {
            initSpeechToText();
          }
        },
        child: const Icon(Icons.mic),
        backgroundColor: Pallete.firstSuggestionBoxColor,
      ),
    );
  }
}
