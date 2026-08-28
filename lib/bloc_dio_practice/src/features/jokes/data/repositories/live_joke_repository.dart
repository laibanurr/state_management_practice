import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';

class LiveJokeRepository {
  final Dio dio = Dio();
  Future<List<LiveJokeData>> fetchOnlinejokes() async{
    try{
      final response = await dio.get('https://jokeapi.dev');
      if(response.statusCode==200){
        final List<dynamic> rawJokesList = 
        response.data['jokes'] as List<dynamic>? ?? [];
        return rawJokesList
            .map((jsonMap) =>
                LiveJokeData.fromMap(jsonMap as Map<String, dynamic>))
            .toList();
      }else{
      throw Exception('Server communication failure. Status: ${response.statusCode}');
      }
      
    } on DioException catch (dioError) {
        throw Exception('Network connection failed: ${dioError.message}');
    } catch (genericError) {
      // Captures runtime array mapping exceptions safely
      throw Exception('Failed parsing live content: $genericError');
    
    }
  }
}
