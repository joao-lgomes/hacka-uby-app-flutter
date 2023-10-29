import 'package:dio/dio.dart';
import 'package:hacka_ubyfol/data/entities/idea_entity.dart';
import 'package:hacka_ubyfol/data/services/dio_config.dart';

class SendIdeaService {
  Future<void> request(IdeaEntity idea) async {
    Dio dio = DioConfig();
    // dio.options.method="POST";
    try {
      await dio.post('/api/idea', data: {
        "userName": idea.name,
        "userEmail": idea.identification,
        "challenge": idea.challenge,
        "solution": idea.solution,
        "gain": idea.gain,
      });
    } catch (e) {
      rethrow;
    }
  }


}
