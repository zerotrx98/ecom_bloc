import 'package:ecom_b/features/home_screen/view/home_screen.dart';
import 'package:ecom_b/features/login_screen/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("LoginScreen")),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is LoginSuccess) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Column(
                  children: [
                    const SizedBox(height: 70),

                    /// Logo
                    Container(
                      height: 100,
                      width: 100,

                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(25)),

                      child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 50),
                    ),

                    const SizedBox(height: 25),

                    const Text("Welcome Back 👋", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Text("Login to continue shopping", style: TextStyle(color: Colors.grey[600])),

                    const SizedBox(height: 40),

                    TextField(
                      controller: usernameController,

                      decoration: InputDecoration(
                        hintText: "Email",

                        prefixIcon: const Icon(Icons.email_outlined),

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: passwordController,

                      obscureText: true,

                      decoration: InputDecoration(
                        hintText: "Password",

                        prefixIcon: const Icon(Icons.lock_outline),

                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),

                        onPressed: () {
                          context.read<LoginBloc>().add(LoginButtonPressed(usernameController.text.trim(), passwordController.text.trim()));
                        },

                        child: state is LoginLoading
                            ? const SizedBox(height: 25, width: 25, child: CircularProgressIndicator(color: Colors.white))
                            : const Text("Login", style: TextStyle(fontSize: 18)),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(onPressed: () {}, child: const Text("Create account")),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
