import 'questao.dart';

final lista_questoes = [
  Questao(
    enunciado: "Qual a capital do Brasil?",
    alternativaCorreta: "Brasilia",
    alternativasIncorretas: [
      "São Paulo",
      "Curitiba",
      "Rio de Janeiro",
    ],
  ),
  Questao(
    enunciado: "Qual a capital do Paraná?",
    alternativaCorreta: "Curitiba",
    alternativasIncorretas: [
      "Floripa",
      "Porto Alegre",
      "Manaus",
    ],
  ),
  Questao(
    enunciado: "Qual a capital do Espirito Santo?",
    alternativaCorreta: "Vitória",
    alternativasIncorretas: [
      "Rio de Janeiro",
      "São Paulo",
      "Manaus",
    ],
  ),
];

class RepositorioQuestoes {
  final List<Questao> _questoes = List.from(lista_questoes);

  List<Questao> listar() {
    return _questoes;
  }
}
