import 'dart:core';
import 'package:flutter/material.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  static final String id = 'feed_page';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story('images/user_1.jpeg', 'Jazmin'),
    Story('images/user_3.jpeg', 'Sylvester'),
    Story('images/user_2.jpeg', 'Lavina'),
    Story('images/user_1.jpeg', 'Jazmin'),
    Story('images/user_2.jpeg', 'Sylvester'),
    Story('images/user_2.jpeg', 'Lavina'),
  ];

  List<Post> _posts = [
    Post(
        userImage: 'images/user_1.jpeg',
        username: "Brianne",
        postImage: "images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur"),
    Post(
        userImage: 'images/user_2.jpeg',
        username: "Henri",
        postImage: "images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur"),
    Post(
        userImage: 'images/user_3.jpeg',
        username: "Mariano",
        postImage: "images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // #stories watch all
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stories',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Watch All',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map<Widget>((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),
              // #postList
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (context, i){
                    return _itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // #header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.username),

                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage('images/placeholder.png'),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.mode_comment_outlined),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined),),
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark),),
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),
                ]
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),

                  TextSpan(
                    text: "${post.caption}",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ]
              ),
            ),
          ),
          // #postdate
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text('February 2020',  textAlign: TextAlign.start, style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            )
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
               child: Image(
                 image: AssetImage(story.image),
                 width: 70,
                 height: 70,
                 fit: BoxFit.cover,
               ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name),
      ],
    );
  }
}
