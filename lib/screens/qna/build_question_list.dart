import 'package:flutter/material.dart';
import 'package:mlearning/model/data_qna.dart';
import 'package:mlearning/utils/constanta_colors.dart';
import 'package:mlearning/utils/size_config.dart';

class BuildQuestionsList extends StatelessWidget {
  const BuildQuestionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24.0)),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  questionsList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      buildShowDialog(context, index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(24.0)),
                      padding:
                          EdgeInsets.all(getProportionateScreenWidth(24.0)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: kBackgroundCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questionsList[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: kText1,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8.0),
                          ),
                          Text(
                            questionsList[index].isAnswer
                                ? questionsList[index].answer
                                : "Belum terjawab...",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: questionsList[index].isAnswer
                                    ? kText2
                                    : kPrimary,
                                fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 88.0),
              ],
            ),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                color: kWhite,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(24.0)),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: double.infinity),
                  child: ElevatedButton(
                      onPressed: () {
                        buildShowModalBottomSheet(context);
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
                          backgroundColor: MaterialStateProperty.all(kPrimary)),
                      child: Text(
                        "Tambah Pertanyaan",
                        style: TextStyle(color: kWhite, fontSize: 16.0),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        // mengatifkan fungsi bottom sheet dapat digulirkan atau di scroll
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(24.0)),
                topRight: Radius.circular(getProportionateScreenWidth(24.0)))),
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenWidth(24.0),
                    left: getProportionateScreenWidth(24.0),
                    right: getProportionateScreenWidth(24.0),
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pertanyaan",
                      style: TextStyle(
                          color: kText1,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(24.0),
                    ),
                    // form untuk memasukan pertanyaan
                    Form(
                        child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Masukan Pertanyaan Anda",
                        filled: true,
                        fillColor: kBackgroundCard,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(24.0),
                            vertical: getProportionateScreenWidth(16.0)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(8.0))),
                      ),
                    )),
                    SizedBox(
                      height: getProportionateScreenWidth(36.0),
                    ),
                    // bottom untuk mengirimkan pertanyaan
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: double.infinity,
                          height: getProportionateScreenHeight(72.0)),
                      child: ElevatedButton(
                          onPressed: () {},
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
                            "Kirim",
                            style: TextStyle(color: kWhite, fontSize: 16.0),
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(16.0),
                    ),
                  ],
                ),
              ),
            ));
  }

  Future buildShowDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              // memri jarak disemua sisi elemen
              padding: EdgeInsets.all(getProportionateScreenWidth(36.0)),
              child: Container(
                width:
                    double.infinity, // panjang elemen mengikuti panjang device
                decoration: BoxDecoration(
                    color: kWhite, // memberi warna text
                    borderRadius: BorderRadius.circular(
                        // membuat lengkungan pada elemen
                        getProportionateScreenWidth(24.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          blurRadius: 8, // memberi blur pada shadow
                          spreadRadius: 4, // memberi lebar blur pada shadow
                          offset: Offset(0.0,
                              0.0), // memberi arah x dan y blur pada shadow
                          color:
                              kText1.withOpacity(0.1)) // memberi warna shadow
                    ]),
                child: Padding(
                  // memri jarak disemua sisi elemen
                  padding: EdgeInsets.all(getProportionateScreenWidth(24.0)),
                  child: SingleChildScrollView(
                    child: Column(
                      // menampilkan elemen secara vertical atau kebawah
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // menampilkan text tanya jawab
                        Text("Pertanyaan",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0, // memberi ukuran text
                                color: kText2, // memberi warna text
                                decoration: TextDecoration
                                    .none)), // memberi style none atau tidak ada
                        // membuat jarak antar elemen emnggunakan sizebox
                        SizedBox(height: getProportionateScreenWidth(8.0)),
                        // menampilkan pertanyaan
                        Text(
                          // menampilkan pertanyaan
                          questionsList[index].title,
                          style: TextStyle(
                              color: kText1, // memberi warna text
                              fontSize: 18.0, // memberi  ukuran text
                              decoration: TextDecoration
                                  .none, // memberi dekorasi text tidak ada
                              fontFamily: 'Poppins', // memberi jenis font
                              fontWeight:
                                  FontWeight.bold), // memberi ketebalan text
                        ),
                        // membuat jarak antar elemen menggunakan sizebox
                        SizedBox(
                          height: getProportionateScreenHeight(24.0),
                        ),
                        // menampilkan jawaban
                        Text("Jawaban",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0, // memberi ukuran text
                                color: kText2, // memberi warna text
                                decoration: TextDecoration
                                    .none)), // memberi dekorasi text tidak ada
                        // membuat jarak antar elemen menggunakan sizebox
                        SizedBox(height: getProportionateScreenWidth(8.0)),
                        Text(
                          // menampilkan jawaban
                          questionsList[index].isAnswer
                              ? questionsList[index].answer
                              : "Belum terjawab...",
                          style: TextStyle(
                              color: questionsList[index].isAnswer
                                  ? kText1
                                  : kPrimary, // memberi warna text
                              fontFamily: 'Poppins', // memberi jenis font
                              decoration: TextDecoration
                                  .none, // memberi dekorasi text tidak ada
                              fontSize: 18.0, // memberi ukuran text
                              fontWeight:
                                  FontWeight.bold), // memberi ketebalan text
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
