import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Components/Components.dart';
import 'package:social_app/Cubit/Cubit.dart';
import 'package:ionicons/ionicons.dart';
import 'package:social_app/Cubit/States.dart';
import 'package:social_app/Module/newPostScreen.dart';
import 'package:social_app/Network/constant.dart';

import '../Components/Components(tools).dart';
import '../Login_Screen/Login-Screen.dart';
import '../Network/Local/Cache_helper.dart';

class home_Layout extends StatelessWidget {
  const home_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=socialCubit.get(context);
    return BlocConsumer<socialCubit,socialStates>(
        listener: (context,state){
          if(State is socialNewPost){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> newPostScreen()));
          }
        },
      builder:(context,state)=> Scaffold(
        appBar: AppBar(
          title: Text(cubit.titles[cubit.currentindex]),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Ionicons.notifications_outline)),
            IconButton(onPressed: (){}, icon: Icon(Ionicons.search)),
            IconButton(onPressed: (){
              CacheHelper.removeData(Key: 'uId').then((value){
                if(value){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                }
              });}, icon: Icon(CupertinoIcons.nosign),),
          ],
        ),
      body:cubit.screens[cubit.currentindex] ,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.black12,
        currentIndex: cubit.currentindex,
        onTap:(index){
        cubit.currentindex=index;
        cubit.changeBottom(index);
      }, items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_fill),label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Ionicons.cloud_upload_outline),label: 'Post'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: 'Users'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: 'Settings'),

      ] ,

      ),

    ) ,
       );
  }
}
