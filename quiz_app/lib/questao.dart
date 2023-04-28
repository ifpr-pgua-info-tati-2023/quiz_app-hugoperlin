class Questao {
  final String enunciado;
  final String alternativaCorreta;
  final List<String> alternativasIncorretas;
  final List<String> _alternativas = [];

  Questao({
    required this.enunciado,
    required this.alternativaCorreta,
    required this.alternativasIncorretas,
  }) {
    _alternativas.addAll(alternativasIncorretas);
    _alternativas.add(alternativaCorreta);
    _alternativas.shuffle();
  }

  List<String> get alternativas => _alternativas;
}
