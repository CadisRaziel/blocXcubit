import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:bloc_learning/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
   
   //!Com o cubit ele continua tudo usando BlocListener e tudo do bloc !!!!
  //! Apenas a chamadas das funçoes do counter_bloc são diferentes

 //* Aqui chamaos o counterCubit e não o counterBloc
    return BlocListener<CounterCubit, CounterCubitState>(
      ///Toda vez que tiver uma nova saida do CounterState ele vai emitir o que esta aqui dentro
      ///Lemnbre-se ele não vai rebuildar a tela
      ///ou seja toda vez que eu clicar no botão que tenha o selector do CounterState ele vai emitir o que esta aqui dentro
      listener: (context, state) {
        //Aqui poderia ser navegações, snackbar, dialog, etc
        String message = 'Estado inicial';
        if (state.status == CounterStatus.add) {
          switch (state.status) {
            case CounterStatus.initial:
              message = "estado inicial";
              break;
            case CounterStatus.add:
              message = "estado de add";
              break;
            case CounterStatus.subtract:
              message = "estado de subtrair";
              break;
            case CounterStatus.reset:
              message = "estado de reset";
              break;
            case CounterStatus.multiply:
              message = "estado de multiplicar";
              break;
            default:
              message = "erro";
          }
        }
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //* Aqui chamaos o counterCubit e não o counterBloc
          BlocSelector<CounterCubit, CounterCubitState, String>(
              selector: (state) => state.message,
              builder: (context, String message) {
                return Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
                //* Aqui chamaos o counterCubit e não o counterBloc
          BlocSelector<CounterCubit, CounterCubitState, int>(
              selector: (state) => state.counterValue,
              builder: (context, int count) {
                return Text(
                  "0",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
          Wrap(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // context.read<CounterBloc>().add(CounterAddEvent()); //*-> Bloc
                    context.read<CounterCubit>().adicionar(); //*-> Cubit
                  },
                  child: Text("adicionar")),
              ElevatedButton(
                  onPressed: () {
                    // context.read<CounterBloc>().add(CounterSubtractEvent()); //*-> Bloc
                    context.read<CounterCubit>().subtract(); //*-> Cubit
                  },
                  child: Text("subtrair")),
              ElevatedButton(
                  onPressed: () {
                    // context.read<CounterBloc>().add(CounterResetEvent()); //*-> Bloc
                    context.read<CounterCubit>().reset(); //*-> Cubit
                  },
                  child: Text("reiniciar")),
              ElevatedButton(
                  onPressed: () {
                    //  context.read<CounterBloc>().add(CounterMultiplyEvent(valor: 2)); //*-> Bloc
                     context.read<CounterCubit>().multiply(2); //*-> Cubit
                  }, child: Text("multiplicar por 2")),
            ],
          ),
        ]),
      ),
    );
  }
}
