import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacka_ubyfol/data/entities/idea_entity.dart';
import 'package:hacka_ubyfol/domain/idea_repository.dart';
import 'package:hacka_ubyfol/presentation/drawer/drawer.dart';
import 'package:hacka_ubyfol/theme/colors.dart';
import 'package:hacka_ubyfol/theme/styles/input_decoration.dart';
import 'package:hacka_ubyfol/theme/typography.dart';
import 'package:provider/provider.dart';

class IdeaScreen extends StatelessWidget {
  final String? userName;
  final String? userIdentification;
  const IdeaScreen({super.key, this.userName, this.userIdentification});

  @override
  Widget build(BuildContext context) {

    late final TextEditingController nameCtr =
    TextEditingController(text: userName);
    late final TextEditingController identCtr =
    TextEditingController(text: userIdentification);
    String? themeSelected;
    final TextEditingController problemCtr = TextEditingController();
    final TextEditingController solutionCtr = TextEditingController();
    final TextEditingController justificationCtr = TextEditingController();

    final List<dynamic> themeOptions = [
      {
        "text": "Otimização",
        // "value": 1
      },
      {
        "text": "Finanças",
        // "value": 1
      },
      {
        "text": "Tecnologia",
        // "value": 1
      },
      {
        "text": "Produto",
        // "value": 1
      },
      {
        "text": "Campo",
        // "value": 1
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      drawer: const UbyDrawer(indexOfItemSelected: 0),
      appBar: AppBar(
        title: const Text("Tire sua ideia do papel"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SvgPicture.asset(
                    'assets/icons/idea.svg',
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8),
                  child: TextFormField(
                    controller: nameCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: UbyInputDecoration(
                      label: "Nome*",
                      showLabel: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8),
                  child: TextFormField(
                    controller: identCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: UbyInputDecoration(
                        label: "Identificação*",
                        showLabel: true
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8),
                    child: DropdownButtonFormField(
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      key: const Key('Select Product Dropdown'),
                      value: themeSelected,
                      decoration: UbyInputDecoration(
                          label: 'Tema', showLabel: true),
                      items: themeOptions
                          .map<DropdownMenuItem<dynamic>>(
                              (e) => DropdownMenuItem<dynamic>(
                            value: e["text"],
                            child: Text(e["text"],
                                key: Key(e["text"]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          themeSelected = value;
                        }
                      },
                      icon: const Icon(Icons.arrow_downward),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8),
                  child: TextFormField(
                    controller: problemCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: UbyInputDecoration(
                        label: "Problema*",
                        showLabel: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8),
                  child: TextFormField(
                    controller: solutionCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: UbyInputDecoration(
                        label: "Solução",
                        showLabel: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8),
                  child: TextFormField(
                    controller: justificationCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: UbyInputDecoration(
                        label: "Justificativa",
                        showLabel: true
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UbyColors.s1,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enviar Inovação",
                            style: UbyTypographySemiBold.subheading_2.copyWith(color: UbyColors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.send, color: UbyColors.white),
                          ),
                        ],
                      ),
                      onPressed: (){
                        final IdeaEntity idea = IdeaEntity(
                            name: nameCtr.text,
                            identification: identCtr.text,
                            challenge: themeSelected!,
                            problem: problemCtr.text,
                            solution: solutionCtr.text,
                            gain: justificationCtr.text
                        );
                        Provider.of<IdeaRepository>(context, listen: false).sendIdea(idea).then((value){
                          if(value){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Inovação enviada com sucesso!"),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2)));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Falha de internet, inovação anotada!"),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2)));
                          }
                        });

                    },),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
