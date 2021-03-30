import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mlearning/utils/constanta_colors.dart';
import 'package:mlearning/utils/size_config.dart';
import 'package:mlearning/model/Teori.dart';
import 'package:mlearning/api/api.dart';

class TheoryScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teori"),
        //membuat judul di app bar
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              SvgPicture.asset(
                "assets/illustrations/theory.svg",
                width: getProportionateScreenWidth(414.0),
              )
            ],
          ),
          //membuat tampilan gambar pada background halaman 
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24.0)),
            child: SingleChildScrollView(
              child: FutureBuilder(future: api_teori().getAll(), builder: (context,snapshot){return Column(
                  children: [
                    ...List.generate(
                      snapshot.data.length,//list container
                      (index)=> Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(62.0),
                        margin: EdgeInsets.only(
                            bottom: getProportionateScreenWidth(16.0)),
                        decoration: BoxDecoration(
                            color: kBackgroundCard,
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(8.0))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(24.0)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(snapshot.data[index].makul,//list data
                              style: TextStyle(color: kText1, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );},
                ),
              ),
            ),
        ],
      ),
    );
  }
}
