// ignore_for_file: public_member_api_docs, sort_constructors_first
///Crio minha classe de eventos
class CounterEvent {}


///Crio as classe de envento que eu desejo
class CounterAddEvent extends CounterEvent{}
class CounterSubtractEvent extends CounterEvent{}
class CounterResetEvent extends CounterEvent{}

//Passando parametros
class CounterMultiplyEvent extends CounterEvent {
  int valor;
  CounterMultiplyEvent({
    required this.valor,
  });
}
