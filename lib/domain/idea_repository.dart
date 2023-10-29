import 'package:hacka_ubyfol/data/entities/idea_entity.dart';
import 'package:hacka_ubyfol/data/services/send_idea_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/delete_ideas_sqlite_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/get_ideas_sqlite_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/insert_idea_service.dart';

class IdeaRepository {
  final SendIdeaService _sendIdeaService;
  final GetIdeasSqlite _getIdeasSqlite;
  final DeleIdeasSqlite _deleIdeasSqlite;
  final InsertIdeaSqlite _insertIdeaSqlite;

  IdeaRepository({
    required SendIdeaService sendIdeaService,
    required GetIdeasSqlite  getIdeasSqlite,
    required DeleIdeasSqlite deleIdeasSqlite,
    required InsertIdeaSqlite insertIdeaSqlite,
  }) : _insertIdeaSqlite = insertIdeaSqlite, _deleIdeasSqlite = deleIdeasSqlite, _getIdeasSqlite = getIdeasSqlite, _sendIdeaService = sendIdeaService {
    _sendEventsSqlite();
  }

  Future<bool> sendIdea(IdeaEntity idea) async {
    try {
      await _sendIdeaService.request(idea);
      return true;
    } catch (e) {
      _insertIdeaSqlite.request(idea);
      return false;
    }
  }

  _sendEventsSqlite() async {
    final ideas = await _getIdeasSqlite.request();

    for (final idea in ideas) {
      await _sendIdeaService.request(idea);
    }

    _deleIdeasSqlite.request();
  }
}
