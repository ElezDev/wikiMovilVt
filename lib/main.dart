import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiki_virtualt/bloc/cubit/type_user_cubit.dart';
import 'package:wiki_virtualt/pages/home/home_page.dart';
import 'package:wiki_virtualt/pages/introduccion/onboarding_screen.dart';
import 'package:wiki_virtualt/pages/introduccion/welcome.dart';
import 'package:wiki_virtualt/pages/login/login_page.dart';
import 'package:wiki_virtualt/pages/login/user_log_controller.dart';
import 'package:wiki_virtualt/pages/register/register_page.dart';
import 'package:wiki_virtualt/pages/stories/create_stories_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;

  final UserController userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext ocontext) {
    return BlocProvider(
      create: (context) => TypeUserCubit(),
      child: GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
        ],
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/register', page: () => const RegisterPage()),
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/intro', page: () => OnboardingScreen()),
          GetPage(name: '/createStory', page: () => const CreateStory()),
          GetPage(name: '/welcome', page: () => Welcome()),
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            errorStyle: TextStyle(
              height: 0,
            ),
            fillColor: Color(0xFFf9f9f9),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00C535),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        navigatorKey: Get.key,
      ),
    );
  }

  String get initialRoute {
    String? token = GetStorage().read('token');
    bool? vemail = GetStorage().read('vemail');

    if (token != null) {
      if (vemail == false) {
        return '/success';
      }
      return '/home';
    } else {
      return '/intro';
    }
  }
}
