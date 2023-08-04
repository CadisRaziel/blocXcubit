
import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/counter_event.dart';
import 'package:bloc_learning/bloc/counter_state.dart';

///Cuidado ao importar o bloc, pois existem dois blocs, o bloc e o flutter_bloc (e nos queremos só o bloc)
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  // CounterBloc() : super(CounterState(counterValue: 0)); //-> Ao invés de eu fazer isso direto no construtor, la no counter state eu crio um construtor e passo ele como abaixo
  CounterBloc() : super(CounterState.initial()) {
    ///Quando receber uma transição de CounterAddEvent eu vou informar pro bloc pra ele atualizar
    on<CounterAddEvent>(_adicionar);
  } 

  ///Criando o metodo para adicionar (no onPress do botão nos passamos a classe CounterBloc e o metodo  fica dentro dela)
  void _adicionar(CounterAddEvent event, Emitter<CounterState> emitter){
    ///Transição
    var counterAgora = state.counterValue;
    counterAgora++;    

    ///emitir(atualizar) o estado
    emitter(CounterState(message: state.message, counterValue: counterAgora, status: CounterStatus.add)); //!-> LEMBRE-SE AQUI EU PASSO TODAS AS VARIAVEIS DO COUNTERSTATE MESMO SE NAO FOR USAR !!!!!
  }
}