import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/colors.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import '../Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final textController = TextEditingController();
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          showEmoji = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              const SizedBox(width: 2),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  widget.chatModel.isGroup! ? Icons.groups : Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name!,
                style: const TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Last seen today at 10:12',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          PopupMenuButton(onSelected: (value) {
            if (kDebugMode) {
              print(value);
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'View Contact',
                child: Text('View Contact'),
              ),
              const PopupMenuItem(
                value: 'Media, links, and docs',
                child: Text('Media, links, and docs'),
              ),
              const PopupMenuItem(
                value: 'Whatsapp web',
                child: Text('Whatsapp web'),
              ),
              const PopupMenuItem(
                value: 'Started message',
                child: Text('Started message'),
              ),
              const PopupMenuItem(
                value: 'Mute Notification',
                child: Text('Mute Notification'),
              ),
              const PopupMenuItem(
                value: 'Wallpaper',
                child: Text('Wallpaper'),
              ),
            ];
          }),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: const EdgeInsets.only(
                              left: 2,
                              right: 2,
                              bottom: 9,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: textController,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      showEmoji = !showEmoji;
                                    });
                                  },
                                  icon: Icon(
                                    showEmoji ? Icons.keyboard_double_arrow_down : Icons.emoji_emotions,
                                    color: secondary,
                                  ),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.attach_file,
                                        color: secondary,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        color: secondary,
                                      ),
                                    ),
                                  ],
                                ),
                                hintText: 'Type a message',
                                contentPadding: const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        // EmojiPicker(
                        //   onEmojiSelected: (category, emoji) {
                        //
                        //   },
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            right: 5,
                            bottom: 9,
                          ),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: primary,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  showEmoji?  emojiSelect() : Container(),
                  ],
                ),
              ),
            ],
          ),
          onWillPop: (){
            if(showEmoji){
              setState(() {
                showEmoji = false;
              });
            }else{
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    'Document',
                  ),
                  const SizedBox(width: 35),
                  iconCreation(
                    Icons.camera_alt,
                    Colors.pink,
                    'Camera',
                  ),
                  const SizedBox(width: 35),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.purple,
                    'Gallery',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headset,
                    Colors.orange,
                    'Audio',
                  ),
                  const SizedBox(width: 35),
                  iconCreation(
                    Icons.location_pin,
                    Colors.teal,
                    'Location',
                  ),
                  const SizedBox(width: 35),
                  iconCreation(
                    Icons.person,
                    Colors.blue,
                    'Contact',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
  Widget emojiSelect() {
    return EmojiPicker(
      textEditingController: textController,
    );
  }
}