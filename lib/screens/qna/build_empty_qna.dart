import 'package:flutter/material.dart';
import 'package:mlearning/utils/constanta_colors.dart';
import 'package:mlearning/utils/size_config.dart';

class BuildEmptyQnA extends StatelessWidget {
  const BuildEmptyQnA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24.0)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(36.0),
          ),
          Text(
            "Dari Bertanya Jadi Mengerti",
            style: TextStyle(
                color: kText1, fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(16.0),
          ),
          Text(
            "Ajukan pertanyaanmu dan kamu akan mendapatkan jawabannya",
            style: TextStyle(color: kText2, fontSize: 16.0),
          ),
          SizedBox(
            height: getProportionateScreenHeight(24.0),
          ),
          Form(
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(24.0)),
                      filled: true,
                      suffixIcon: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(4.0)),
                        child: Container(
                            width: getProportionateScreenWidth(36.0),
                            height: getProportionateScreenHeight(36.0),
                            decoration: BoxDecoration(
                                color: kPrimary,
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(100.0))),
                            child: Center(
                              child: Icon(
                                Icons.search_rounded,
                                color: kWhite,
                              ),
                            )),
                      ),
                      hintText: "Masukan password Anda",
                      hintStyle: TextStyle(color: kText2, fontSize: 14.0),
                      fillColor: kBackgroundCard,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(style: BorderStyle.none)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(style: BorderStyle.none))))),
          Spacer(),
          Container(
            color: kWhite,
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(24.0)),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: double.infinity),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.all(getProportionateScreenWidth(16.0))),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(100.0),
                              bottomLeft: Radius.circular(100.0)))),
                      backgroundColor: MaterialStateProperty.all(kPrimary)),
                  child: Text(
                    "Kirim",
                    style: TextStyle(color: kWhite, fontSize: 16.0),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
