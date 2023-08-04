import 'package:bloc_learning/bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/counter_event.dart';
import 'package:bloc_learning/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///buscando o bloc
    final bloc = context.read<CounterBloc>();

    return BlocListener<CounterBloc, CounterState>(
      ///Toda vez que tiver uma nova saida do CounterState ele vai emitir o que esta aqui dentro
      ///Lemnbre-se ele não vai rebuildar a tela
      ///ou seja toda vez que eu clicar no botão que tenha o selector do CounterState ele vai emitir o que esta aqui dentro
      listener: (context, state) {
        String message = 'Estado inicial';
        if(state is CounterPage) {
          message = "Adicionando um valor";
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
          BlocSelector<CounterBloc, CounterState, String>(
              selector: (state) => state.message,
              builder: (context, String message) {
                return Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
          BlocSelector<CounterBloc, CounterState, int>(
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
              ElevatedButton(onPressed: () {}, child: Text("subtrair")),
              ElevatedButton(onPressed: () {}, child: Text("reiniciar")),
              ElevatedButton(
                  onPressed: () {}, child: Text("multiplicar por 2")),
            ],
          ),
        ]),
      ),
    );
  }
}
