import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Components/Components(tools).dart';
import 'package:social_app/Cubit/Cubit.dart';
import 'package:social_app/Cubit/States.dart';
import 'package:social_app/Module/edit%20profile.dart';
class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialCubit,socialStates>(
      listener:(context,state){} ,

      builder:(context,state) {
        var userModel = socialCubit.get(context).model;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(
                              '${userModel!.cover}'
                          ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadiusDirectional.circular(5.0),
                        ),

                      ),
                    ),
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            '${userModel.image}'
                        ),
                    )
                    )
                  ],
                ),
              ),
              Text('${userModel.name}', style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,),
              Text('${userModel.bio}', style: Theme
                  .of(context)
                  .textTheme
                  .overline,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text('100', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                            Text('posts', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text('306', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                            Text('photos', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text('10k', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                            Text('followers', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text('512', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                            Text('followering', style: Theme
                                .of(context)
                                .textTheme
                                .caption,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                   Expanded(
                     child: defultButton(
                          label: 'Edit Profile', onPressed: () {}),
                   ),
                  SizedBox(width: 10,),
                  OutlinedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>editProfile()));
                  }, child:Icon(Icons.edit)),
                ],
              )

            ],
          ),
        );
      }
    );
  }
}
