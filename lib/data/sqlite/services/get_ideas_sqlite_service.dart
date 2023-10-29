import 'package:hacka_ubyfol/data/entities/idea_entity.dart';
import 'package:hacka_ubyfol/data/sqlite/get_db.dart';
import 'package:sqflite/sqflite.dart';

class GetIdeasSqlite {
  Future<List<IdeaEntity>> request() async {
    final db = await UbySqlite();
    final List<IdeaEntity> events = [];
    try {
      final rawData = await db.rawQuery('SELECT challenge, solution, gain, user_name, user_email from idea');
      for (final item in rawData) {
        events.add(IdeaEntity(
            name: item['user_name'] as String,
            identification: item['user_email'] as String,
            challenge: item['challenge'] as String,
            problem: item['challenge'] as String, //TODO: DEPOIS ATUALIZAR COM O PROBLEMA DO BANCO
            solution: item['solution'] as String,
            gain: item['gain'] as String));
      }
    } on DatabaseException catch (e) {

    }
    db.close();
    return events;
  }
}