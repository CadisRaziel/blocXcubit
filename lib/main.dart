import 'package:bloc_learning/bloc/counter_bloc.dart';
import 'package:bloc_learning/counter_bloc_page.dart';
import 'package:bloc_learning/counter_cubit_page_.dart';
import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //!Bloc
      // home: BlocProvider(
      //   create: (context) => CounterBloc(), //-> os blocs vem antes das paginas
      //   child: const CounterBlocPage()),

      //!Cubit
      home: BlocProvider(
        create: (context) => CounterCubit(), //-> os cubit vem antes das paginas
        child: const CounterCubitPage()),
    );
  }
}

