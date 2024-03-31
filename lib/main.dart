// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stylus/components/social_card.dart';

import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:stylus/utils.dart';

Flavor flavor = catppuccin.mocha;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'me!!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: flavor.surface0,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: flavor.text,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: flavor.text,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: flavor.subtext1,
          ),
        ),
        fontFamily: 'Comfortaa',
      ),
      home: const MyHomePage(title: 'Muhammad Altaaf'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Widget> about = [
      Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: flavor.text, width: 3),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/109919009?s=120&v=4'),
        ),
      )
    ];

    return Scaffold(
      backgroundColor: flavor.surface0,
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: screenWidth - 200),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    direction:
                        getAxis(MediaQuery.of(context).size.width - 200), // row
                    children: (getAxis(screenWidth - 200) == Axis.horizontal)
                        ? about
                        : about.reversed.toList(),
                  ),
                  SizedBox(height: 30),
                  GridView.count(
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 50,
                    childAspectRatio: 280 / 180,
                    // crossAxisCount: 1,
                    crossAxisCount:
                        getCrossAxisCount(MediaQuery.of(context).size.width),
                    shrinkWrap: true,
                    children: [
                      SocialCard(
                        textIcon: '󰙯',
                        textIconStyle:
                            TextStyle(color: flavor.base, fontSize: 30),
                        title: Text(
                          'Discord',
                        ),
                        subtitle: Text('@taafu'),
                        url: 'https://discord.com',
                        bgcolor: flavor.mauve,
                      ),
                      SocialCard(
                        textIcon: '',
                        textIconStyle:
                            TextStyle(color: flavor.base, fontSize: 30),
                        bgcolor: flavor.peach,
                        title: Text('Instagram'),
                        subtitle: Text('@po.cco._'),
                        url: 'https://instagram.com/po.cco._',
                      ),
                      SocialCard(
                        textIcon: '󰅴',
                        textIconStyle:
                            TextStyle(color: flavor.base, fontSize: 30),
                        bgcolor: flavor.lavender,
                        title: Text('Code Space'),
                        subtitle: Text('@taaaf11'),
                        url: 'https://github.com/taaaf11',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Made with ', style: TextStyle(fontSize: 14)),
            Text(
              '󰣐',
              style: TextStyle(
                  color: flavor.pink, fontFamily: 'Symbols-NF', fontSize: 14),
            ),
            Text(' and stuff', style: TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }
}
