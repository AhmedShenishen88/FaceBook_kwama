import 'package:bloc/bloc.dart';
import 'package:facebook/cubit/cubit_face.dart';
import 'package:facebook/cubit/cubit_state.dart';
import 'package:facebook/endpoint/endpoint.dart';
import 'package:facebook/loginall/loginscreen/loginscreen.dart';
import 'package:facebook/modules/home/homeface.dart';
import 'package:facebook/modules/homeface/homface.dart';
import 'package:facebook/network/sharedpre/sharedpref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit_observe.dart';
import 'modules/profilescreen/proflescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();

  Widget widget;

  uId = CashHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomeFace();
  } else {
    widget = LoginScreen();
  }

  runApp(MaterialHome(
    startWidget: widget,
  ));
}

class MaterialHome extends StatelessWidget {
  final Widget startWidget;
  const MaterialHome({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CubitFaceHome()..getAllUser()),
        ],
        child: BlocConsumer<CubitFaceHome, CubitStateFace>(
          listener: (context, index) {},
          builder: (context, index) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeFace(),
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      elevation: 0.0,
                      titleSpacing: 2,
                      titleTextStyle: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.dark)),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.blue[900],
                      unselectedItemColor: Colors.grey,
                      elevation: 0.0,
                      showSelectedLabels: false,
                      backgroundColor: Colors.white,
                      showUnselectedLabels: false,
                      type: BottomNavigationBarType.fixed)),
            );
          },
        ));
  }
}
