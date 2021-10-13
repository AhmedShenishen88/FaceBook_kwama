import 'package:facebook/cubit/cubit_face.dart';
import 'package:facebook/cubit/cubit_state.dart';
import 'package:facebook/styles/icons_broken.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitFaceHome(),
        child: BlocConsumer<CubitFaceHome, CubitStateFace>(
          listener: (context, index) {},
          builder: (context, state) {
            return Scaffold(
              body: CubitFaceHome.get(context)
                  .screens[CubitFaceHome.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: CubitFaceHome.get(context).currentIndex,
                onTap: (index) {
                  CubitFaceHome.get(context).changeScreenNav(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.group), label: 'Groups'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        IconBroken.Video,
                      ),
                      label: 'Video'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_business_outlined),
                      label: 'MarketPlace'),
                  BottomNavigationBarItem(
                      icon: Icon(IconBroken.Notification),
                      label: 'Notification'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Menu'),
                ],
              ),
            );
          },
        ));
  }
}
