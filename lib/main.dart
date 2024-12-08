import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  bool activado = true;
  MainApp({super.key, required this.activado});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Arial",
          colorScheme: const ColorScheme.light(
              surface: Color.fromARGB(246, 246, 248, 218),
              surfaceContainerHighest: Color.fromARGB(235, 242, 242, 235),
              primary: Color.fromARGB(106, 130, 175, 218),
              primaryFixed: Color.fromARGB(149, 10, 100, 142),
              secondary: Color.fromARGB(153, 20, 46, 50),
              tertiary: Color.fromARGB(255, 27, 59, 73),
              onPrimaryFixedVariant: Color.fromARGB(100, 120, 170, 200),
              onPrimary: Color.fromARGB(255, 7, 8, 8),
              onSecondary: Color.fromARGB(255, 195, 203, 203),
              onSurface: Color.fromARGB(255, 7, 8, 8)),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: checkActivado(),
      routes: {
        '/principal': (context) => const Principal(),
        '/calculator': (BuildContext context) => const Calculator(),
        '/new_trip_control': (BuildContext context) => const NewTripControl(),
        '/current_trip_control': (BuildContext context) =>
            const CurrentTripControl(),
        '/update_trip_singleton': (BuildContext context) =>
            const UpdateTripSingleton(),
        '/trip_data': (BuildContext context) => const TripData(),
        '/trip_list': (BuildContext context) => const TripList(),
        '/login': (BuildContext context) => ChangeNotifierProvider(
            create: (context) => JsonProvider(), child: const Login())
      },
    );
  }

  String checkActivado() {
    if (activado) {
      return '/principal';
    } else {
      return '/login';
    }
  }
}
