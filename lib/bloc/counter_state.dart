class CounterState {
  ///Crio a variavel que vai ter o estado trocado
  final int counterValue;
  final String message;
  CounterState({
    this.message = "",
    required this.counterValue,
  });

  ///Vai carregar nossa tela e entrar como counterValue = 0 
  CounterState.initial() : this(counterValue: 0);
}
