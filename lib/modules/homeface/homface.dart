import 'package:facebook/styles/icons_broken.dart';
import 'package:flutter/material.dart';

class HomeFaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(child: Text('Facebook')),
            CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.Search,
                      color: Colors.black,
                    ))),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.Message,
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 6.0, top: 8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/71269400_2464730846983101_8492248455660437504_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=boC060C6GfMAX-ZcrcU&_nc_ht=scontent.faly1-2.fna&oh=23f4d3c1d24d091d95f43a1424c41626&oe=61763BCE'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black87),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's on your mind?",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.live_tv,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Live',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Text(
                  '|',
                  style: Theme.of(context).textTheme.caption,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        IconBroken.Image,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Photo',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Text(
                  '|',
                  style: Theme.of(context).textTheme.caption,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.video_call,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Room',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 7,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
            child: Text(
              'Audio and video rooms',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            height: 40,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Create Room',
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => listActivity(),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: 10)
                ],
              ),
            ),
          ),
          Container(
            height: 7,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          Container(
            height: 170,
            width: double.infinity,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => listStory(context),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 0.1,
                    ),
                itemCount: 10),
          ),
          Container(
            height: 7,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => listPosts(context),
              separatorBuilder: (context, index) => Container(
                    height: 10,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.3),
                  ),
              itemCount: 10),
          const SizedBox(
            height: 8,
          ),
        ]),
      ),
    );
  }

  Widget listActivity() => InkWell(
        onTap: () {},
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 19,
              backgroundImage: NetworkImage(
                  'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/71269400_2464730846983101_8492248455660437504_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=boC060C6GfMAX-ZcrcU&_nc_ht=scontent.faly1-2.fna&oh=23f4d3c1d24d091d95f43a1424c41626&oe=61763BCE'),
            ),
            CircleAvatar(
              radius: 6,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
      );
  Widget listStory(context) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                      height: 160,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/71269400_2464730846983101_8492248455660437504_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=boC060C6GfMAX-ZcrcU&_nc_ht=scontent.faly1-2.fna&oh=23f4d3c1d24d091d95f43a1424c41626&oe=61763BCE'),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, bottom: 6.0),
                    child: Text(
                      'Ahmed Khaled',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white, fontSize: 8),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/71269400_2464730846983101_8492248455660437504_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=boC060C6GfMAX-ZcrcU&_nc_ht=scontent.faly1-2.fna&oh=23f4d3c1d24d091d95f43a1424c41626&oe=61763BCE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  Widget listPosts(context) => Container(
        padding: const EdgeInsets.only(left: 8, top: 9, right: 6),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/71269400_2464730846983101_8492248455660437504_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=boC060C6GfMAX-ZcrcU&_nc_ht=scontent.faly1-2.fna&oh=23f4d3c1d24d091d95f43a1424c41626&oe=61763BCE'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Ahmed Khaled',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '15 m .',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: 12,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(IconBroken.Delete)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Grammarly’s plagiarism checker can detect plagiarism from billions of web pages as well as from ProQuest’s academic databases. Our free plagiarism check will tell you whether or not your text contains duplicate content. Our Premium plagiarism check highlights passages that require citations and gives you the resources you need to properly credit your sources.',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black,
                        height: 1.1,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.freepik.com/free-vector/sport-doodle-set_160308-225.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            '1',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            IconBroken.Heart,
                            color: Colors.red,
                            size: 15,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            IconBroken.Chat,
                            color: Colors.red,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'comment',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 3, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Heart,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Like',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.messenger_outline,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Comment',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.share,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Share',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
