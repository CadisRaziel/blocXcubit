// ignore_for_file: public_member_api_docs, sort_constructors_first
///Crio minha classe de eventos
class CounterBlocEvent {}


///Crio as classe de envento que eu desejo
class CounterAddEvent extends CounterBlocEvent{}
class CounterSubtractEvent extends CounterBlocEvent{}
class CounterResetEvent extends CounterBlocEvent{}

//Passando parametros
class CounterMultiplyEvent extends CounterBlocEvent {
  int valor;
  CounterMultiplyEvent({
    required this.valor,
  });
}
