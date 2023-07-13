import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/Cubit.dart';
import 'package:social_app/Cubit/States.dart';
import 'package:social_app/Model/userModel.dart';
class feedsScreen extends StatelessWidget {
  const feedsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var userModel = socialCubit.get(context).model;
    return BlocConsumer<socialCubit,socialStates>(
      listener: (context,state){} ,
      builder: (context,state){
     return   SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Column(
        children: [
        Card(
        elevation: 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
        Image(image: NetworkImage('https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1060&t=st=1685106415~exp=1685107015~hmac=ab3c4ba0a99a71229f5d10f55ee9932a563e3b37978cffcfcc66475e1330d3a4'),
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('comunicate with frinds ',style: TextStyle(color: Colors.black),),
        )
        ],
        ),
        ),
        ListView.separated(
        itemBuilder: (context,index)=>postItem(userModel),
        separatorBuilder:(context,index)=>SizedBox(height: 5.0,) ,
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        )
        ],
        ),
        );
      },
    );
  }
  Widget postItem(userModel ?model)=>Card(
    elevation: 50,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1060&t=st=1685106415~exp=1685107015~hmac=ab3c4ba0a99a71229f5d10f55ee9932a563e3b37978cffcfcc66475e1330d3a4'),),
              SizedBox(width: 20,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${model!.name}'),
                          Icon(Icons.check_circle,color: Colors.blue,size: 12,)
                        ],
                      ),
                      Text('May 26, 2023 at 4:00 pm',style: TextStyle(color: Colors.black26,fontSize: 10.5),),
                    ],)),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,size: 16,),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('In this algorithm rather than just shifting the alphabetIt shuffle (jumble) the letters arbitrarily.Each character in the plain text is mapped to its ciphercharacter using any of 26 alphabet character.So, there are  26! Or greater possible keys.This is greater 10 times than key of DES…….. So,brute force attack is eliminated as cryptanalysis method.'),
        ),
        Container(
          width: double.infinity,
          height: 35.0,
          child: Wrap(
            children: [
              MaterialButton(onPressed: (){},
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text('#software',style: TextStyle(color: Colors.blue),)),
              MaterialButton(onPressed: (){},
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text('#software',style: TextStyle(color: Colors.blue),)),
              MaterialButton(onPressed: (){},
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text('#software-development',style: TextStyle(color: Colors.blue),))

            ],
          ),
        ),

        Card(
          elevation: 50,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child:   Image(image: NetworkImage('https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1060&t=st=1685106415~exp=1685107015~hmac=ab3c4ba0a99a71229f5d10f55ee9932a563e3b37978cffcfcc66475e1330d3a4'),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Icon(Icons.heart_broken,size: 16,),
                    SizedBox(width: 10,),
                    Text('120'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Icon(Icons.comment_outlined,size: 16,),
                    SizedBox(width: 10,),
                    Text('48'),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 1.0,
            width: double.infinity,
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.0),
          child: Row(children: [
            InkWell(
              onTap: (){},
              child: Row(children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1060&t=st=1685106415~exp=1685107015~hmac=ab3c4ba0a99a71229f5d10f55ee9932a563e3b37978cffcfcc66475e1330d3a4'),),
                SizedBox(width: 30.0,),
                Text('write a comment ...',style: TextStyle(color: Colors.black12),),
              ],),
            ),

            SizedBox(width: 30.0,),
            InkWell(
              onTap: (){},
              child: Row(
                children: [
                  Icon(Icons.heart_broken_outlined,size: 16,),
                  SizedBox(width: 10,),
                  Text('like'),
                ],
              ),
            ),
            SizedBox(width: 30.0,),
            InkWell(
              onTap: (){},
              child: Row(
                children: [
                  Icon(Icons.share_outlined,size: 16,),
                  SizedBox(width: 10,),
                  Text('share5'),
                ],
              ),
            ),
          ],),
        )

      ],
    ),
  );
}
