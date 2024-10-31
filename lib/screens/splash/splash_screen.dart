import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:raintonic/route/auto_route.gr.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../config.dart';
import '../../styles.dart';

@RoutePage(name: 'SplashRoute')
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Todo load things from api instead of delay
    Future.delayed(const Duration(seconds: 3))
        .then((value) => AutoRouter.of(context).replace(const HomeRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    decoration: BoxDecoration(
                      color: Colors.white, // Container color
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 150, // Adjust the width as needed
                        height: 150, // Adjust the height as needed
                        child: Assets.logo
                            .image(), // Assuming Assets.logo.image() returns an Image widget
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Animate(
                  delay: const Duration(seconds: 1),
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      Config.appName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamily.sfuifont,
                        fontSize: 24, // Increased font size for prominence
                        fontWeight:
                            FontWeight.w900, // Extra bold weight for impact
                        color: Styles.primaryColor, // Add a primary color
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Colors.grey
                                .withOpacity(0.5), // Adds a soft shadow
                          ),
                        ],
                        letterSpacing:
                            1.5, // Slight letter spacing for a sleek look
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
