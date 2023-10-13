import 'package:codarkatvpn/app_preferences.dart';
import 'package:codarkatvpn/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            },
            icon: Icon(AppPreferences.isDarkMode
                ? LineAwesomeIcons.sun
                : LineAwesomeIcons.moon),
          )
        ],
      ),
      body: Center(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/json/earth_and_connections.json'),
              Lottie.asset('assets/json/green_button.json'),
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
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
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
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20),
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

    );
  }
}
