// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../core/storage.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.launched();
                  GoRouter.of(context).replace("/home");
                },
                child: Text("Skip")),
          ),
        ],
      ),
      body: SafeArea(
        child: PreloadPageView(
          preloadPagesCount: 3,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children: const [
            BoardingPage(
              image: "assets/images/boarding/banner1.jpg",
              title: "ilk Tanitim",
            ),
            BoardingPage(
              image: "assets/images/boarding/banner2.jpg",
              title: "ikinci Tanitim",
            ),
            BoardingPage(
              image: "assets/images/boarding/banner3.jpg",
              title: "ucuncu Tanitim",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.circle_fill,
                size: 16,
                color: page == 0 ? Colors.blue : Colors.grey,
              ),
              Icon(
                CupertinoIcons.circle_fill,
                size: 16,
                color: page == 1 ? Colors.blue : Colors.grey,
              ),
              Icon(
                CupertinoIcons.circle_fill,
                size: 16,
                color: page == 2 ? Colors.blue : Colors.grey,
              ),
            ],
          )),
    );
  }
}

class BoardingPage extends StatelessWidget {
  final String image;
  final String title;

  const BoardingPage({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(child: Image.asset(image)),
          Text(title),
        ],
      ),
    );
  }
}
