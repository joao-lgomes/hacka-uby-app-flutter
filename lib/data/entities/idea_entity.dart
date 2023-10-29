class IdeaEntity {
  final String name;
  final String identification;
  final String challenge;
  final String problem;
  final String? solution;
  final String? gain;

  IdeaEntity({
    required this.name,
    required this.identification,
    required this.challenge,
    required this.problem,
    this.solution,
    this.gain});
}
