import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hasib_ai/utils/secrets.dart';

import 'package:http/http.dart' as http;

class OpenAIService{
  Future<String> isArtPromptAPI(String prompt) async{
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKEY}',

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
      if(res.statusCode == 200){
        print('yay');
      }
      return 'ai';
    }catch(e){
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async{
    return 'CHATCPT';
  }
  Future<String> dallEAPI(String prompt) async{
  return 'DALL-E';
  }
}