import 'dart:convert'; // 1. MANDATORY: Add this import at the top for jsonDecode!
import 'package:dio/dio.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';

class LiveJokeRepository {
  final Dio _dio = Dio();

  Future<List<LiveJokeData>> fetchOnlineJokes() async {
    try {
      final response = await _dio.get(
        'https://jokeapi.dev',
      );

      if (response.statusCode == 200) {
        // 2. FIXED: Dynamically capture the response map format whether it arrives as String or Map
        Map<String, dynamic> responseMap;
        
        if (response.data is String) {
          // If the server payload arrives as raw text, decode it into a clean Map
          responseMap = jsonDecode(response.data as String) as Map<String, dynamic>;
        } else {
          // If it is already a decoded map structure, use it directly
          responseMap = response.data as Map<String, dynamic>;
        }

        // 3. Extract the array from our validated response map layout safely
        final List<dynamic> rawJokesList = responseMap['jokes'] as List<dynamic>? ?? [];

        return rawJokesList
            .map((jsonMap) => LiveJokeData.fromMap(jsonMap as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Server communication failure. Status: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Network connection failed: ${dioError.message}');
    } catch (genericError) {
      throw Exception('Failed parsing live content: $genericError');
    }
  }
}
