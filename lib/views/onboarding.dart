import 'package:flutter/material.dart';
import 'package:flutter_ai_app/views/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../models/lottie_model.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<LottieModel> lotties = [
      LottieModel(title: "Ask me Anything", subTitle: "I can be your best friend and you can ask me for help and I will help you",
          lottie: "assets/lottie/ask_ai.json"),

      LottieModel(title: "Imagination to Reality", subTitle: "Just imagine anything and let me know. I will create something wonderful for you",
          lottie: "assets/lottie/ai_messaging.json")
    ];
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            final isLast = index == lotties.length - 1;
            return Column(
              children: [
                Lottie.asset(lotties[index].lottie,
                  height: isLast ? size.height * 0.48 : null
                ),
                Text(lotties[index].title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5
                ),
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                    lotties[index].subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      letterSpacing: 0.5
                    ),
                  ),
                ),
                const Spacer(),
                Wrap(
                  spacing: 12,
                  children: List.generate(lotties.length, (ind){
                    return Container(
                      width: 10,
                      height: 8,
                      decoration: BoxDecoration(
                        color: ind == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    );
                  }),
                ),
                const Spacer(),
                ElevatedButton(onPressed: (){
                  isLast ? /*Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                    return HomeScreen();
                  }))*/ Get.off((){
                    return HomeScreen();
                  }): _pageController.nextPage(duration: Duration(seconds: 2), curve: Curves.ease);
                },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(size.width * .4, 40)
                  ),
                  child: Text(isLast ? "Finish" : "Next", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                  ),
                ),
                const Spacer(flex: 2,)
              ],
            );
          },
          itemCount: lotties.length,
        ),
      ),
    );
  }
}
