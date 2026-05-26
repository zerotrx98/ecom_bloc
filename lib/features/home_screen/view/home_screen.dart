import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),

        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(LogoutPressed());
            },

            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
