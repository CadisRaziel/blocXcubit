// ignore_for_file: public_member_api_docs, sort_constructors_first

enum CounterStatus { initial, add, subtract, reset, multiply; }

class CounterCubitState {
  ///Crio a variavel que vai ter o estado trocado
  final CounterStatus status;
  final int counterValue;
  final String message;
  CounterCubitState._({
    required this.status,
    this.message = "",
    required this.counterValue,
  });

  ///Vai carregar nossa tela e entrar como counterValue = 0 
  CounterCubitState.initial() : this._(
    status: CounterStatus.initial,
    message: "messagemmmmmmm",
    counterValue: 0);


  //? CopyWith é um design pattern prototype, ele vai copiar o estado atual e vai mudar apenas o que eu quiser
  //com o copyWith eu posso colocar meu construtor privado (pois eu nunca mais vou instanciar essa classe)
  CounterCubitState copyWith({
    CounterStatus? status,
    int? counterValue,
    String? message,
  }) {
    return CounterCubitState._(
      status: status ?? this.status,
      counterValue: counterValue ?? this.counterValue,
      message: message ?? this.message,
    );
  }
}
