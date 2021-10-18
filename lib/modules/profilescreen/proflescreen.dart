import 'package:facebook/cubit/cubit_face.dart';
import 'package:facebook/cubit/cubit_state.dart';
import 'package:facebook/styles/icons_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitFaceHome(),
      child: BlocConsumer<CubitFaceHome, CubitStateFace>(
          listener: (context, state) {},
          builder: (context, state) {
            var pickerImage = CubitFaceHome.get(context).profileImage;
            var pickerCover = CubitFaceHome.get(context).profileCover;
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 2,
                title: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(IconBroken.Search),
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          )),
                    ),
                    if (pickerCover != null || pickerImage != null)
                      const SizedBox(
                        width: 4,
                      ),
                    if (pickerCover != null || pickerImage != null)
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextButton(
                              onPressed: () {
                                // CubitFaceHome.get(context).updateChanges(image: pickerImage, bio: bio, cover: pickerImage, name: name)
                              },
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold),
                              ))),
                    if (pickerCover != null || pickerImage != null)
                      const SizedBox(
                        width: 4,
                      ),
                    if (pickerCover != null || pickerImage != null)
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300]),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold),
                              )))
                  ],
                ),
              ),
              body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.3,
                        color: Colors.grey[500],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 230,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Align(
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          height: 160,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: pickerCover == null
                                                  ? const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/59157504_2203489946440527_65945782561275904_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeGqldzKddQfObuMNv0AFNCAKZ5BFMYy8QEpnkEUxjLxAcJ_WHD9f-kfUs2KqkTWJqp-stpAnkIMIgEub_rvdfE4&_nc_ohc=egCiFMbpGFMAX8_rVhy&_nc_ht=scontent.faly1-2.fna&oh=2520ee6930b0c08f96703c435af77a0c&oe=618C124C',
                                                      ))
                                                  : DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                          pickerCover))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            child: IconButton(
                                              onPressed: () {
                                                CubitFaceHome.get(context)
                                                    .getProfileCover();
                                              },
                                              icon: const Icon(
                                                IconBroken.Camera,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    alignment: AlignmentDirectional.topStart,
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 75,
                                          child: pickerImage == null
                                              ? const CircleAvatar(
                                                  radius: 70,
                                                  backgroundImage: NetworkImage(
                                                      'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-1/p240x240/244726719_4389031117886388_616164943763178058_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeGYHDGZE0lMUSkmtHeHzFZqzNcd3PxKVrDM1x3c_EpWsIDLJ_ihkq0dp-2ptdONbAhGgt99c-jxm9diGSOxWOTu&_nc_ohc=HSKSTsz2CvYAX97QLjS&_nc_ht=scontent.faly1-2.fna&oh=e2c9ffd303395d35bc6f9c3282c6ca90&oe=618936E7'))
                                              : CircleAvatar(
                                                  radius: 70,
                                                  backgroundImage:
                                                      FileImage(pickerImage))),
                                      CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: IconButton(
                                          onPressed: () {
                                            CubitFaceHome.get(context)
                                                .getProfileImage();
                                          },
                                          icon: const Icon(
                                            IconBroken.Camera,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Ahmed Shenishen',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Add to Story',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(7)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(7)),
                                  child: TextButton(
                                      onPressed: () {
                                        print('more');
                                      },
                                      child: const Icon(
                                        Icons.more_horiz_outlined,
                                        color: Colors.black,
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
