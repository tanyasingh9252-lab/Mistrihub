import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/job_controller.dart';
import 'controllers/payment_controller.dart';
import 'views/auth/login_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
      runApp(const MistriHubApp());
      }

      class MistriHubApp extends StatelessWidget {
        const MistriHubApp({super.key});

          @override
            Widget build(BuildContext context) {
                return MultiProvider(
                      providers: [
                              ChangeNotifierProvider(create: (_) => AuthController()),
                                      ChangeNotifierProvider(create: (_) => JobController()),
                                              ChangeNotifierProvider(create: (_) => PaymentController()),
                                                    ],
                                                          child: MaterialApp(
                                                                  title: 'MistriHub',
                                                                          theme: AppTheme.lightTheme,
                                                                                  darkTheme: AppTheme.darkTheme,
                                                                                          themeMode: ThemeMode.system,
                                                                                                  home: const LoginScreen(),
                                                                                                          debugShowCheckedModeBanner: false,
                                                                                                                ),
                                                                                                                    );
                                                                                                                      }
                                                                                                                      }import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/job_controller.dart';
import 'controllers/payment_controller.dart';
import 'views/auth/login_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MistriHubApp());
}

class MistriHubApp extends StatelessWidget {
  const MistriHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => JobController()),
        ChangeNotifierProvider(create: (_) => PaymentController()),
      ],
      child: MaterialApp(
        title: 'MistriHub',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode