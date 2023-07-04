import 'package:flutter/material.dart';

import '../widgets/animeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Text(
                "Animes",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimeCard(
                    anime: 'Kimetsu',
                    image: 'demon.png',
                  ),
                  AnimeCard(
                    anime: 'One piece',
                    image: 'onepiece.png',
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimeCard(
                    anime: 'Jujutsu Kaisen',
                    image: 'jjk.png',
                  ),
                  AnimeCard(
                    anime: 'Naruto',
                    image: 'naruto.png',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
