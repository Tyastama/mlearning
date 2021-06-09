import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mlearning/utils/constanta_colors.dart';
import 'package:mlearning/utils/size_config.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  const ScoreScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skor"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              SvgPicture.asset(
                "assets/illustrations/quiz.svg",
                width: getProportionateScreenWidth(414.0),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24.0)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(24.0),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Selamat\nNilai Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kText1, fontSize: 24.0),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(36.0),
                ),
                Text(
                  score.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kPrimary,
                      fontSize: 72.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
