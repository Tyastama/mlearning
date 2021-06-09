import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mlearning/model/data_quiz.dart';
import 'package:mlearning/screens/score/score_screen.dart';
import 'package:mlearning/utils/constanta_colors.dart';
import 'package:mlearning/utils/size_config.dart';

class DetailQuizScreen extends StatefulWidget {
  @override
  _DetailQuizScreenState createState() => _DetailQuizScreenState();
}

class _DetailQuizScreenState extends State<DetailQuizScreen> {
  late int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kuis"),
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
          Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(24.0)),
                    child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(24.0)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: kBackgroundCard),
                        child: Column(
                          children: [
                            ...List.generate(
                                questionQuiz.length,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${(index + 1).toString()}. ${questionQuiz[index].question}",
                                          style: TextStyle(
                                              color: kText1, fontSize: 16.0),
                                        ),
                                        ...List.generate(
                                          questionQuiz[index]
                                              .selectionsList
                                              .length,
                                          (i) => RadioListTile(
                                            value: questionQuiz[index]
                                                .selectionsList[i]
                                                .value,
                                            groupValue: selectedRadioTile,
                                            title: Text(questionQuiz[index]
                                                .selectionsList[i]
                                                .selection),
                                            onChanged: (val) {
                                              setSelectedRadioTile(val);
                                            },
                                            activeColor: kPrimary,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenWidth(36.0),
                                        )
                                      ],
                                    )),
                            SizedBox(
                              height: 100.0,
                            )
                          ],
                        ))),
              ),
              Column(
                children: [
                  Spacer(),
                  Container(
                    color: kWhite,
                    padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: double.infinity),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ScoreScreen(
                                          score: 100,
                                        )));
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.all(
                                  getProportionateScreenWidth(16.0))),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(100.0),
                                          topRight: Radius.circular(8.0),
                                          bottomRight: Radius.circular(100.0),
                                          bottomLeft: Radius.circular(100.0)))),
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimary)),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: kWhite, fontSize: 16.0),
                          )),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
