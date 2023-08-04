
enum CounterStatus { initial, add, subtract, reset, multiply; }

class CounterState {
  ///Crio a variavel que vai ter o estado trocado
  final CounterStatus status;
  final int counterValue;
  final String message;
  CounterState({
    required this.status,
    this.message = "",
    required this.counterValue,
  });

  ///Vai carregar nossa tela e entrar como counterValue = 0 
  CounterState.initial() : this(
    status: CounterStatus.initial,
    message: "messagemmmmmmm",
    counterValue: 0);
}
