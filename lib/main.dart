import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/Cubit.dart';
import 'package:social_app/Login_Screen/Login-Screen.dart';
import 'package:social_app/Network/Local/Cache_helper.dart';
import 'package:social_app/Network/constant.dart';
import 'package:social_app/Register_Screen/Register-Screen.dart';
import 'package:social_app/Style/style.dart';
import 'package:social_app/home_Layout/home_Layout.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //معناه يشغل كل الفانكشن ال async بعدين يشغل الابليكشن

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
// var uId =CacheHelper.GetData(Key: 'uId');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     uId =CacheHelper.GetData(Key: 'uId');

    return MultiBlocProvider(
         providers: [
         BlocProvider(create: (context)=>socialCubit()..getUserData()..getProfileImage()..getcoverImage()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light ,
darkTheme: darkTheme,
      home: uId !=null ? home_Layout():LoginScreen(),
    ));
  }
}

