// import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc_event.dart';
import 'package:bloc_learning/bloc/counter_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Cuidado ao importar o bloc, pois existem dois blocs, o bloc e o flutter_bloc (e nos queremos só o bloc)
class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  // CounterBloc() : super(CounterState(counterValue: 0)); //-> Ao invés de eu fazer isso direto no construtor, la no counter state eu crio um construtor e passo ele como abaixo
  CounterBloc() : super(CounterBlocState.initial()) {
    ///Quando receber uma transição de CounterAddEvent eu vou informar pro bloc pra ele atualizar
    ///Quando receber uma transição de CounterSubtractEvent eu vou informar pro bloc pra ele atualizar
    ///Quando receber uma transição de CounterResetEvent eu vou informar pro bloc pra ele atualizar
    ///Quando receber uma transição de CounterMultiplyEvent eu vou informar pro bloc pra ele atualizar
    on<CounterAddEvent>(_adicionar);
    on<CounterSubtractEvent>(_subtract);
    on<CounterResetEvent>(_reset);
    on<CounterMultiplyEvent>(_multiply);
  }

  ///Criando o metodo para adicionar (no onPress do botão nos passamos a classe CounterBloc e o metodo  fica dentro dela)
  void _adicionar(CounterAddEvent event, Emitter<CounterBlocState> emitter) {
    ///Transição
    var counterAgora = state.counterValue;
    counterAgora++;

    ///emitir(atualizar) o estado
    emitter(state.copyWith(
        counterValue: counterAgora,
        status: CounterStatus
            .add)); //* -> Quando eu adiciono o copyWith na counterState eu nao preciso passar todas as variaveis !!
    //Fica assim, tudo que eu tenho no meu estado e eu nao quero alterar é só eu chamar no copyWith
  }

  void _subtract(CounterSubtractEvent event, Emitter<CounterBlocState> emitter) {
    ///Transição
    var counterAgora = state.counterValue;
    counterAgora--;

    ///emitir(atualizar) o estado
    emitter(state.copyWith(
        counterValue: counterAgora,
        status: CounterStatus
            .subtract)); //* -> Quando eu adiciono o copyWith na counterState eu nao preciso passar todas as variaveis !!
    //Fica assim, tudo que eu tenho no meu estado e eu nao quero alterar é só eu chamar no copyWith
  }

  void _reset(CounterResetEvent event, Emitter<CounterBlocState> emitter) {
    ///emitir(atualizar) o estado
    emitter(state.copyWith(
        counterValue: 0,
        status: CounterStatus
            .reset)); //* -> Quando eu adiciono o copyWith na counterState eu nao preciso passar todas as variaveis !!
    //Fica assim, tudo que eu tenho no meu estado e eu nao quero alterar é só eu chamar no copyWith
  }

  void _multiply(CounterMultiplyEvent event, Emitter<CounterBlocState> emitter) {
    var counterAgora = state.counterValue;
    counterAgora *= event.valor; //-> PEgando o parametro

    ///emitir(atualizar) o estado
    emitter(state.copyWith(
        counterValue: counterAgora,
        status: CounterStatus
            .reset)); //* -> Quando eu adiciono o copyWith na counterState eu nao preciso passar todas as variaveis !!
    //Fica assim, tudo que eu tenho no meu estado e eu nao quero alterar é só eu chamar no copyWith
  }
}
