import 'package:delala/features/todo/presentation/todo_bloc/todo_bloc.dart';
import 'package:delala/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:brave/config/theme/theme.dart';
import 'config/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (context) => TodoBloc(sl())),
      ],
  
      child: MaterialApp.router(
        // darkTheme: darkTheme,
        // theme: lightTheme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
