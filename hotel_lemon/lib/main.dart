import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_lemon/routes/routes_helper.dart';
import 'package:hotel_lemon/screen/screen_barrel.dart';
import 'bloc/cartbloc/cart_bloc.dart';
import 'bloc/cartbloc/cart_event.dart';

void main() {
  runApp(MyApp());
  RenderErrorBox.backgroundColor = Colors.green.shade200;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green.shade300,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Lemon',
        theme: ThemeData.light(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
