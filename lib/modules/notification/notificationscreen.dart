import 'package:facebook/styles/icons_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(top: 24.0, right: 10, bottom: 20, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(IconBroken.Search)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(IconBroken.Message)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Earlier',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    itemBuilderNotifications(context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: 10),
          ],
        ),
      ),
    );
  }

  Widget itemBuilderNotifications(context) => TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  child: Image(
                    image: NetworkImage(
                      'https://scontent.faly1-2.fna.fbcdn.net/v/t1.18169-9/988686_559028890799759_2047974038_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeG6q3y0SkPxwiklCdispi75q0KiY6n-7z2rQqJjqf7vPZSiHA7Xmlc3EbfJf_XJx7SLPeTAN6QkId324S2FfXW8&_nc_ohc=AfQzkMhPHzkAX_AYM3w&_nc_ht=scontent.faly1-2.fna&oh=ab9161667bc3ae9c1685751fd2fbc4c6&oe=6189A37C',
                    ),
                    fit: BoxFit.cover,
                  ),
                  radius: 35,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.apkmirror.com/wp-content/uploads/2020/05/5ec02a1b16536-384x384.png'),
                  radius: 15,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MBC3 posted 3 new videos, including "لعبة تعتمد على قوة الذاكرة".',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  Text(
                    'Yesterday at 21:45',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  color: Colors.black,
                  icon: const Icon(Icons.more_horiz_outlined)),
            ),
          ],
        ),
      );
}
