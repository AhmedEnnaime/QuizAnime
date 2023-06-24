import 'package:flutter/material.dart';
import 'package:quizz_anime/constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Stack(children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Let's Play Quizz",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("Enter your informations below"),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Fullname",
                      fillColor: Color(0xFF1C2341),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text(
                        "Let's Start Quizz",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
