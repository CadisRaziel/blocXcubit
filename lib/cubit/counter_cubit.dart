import 'package:bloc/bloc.dart';
import 'package:bloc_learning/cubit/counter_cubit_state.dart';

//!Diferente do bloc, ele só precisa do estado, não interessa os eventos
//*A importação é o bloc 'package:bloc/bloc.dart';'

class CounterCubit extends Cubit<CounterCubitState> {
  //?Metodos de construtores, tanto um quanto outro funciona da mesma maneira !!
  //? porém esse 'CounterCubit() : super(CounterState.initial());' ao instanciar essa classe ele não vai pedir parametro, mais o outro sim
  // CounterCubit(super.initialState);
  CounterCubit() : super(CounterCubitState.initial());


  //!Diferente to bloc nas funçoes não preciso receber o evento e nem o emiter, a unica coisa que precisamos é de um valor direto


  //*state -> o cubit tambem tem state assim como o bloc
  //?Agora trabalhamos com variaveis direta na função e não pegando evento e estado !!!
  void adicionar() {
    var counterAgora = state.counterValue;
    counterAgora++;

    emit(
        state.copyWith(counterValue: counterAgora, status: CounterStatus.add));
  }

  void subtract() {
    var counterAgora = state.counterValue;
    counterAgora--;

    emit(state.copyWith(
        counterValue: counterAgora, status: CounterStatus.subtract));
  }

  void reset() {
    emit(state.copyWith(counterValue: 0, status: CounterStatus.reset));
  }

  void multiply(int valor) {
    var counterAgora = state.counterValue;
    counterAgora *= valor;

    emit(state.copyWith(
        counterValue: counterAgora, status: CounterStatus.reset));
  }
}
