import 'package:codarkatvpn/app_preferences.dart';
import 'package:codarkatvpn/custom_widget.dart';
import 'package:codarkatvpn/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restart_app/restart_app.dart';
import 'package:video_player/video_player.dart';

import 'constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(AppPreferences.isDarkMode
        ? 'assets/video/earth-dark.mp4'
        : 'assets/video/earth-white.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Codarkat VPN',
            style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outline),
        ),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            onPressed: () {
              Get.changeThemeMode(
                AppPreferences.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
              AppPreferences.isDarkMode = !AppPreferences.isDarkMode;
              // Restart.restartApp();
            },
            icon: Icon(AppPreferences.isDarkMode
                ? LineAwesomeIcons.sun
                : LineAwesomeIcons.moon),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 100,
                //   height: 100,
                //   child: Image.asset(
                //     'assets/logo/logo-6750a4.png',
                //   ),
                // ),

                Lottie.asset(
                  'assets/json/earth-3.json',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                  frameRate: FrameRate.max,
                ),


                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CustomWidget(
                //       titleText: "Location",
                //       subtitleText: "FREE",
                //       roundWidgetWithIcon: CircleAvatar(
                //         radius: 32,
                //         backgroundColor: Colors.blueAccent,
                //         child: Icon(
                //           Icons.flag_circle,
                //           color: Colors.white,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //     CustomWidget(
                //       titleText: "60 ms",
                //       subtitleText: "PING",
                //       roundWidgetWithIcon: CircleAvatar(
                //         radius: 32,
                //         backgroundColor: Colors.blueAccent,
                //         child: Icon(
                //           Icons.graphic_eq,
                //           color: Colors.white,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                //
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CustomWidget(
                //       titleText: "0 Kbps",
                //       subtitleText: "DOWNLOAD",
                //       roundWidgetWithIcon: CircleAvatar(
                //         radius: 32,
                //         backgroundColor: Colors.blueAccent,
                //         child: Icon(
                //           Icons.arrow_circle_down,
                //           color: Colors.white,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //     CustomWidget(
                //       titleText: "0 Kbps",
                //       subtitleText: "UPLOAD",
                //       roundWidgetWithIcon: CircleAvatar(
                //         radius: 32,
                //         backgroundColor: Colors.blueAccent,
                //         child: Icon(
                //           Icons.arrow_circle_up,
                //           color: Colors.white,
                //           size: 30,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                //
                // Column(
                //   children: [
                //     Semantics(
                //       button: true,
                //       child: InkWell(
                //         onTap: () {},
                //         borderRadius: BorderRadius.circular(100),
                //         child: Container(
                //           padding: EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             //color: Colors.blueAccent,
                //           ),
                //           child: Container(
                //             padding: EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               //color: Colors.blueAccent,
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),

                // SizedBox(
                //   width: 320,
                //   height: 180,
                //   child: VideoPlayer(_controller),
                // ),

                Transform.scale(
                  scale: 2,
                  child: Switch(
                      thumbIcon: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Icon(Octicons.shield_check,
                                color: Theme.of(context).colorScheme.primary);
                          }
                          return const Icon(Octicons.shield_x);
                        },
                      ),
                      value: true,
                      onChanged: (value) {}),
                ),
                Text(
                  'Your IP: 192.168.1.1',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: cAppNameColor),
                ),
                Card(
                    color: Theme.of(context).colorScheme.background,
                    // color: cPrimaryColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.flag_circle,
                              color: Colors.blue,
                              size: 36,
                            ),
                            // const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Select Country / Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontSize: 20),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // const Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.blue.withOpacity(0.1),
                              child: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.blue,
                                size: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
