import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 4,
        title: Text(
          'Edit profile',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 16, color: Colors.black),
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
                  Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'profile picture',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      InkWell(
                        onTap: () {},
                        child: const Text('Edit'),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-1/p240x240/244726719_4389031117886388_616164943763178058_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeGYHDGZE0lMUSkmtHeHzFZqzNcd3PxKVrDM1x3c_EpWsIDLJ_ihkq0dp-2ptdONbAhGgt99c-jxm9diGSOxWOTu&_nc_ohc=HSKSTsz2CvYAX97QLjS&_nc_ht=scontent.faly1-2.fna&oh=e2c9ffd303395d35bc6f9c3282c6ca90&oe=618936E7',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
