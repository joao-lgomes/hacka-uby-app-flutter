import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';
import 'package:path_provider/path_provider.dart';
final initialScript = [
  '''
  create table if not exists idea (
    challenge varchar(255),
    solution longtext,
    gain longtext,
    user_name varchar(255),
    user_email varchar(255)
  );
  '''
];
final List<String> migrations = [];
// final List<String> migrations = [
//   '''
//   create table if not exists lastCitiesAccessed (
//     challenge varchar(255),
//     solution longtext,
//     gain longtext,
//     user_name varchar(255),
//     user_email varchar(255),
//   );
//   ''',
// ];

final config = MigrationConfig(
    initializationScript: initialScript, migrationScripts: migrations);
// ignore: non_constant_identifier_names
Future<Database> UbySqlite() async {
  final dbPath = Platform.isAndroid
      ? await getDatabasesPath()
      : "${(await getLibraryDirectory()).toString().split("'")[1]}/LocalDatabase/";
  final path = join(dbPath.toString().replaceAll("'", ""), 'ubyfol.db');
  return await openDatabaseWithMigration(path, config);
}