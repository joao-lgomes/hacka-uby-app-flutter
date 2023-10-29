import 'package:flutter/material.dart';
import 'package:hacka_ubyfol/data/services/send_idea_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/delete_ideas_sqlite_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/get_ideas_sqlite_service.dart';
import 'package:hacka_ubyfol/data/sqlite/services/insert_idea_service.dart';
import 'package:hacka_ubyfol/domain/idea_repository.dart';
import 'package:hacka_ubyfol/presentation/drawer/drawer_provider.dart';
import 'package:hacka_ubyfol/presentation/idea/idea_screen.dart';
import 'package:hacka_ubyfol/theme/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SendIdeaService()),
        Provider(create: (context) => DrawerProvider()),
        Provider(create: (context) => InsertIdeaSqlite()),
        Provider(create: (context) => GetIdeasSqlite()),
        Provider(create: (context) => DeleIdeasSqlite()),
        Provider(create: (context) => IdeaRepository(
          sendIdeaService: Provider.of<SendIdeaService>(context, listen: false),
          insertIdeaSqlite:  Provider.of<InsertIdeaSqlite>(context, listen: false),
          getIdeasSqlite:  Provider.of<GetIdeasSqlite>(context, listen: false),
          deleIdeasSqlite:  Provider.of<DeleIdeasSqlite>(context, listen: false),
        )),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: UbyColors.p2, primary: UbyColors.p1),
            useMaterial3: true,
          ),
          home: const IdeaScreen(),
        ),
      ),
    );
  }
}