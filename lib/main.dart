import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(
            create: (_) => MovieBloc()..add(FetchMovies()),
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),

            // Scaffold(
            //     body: Center(
            //   child:
            //       Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            //     RaisedButton(
            //         child: Text("Sign Up"),
            //         onPressed: () async {
            //           SignInSignUpResult result = await AuthServices.signUp(
            //               "example@email.com",
            //               "123456",
            //               "arfandi",
            //               ["horror", "drama", "romance", "action"],
            //               "english");
            //           if (result.userProfile == null)
            //             print(result.message);
            //           else
            //             result.userProfile.toString();
            //         }),
            //     RaisedButton(
            //         child: Text("Sign In"),
            //         onPressed: () async {
            //           SignInSignUpResult result =
            //               await AuthServices.signIn("example@email.com", "123456");
            //           if (result.userProfile == null)
            //             print(result.message);
            //           else
            //             result.userProfile.toString();
            //         })
            //   ]),
            // )),
          ),
        ),
      ),
    );
  }
}
