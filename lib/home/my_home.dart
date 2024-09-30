import 'package:api/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => HomeCubit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state is DogState
                    ? Image.network(state.data.message.toString())
                    : CircularProgressIndicator(),
                ElevatedButton(
                    onPressed: () {
                      cubit.fetchImage();
                    },
                    child: Text("image"))
              ]);
        },
      ),
    ));
  }
}
