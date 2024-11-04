import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
String openAIAPIKey = dotenv.env['openAIAPIKey']!;
class OpenAIService{
  Future<String> isArtPromptAPI(String propmt) async{
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
              'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
            }
          ],
        }),
      );
      print(res.body);
    }catch(e){}
  }

  Future<String> chatGPTAPI(String prompt) async{
    return 'CHATCPT';
  }
  Future<String> dallEAPI(String prompt) async{
  return 'DALL-E';
  }
}