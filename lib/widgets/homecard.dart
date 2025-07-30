import 'package:flutter/material.dart';
import 'package:flutter_ai_app/models/home_type.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class Homecard extends StatelessWidget {
  final HomeType homeType;
  const Homecard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Card(
      elevation: 0,
      color: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20)
        )
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: homeType.onTap,
        child: homeType.leftAlign ? Row(
          children: [
            Spacer(),
            Text(homeType.title,
              style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Lottie.asset("assets/lottie/${homeType.lottie}.json", width: size.width * 0.35, height: size.height * 0.14),
            ),
          ],
        ) : Row(
          children: [
            Lottie.asset("assets/lottie/${homeType.lottie}.json", width: size.width * 0.35),
            Text(homeType.title,
            style: TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
            )
          ],
        ),
      ),
    ).animate().shake(duration: Duration(seconds : 5), curve: Curves.ease);
  }
}
