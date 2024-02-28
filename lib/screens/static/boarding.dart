import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: SafeArea(
        child: PreloadPageView(
          preloadPagesCount: 3,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children: const [
            BoardingItem(
              image:
                  "https://img.freepik.com/free-vector/ecommerce-web-page-concept-illustration_114360-8204.jpg",
              title: "E-Commerce",
              description:
                  "Our e-commerce system lets you to buy anything anytime.",
            ),
            BoardingItem(
              image:
                  "https://img.freepik.com/free-vector/ecommerce-internet-shopping-promotion-campaign_335657-2977.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699747200&semt=ais",
              title: "Used Products",
              description:
                  "You can find used products for cheap prices in our application.",
            ),
            BoardingItem(
              image:
                  "https://cdn.pixabay.com/photo/2023/09/18/22/07/ai-generated-8261525_640.png",
              title: "Sell Your Stuff",
              description: "Sell your stuff in just minutes.",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(page == 0
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 1
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 2
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                ],
              ),
              InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.firstLauched();
                  GoRouter.of(context).replace("/home");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(page == 2 ? "Finish" : "Skip"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const BoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(image),
            Column(
              children: [
                const Gap(20),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                Text(description),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
