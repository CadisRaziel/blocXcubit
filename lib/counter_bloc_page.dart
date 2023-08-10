import 'package:bloc_learning/bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc_event.dart';
import 'package:bloc_learning/bloc/counter_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///buscando o bloc
    final bloc = context.read<CounterBloc>();

    return BlocListener<CounterBloc, CounterBlocState>(
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
          BlocSelector<CounterBloc, CounterBlocState, String>(
              selector: (state) => state.message,
              builder: (context, String message) {
                return Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
          BlocSelector<CounterBloc, CounterBlocState, int>(
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
                    context.read<CounterBloc>().add(CounterAddEvent());
                  },
                  child: Text("adicionar")),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterSubtractEvent());
                  },
                  child: Text("subtrair")),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterResetEvent());
                  },
                  child: Text("reiniciar")),
              ElevatedButton(
                  onPressed: () {
                     context.read<CounterBloc>().add(CounterMultiplyEvent(valor: 2));
                  }, child: Text("multiplicar por 2")),
            ],
          ),
        ]),
      ),
    );
  }
}
