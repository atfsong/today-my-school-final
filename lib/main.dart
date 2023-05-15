import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:today_my_school_final/firebase_options.dart';
import 'package:today_my_school_final/models/model_auth.dart';
import 'package:today_my_school_final/models/model_reservation.dart';
import 'package:today_my_school_final/models/model_user.dart';
import 'package:today_my_school_final/pages/home.dart';
import 'package:today_my_school_final/pages/login.dart';
import 'package:today_my_school_final/pages/password_reset.dart';
import 'package:today_my_school_final/pages/profile_editor.dart';
import 'package:today_my_school_final/pages/reservation_check.dart';
import 'package:today_my_school_final/pages/reservation_form.dart';
import 'package:today_my_school_final/pages/reservation_result.dart';
import 'package:today_my_school_final/pages/room_select.dart';
import 'package:today_my_school_final/pages/signup.dart';
import 'package:today_my_school_final/pages/splash.dart';
import 'package:today_my_school_final/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ReservationModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, child) {
          return MaterialApp(
            title: 'Today My School',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: true,
                titleTextStyle:
                    TextStyleSet.semibold20.copyWith(color: ColorPalette.blue),
                toolbarHeight: 56.h,
              ),
              scaffoldBackgroundColor: ColorPalette.white,
              dividerTheme: DividerThemeData(
                color: ColorPalette.grey,
                space: 16.h,
                thickness: 1,
              ),
              fontFamily: 'Roboto',
              fontFamilyFallback: const ['NotoSansKR'],
            ),
            routes: {
              '/': (context) => const SplashPage(),
              '/login': (context) => const LoginPage(),
              '/signup': (context) => const SignupPage(),
              '/password_reset': (context) => const PasswordResetPage(),
              '/home': (context) => const HomePage(),
              '/profile_editor': (context) => const ProfileEditorPage(),
              '/reservation_check': (context) => const ReservationCheckPage(),
              '/room_select': (context) => const RoomSelectPage(),
              '/reservation_form': (context) => const ReservationForm(),
              '/reservation_result': (context) => const ReservationResultPage(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
