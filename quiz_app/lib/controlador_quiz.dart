import './repositorio_questoes.dart';
import 'questao.dart';

/* Enum para determinar qual o status do Quiz */
enum StatusQuiz {
  AGUARDAR,
  RESPONDER,
  PROXIMA,
  FINALIZAR,
  RESULTADOS,
}

class ControladorQuiz {
  // repositório responsável por fornecer as questões
  final repositorio = RepositorioQuestoes();
  // indica qual o texto da alternativa selecionada
  String _alternativaSelecionada = "";
  // utiliza a enum para indicar qual o status atual do quiz
  StatusQuiz _status = StatusQuiz.AGUARDAR;
  // indica se o usuario respondeu
  bool _respondeu = false;
  // controla a questão atual
  int _indiceQuestaoAtual = 0;

  int get indiceQuestaoAtual => _indiceQuestaoAtual + 1;
  Questao get questaoAtual => repositorio.listar()[_indiceQuestaoAtual];
  int get quantidadeTotalQuestoes => repositorio.listar().length;
  StatusQuiz get status => _status;

  String get alternativaSelecionada => _alternativaSelecionada;
  bool get selecionouAlternativa => _status == StatusQuiz.RESPONDER;
  bool get respondeuPergunta => _respondeu;
  bool get acertouResposta =>
      (questaoAtual.alternativaCorreta == _alternativaSelecionada);

  bool get acabou => _status == StatusQuiz.FINALIZAR;
  bool get verResultados => _status == StatusQuiz.RESULTADOS;

  void selecionarAlternativa(String alternativa) {
    if (!_respondeu) {
      _alternativaSelecionada = alternativa;
      _status = StatusQuiz.RESPONDER;
    }
  }

  //método que determina o que fazer quando clicar no botão
  //de ação. Depende da variável _status.
  void acao() {
    //o usuário clicou em responder
    if (_status == StatusQuiz.RESPONDER) {
      _respondeu = true;
      //verifica se terminou
      if (_indiceQuestaoAtual == quantidadeTotalQuestoes - 1) {
        _status = StatusQuiz.FINALIZAR;
      } else {
        _status = StatusQuiz.PROXIMA;
      }
    } else if (_status == StatusQuiz.PROXIMA) {
      //passa para a próxima pergunta
      if (_indiceQuestaoAtual < quantidadeTotalQuestoes - 1) {
        _indiceQuestaoAtual += 1;
        _alternativaSelecionada = "";
        _respondeu = false;
        _status = StatusQuiz.AGUARDAR;
      }
      //se terminou mostrar os resultados
    } else if (_status == StatusQuiz.FINALIZAR) {
      _status = StatusQuiz.RESULTADOS;
    }
  }
}
