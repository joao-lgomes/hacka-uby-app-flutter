import 'package:hacka_ubyfol/data/sqlite/get_db.dart';
import 'package:sqflite/sqflite.dart';

class DeleIdeasSqlite {
  Future<void> request() async {
    final db = await UbySqlite();
    try {
      await db.rawQuery('TRUNCATE table idea');
    } on DatabaseException catch (e) {

    }
    db.close();
  }
}