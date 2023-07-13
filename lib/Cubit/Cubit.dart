import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Cubit/States.dart';
import 'package:social_app/Model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/Module/chats.dart';
import 'package:social_app/Module/feeds.dart';
import 'package:social_app/Module/newPostScreen.dart';
import 'package:social_app/Module/settings.dart';
import 'package:social_app/Module/users.dart';
import 'package:social_app/Network/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
class socialCubit extends Cubit<socialStates>{
  socialCubit() :super(socialInitial());
  static socialCubit get(context)=>BlocProvider.of(context);

userModel ?model=userModel();
void getUserData(){
  emit(socialGetUserLoading());
  FirebaseFirestore.instance.
  collection('users').
  doc(uId).
  get().
  then((value) {
    model=userModel.fromjson(value.data());
   emit(socialGetUserSuccess());
  }).catchError((erorr){
    emit(socialGetUserErorr(erorr.toString()));
  });
}

var currentindex=0;
  List<String>titles=[
    'Home',
    'chats',
    'Posts',
    'users',
    'settings',
  ];

List<Widget>screens=[
  feedsScreen(),
  chatsScreen(),
  newPostScreen(),
  usersScreen(),
  settingsScreen(),
];
void changeBottom(int index)
{
  if(index==2)
    emit(socialNewPost());
  else
    {
      currentindex=index;
      emit(changeBottomNva());

    }
}

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(socialPickedImageSuccess());
    } else {
      print('No image selected');
      emit(socialPickedImageErorr());
    }
  }


  File? CoverImage;

  Future<void> getcoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      CoverImage = File(pickedFile.path) ;
      print(pickedFile.path);
      emit(socialPickedCoverSuccess());
    } else {
      print('No image selected.');
      emit(socialPickedCoverErorr());
    }
  }

  String ProfileImageUrl='';
 void upLoadProfileImage(){
    FirebaseStorage.instance.ref().child('users/${Uri.file(profileImage!.path).pathSegments.last}').putFile(profileImage!).then((value){

      value.ref.getDownloadURL().then((value) {
        print(value);
        ProfileImageUrl=value;
        emit(socialUpLoadProfileImageSuccess());
      }).catchError((error){});
      emit(socialUpLoadProfileImageErorr());
    }).catchError((error){
      emit(socialUpLoadProfileImageErorr());
    });
  }

  String coverImageUrl='';
  void upLoadCoverImage(){
    FirebaseStorage.instance.ref()
        .child('users/${Uri.file(CoverImage!.path).pathSegments.last}')
        .putFile(CoverImage!)
        .then((value){
      value.ref.getDownloadURL()
          .then((value) {
        print(value);
        coverImageUrl=value;
        emit(socialUpLoadCoverImageSuccess());
      }).catchError((error){});
      emit(socialUpLoadCoverImageErorr());
    }).catchError((error){
     emit(socialUpLoadCoverImageErorr());

    });
  }

  void updateUserImage ({name,phone,bio,}){
    if(CoverImage !=null ){
      upLoadCoverImage();

    }
    else if(profileImage != null){
      upLoadProfileImage();
    }else if(profileImage != null && CoverImage !=null){
      upLoadProfileImage();
      upLoadCoverImage();
    }
    else{
      updateUser(name: name,bio: bio,phone: phone);
    }

  }
  updateUser ({name,phone,bio,}){
    userModel model=userModel(
        name:name,
        phone:phone,
        uId:uId,
        bio: bio,
        email:userModel().email ,
        image: userModel().image,
        cover:userModel().cover);
    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .update(userModel().toMap())
        .then((value){
      getUserData();
    })
        .catchError((error){
      emit(socialGetUserErorr(error));
    });
  }
}
