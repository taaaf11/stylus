// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stylus/components/social_card.dart';

import 'package:catppuccin_flutter/catppuccin_flutter.dart';

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
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: flavor.text,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
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
    return Scaffold(
      backgroundColor: flavor.surface0,
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleLarge),
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
                    ],
                  ),
                  SizedBox(height: 30),
                  GridView.count(
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 50,
                    childAspectRatio: 280 / 210,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      SocialCard(
                        textIcon: '󰙯',
                        textIconStyle:
                            TextStyle(color: flavor.base, fontSize: 50),
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
                            TextStyle(color: flavor.base, fontSize: 50),
                        bgcolor: flavor.peach,
                        title: Text('Instagram'),
                        subtitle: Text('@po.cco._'),
                        url: 'https://instagram.com/po.cco._',
                      ),
                      SocialCard(
                        textIcon: '󰅴',
                        textIconStyle:
                            TextStyle(color: flavor.base, fontSize: 50),
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