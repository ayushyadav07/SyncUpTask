import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SyncUp Development',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => con(),
        '/chat': (con) => chat(),
        '/profile': (con) => ps(),
      },
    );
  }
}

class con extends StatefulWidget {
  @override
  _conState createState() => _conState();
}

class _conState extends State<con> {
  List<bool> ls = List.filled(7, false);
  List<bool> bs = List.filled(7, false);

  List<String> profileNames = [
    'username1',
    'username2',
    'username3',
    'username4',
    'username5',
    'username6',
    'username7',
  ];

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.live_tv),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Navigator.pushNamed(con, '/chat');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          List<String> imageUrls = [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBZRzTKK-EHfAy-6YKNs0ggsvY_io3CfT7QC-P4az-hI5vUpGC',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFWI73wrE-fWmGWfw4InXCD3TAyLYBYCd97t-RCMPD_z0yf5yp',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQQwgfWL1PcYDRbCnZivZqcQ2rMjkpTIWm7dFcBE-ILEini2wC2',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmn7LsTUOyDqUD4i3xFSk5JW5rqhBkYwAKwdoe4xbPRqQ80ed1',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSERiM8xvOx_mPLjl7RhZevemuR9MAV0zLxvJecRkkOAk4Ndl9',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAQANFE0jokbbX-kfwGhrRRrReqP28AAspKXFnC7E2tTuVnJzA',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSeICY8jNEC8JFvekFzcC4SB1684MvoINp7b82pH5MXN8dc2ksK ',
          ];

          List<String> captions = [
            'Gareth Bale\'s stunning overhead kick secured a 3-1 victory against Liverpool!',
            'Messi celebrates fourth goal in Champions League quarterfinal for Barcelona!',
            'Anthony Gordon\'s second-half goal halts Gunners\' unbeaten Premier League start!',
            'Gareth Bale confirmed he is leaving Real Madrid on Wednesday!',
            'Real Madrid 2 - 3 Barça (2017) Messi grabs dramatic late win in #ElClásico!!',
            'UEFA Champions League officially kicked off from 19 September 2023!',
            'Tottenham\'s Harry Kane Sets Record for Most Goals for Single Team in EPL History!',
          ];

          String imageUrl = imageUrls[index % imageUrls.length];
          String caption = captions[index % captions.length];
          String profileName = profileNames[index % profileNames.length];

          return PostItem(
            imageUrl: imageUrl,
            caption: caption,
            isLiked: ls[index],
            isBookmarked: bs[index],
            onLiked: () {
              setState(() {
                ls[index] = !ls[index];
              });
            },
            onBookmarked: () {
              setState(() {
                bs[index] = !bs[index];
              });
            },
            profileName: profileName,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback onLiked;
  final VoidCallback onBookmarked;
  final String profileName;

  PostItem({
    required this.imageUrl,
    required this.caption,
    required this.isLiked,
    required this.isBookmarked,
    required this.onLiked,
    required this.onBookmarked,
    required this.profileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHE4vcD6O1-GAxEU2CDLEQlD140pQI94q5qA&usqp=CAU',
                ),
              ),
              SizedBox(width: 8),
              Text(
                profileName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 300,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                color: isLiked ? Colors.red : null,
                onPressed: onLiked,
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
                onPressed: onBookmarked,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            caption,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageItem(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      sendMessage(_messageController.text);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String message) {
    setState(() {
      _messages.add(message);
      _messages.add('Thanks for your message!');
    });
  }
}

class MessageItem extends StatelessWidget {
  final String message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}

class ps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Username'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHE4vcD6O1-GAxEU2CDLEQlD140pQI94q5qA&usqp=CAU'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ayussssshhhhhhh',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                              },
                              child: Text('Edit Profile'),
                            ),
                            SizedBox(width: 10),
                            OutlinedButton(
                              onPressed: () {
                              },
                              child: Text('View Archive'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' posts'),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '391',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' followers'),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '441',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' following'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ayush Yadav\n'
                      'IITK\'25\n'
                      'Cricket❤️ || Chess❤️\n'
                      'The comeback is always stronger than the setback.🔥🔥\n',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
