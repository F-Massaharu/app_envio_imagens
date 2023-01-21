import 'package:app_envio_imagens/blocs/images/image_bloc.dart';
import 'package:app_envio_imagens/firebase_options.dart';
import 'package:app_envio_imagens/login/login_check.dart';
import 'package:app_envio_imagens/storage/database_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ImageBloc(
            databaseRepository: DatabaseRepository(),
          )..add(
              LoadImages(),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Firebase App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const CheckLoginPage(),
      ),
    );
  }
}
