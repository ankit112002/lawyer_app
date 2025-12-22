import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:lawyer/provider/car_lease.dart';
import 'package:lawyer/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{

  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: "https://muydrrwcmwshsenxhprg.supabase.co", anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im11eWRycndjbXdzaHNlbnhocHJnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM3MTY5NzIsImV4cCI6MjA3OTI5Mjk3Mn0.e0PF7ggH-M32xy0MjJ7HfTRcoPTISXibpwhvuLPVr_4");

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>ApiProvider()),
      ChangeNotifierProvider(create: (_)=>CarLeasePdfProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     designSize: Size(390, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:SplashScreen()
      ),
    );
  }
}
