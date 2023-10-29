import 'package:hacka_ubyfol/data/entities/idea_entity.dart';
import 'package:hacka_ubyfol/data/sqlite/get_db.dart';
import 'package:sqflite/sqflite.dart';

class InsertIdeaSqlite {
  Future<void> request(IdeaEntity idea) async {
    final db = await UbySqlite();
    try {
      await db
          .rawUpdate('INSERT INTO idea values (?, ?, ?, ?, ?)', [idea.challenge, idea.solution, idea.gain, idea.name, idea.identification]);
    } on DatabaseException catch (e) {
    }
    db.close();
  }
}