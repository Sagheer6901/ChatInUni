
import 'package:chatinunii/screens/chats/chats_screen.dart';
import 'package:chatinunii/screens/settings/setlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../authScreens/login.dart';
import '../../constants.dart';
import '../SiginInOrSignUp/signin_or_signup_screen.dart';
import 'components/body.dart';
import 'components/chatInput_field.dart';

class MessagesScreen extends StatefulWidget {
  final username;
  var data;
  int index;
  MessagesScreen(
      {Key? key,
        required this.username,
        required this.data,
        required this.index})
      : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

bool transFlag = false;

class _MessagesScreenState extends State<MessagesScreen> {
  IO.Socket socket = IO.io('https://test-api.chatinuni.com', <String, dynamic>{
    "transports": ["websocket"]
  });
  var msgList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(socket.connected);
    socket.on('CreateChat', (data) {
      setState(() {
        msgList = data;
      });
      print(msgList);
      print('done');
    });
  }

  bool _flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ChatsScreen()),
                  (route) => false);
          return Future.value(false);
        },
        child: Column(
          children: [
            Body(
              username: widget.username,
              data: widget.data,
              index: widget.index,
              transFlag: transFlag,
            ),
            ChatInputField(
              username: widget.username,
              chatId: widget.data['ChatId'],
            ),
          ],
        ),
      ),
    );
  }

  String trans = 'Translate Chat';

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()),
                      (route) => false);
            },
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.data['ProfilePhotos'] == null
                ? ''
                : widget.data['ProfilePhotos'][0]['FileURL']),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.35,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: InkWell(
                child: Text("Set Language"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SetLanguage()));
                },
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          width: kDefaultPadding * 0.15,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: InkWell(
                child: Text(trans),
                onTap: () {
                  setState(() {
                    if (trans == 'show_orginal'.tr) {
                      trans = 'translate_chat'.tr;
                      setState(() {
                        transFlag = false;
                      });
                    } else {
                      trans = 'show_orginal'.tr;
                      setState(() {
                        transFlag = true;
                      });
                    }
                  });
                },
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          width: kDefaultPadding * 0.15,
        ),
        // IconButton(onPressed: () {}, icon: Icon(Icons.square_outlined)),
      ],
    );
  }
}
