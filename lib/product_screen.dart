import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constants.dart';
import 'package:task/read_json.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String showPrices = "show all prices";
  String hideProces = "show less prices";
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ReadJson.readJson(),
        builder: (context, data) {
          if (data.hasData) {
            return SafeArea(
              child: SizedBox(
                width: Constants.getScreenWidth(context),
                height: Constants.getScreenHeight(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // site name
                      Padding(
                        padding: EdgeInsets.only(
                            top: Constants.getScreenHeight(context) * 0.03),
                        child: Text(
                          "PriceRunner",
                          style: TextStyle(
                              color: HexColor(Constants.appColor),
                              fontFamily: Constants.appFont,
                              letterSpacing: 0.0,
                              fontSize:
                                  Constants.getScreenWidth(context) * 0.065,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      // product image
                      SizedBox(
                          width: Constants.getScreenWidth(context) * 0.8,
                          height: Constants.getScreenHeight(context) * 0.3,
                          child: Image.network(data.data!["Image"])),

                      //product title
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                            top: Constants.getScreenHeight(context) * 0.03,
                            left: Constants.getScreenWidth(context) * 0.03),
                        child: Text(
                          data.data!["Title"],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: HexColor(Constants.appColor),
                              shadows: show == false
                                  ? const <Shadow>[
                                      Shadow(
                                        offset: Offset(2.0, 4.0),
                                        color: Colors.black26,
                                        blurRadius: 8,
                                      ),
                                    ]
                                  : [],
                              fontFamily: Constants.appFont,
                              letterSpacing: 0.0,
                              fontSize:
                                  Constants.getScreenWidth(context) * 0.045,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      // product keywords
                      Container(
                        margin: EdgeInsets.only(
                            top: Constants.getScreenHeight(context) * 0.02),
                        alignment: Alignment.centerLeft,
                        height: Constants.getScreenHeight(context) * 0.05,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(
                                        Constants.getScreenWidth(context) *
                                            0.01)),
                                child: Center(
                                    child: Text(
                                  data.data!["kWords"][index],
                                  style: TextStyle(
                                      color: HexColor("#888888"),
                                      fontFamily: Constants.appFont,
                                      letterSpacing: 0.0,
                                      fontSize:
                                          Constants.getScreenWidth(context) *
                                              0.032,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            );
                          },
                          itemCount: data.data!["kWords"].length,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                            top: Constants.getScreenHeight(context) * 0.035,
                            left: Constants.getScreenWidth(context) * 0.03),
                        child: Text(
                          "Discover & compare prices",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: HexColor("#200E32"),
                              fontFamily: Constants.appFont,
                              letterSpacing: 0.0,
                              fontSize:
                                  Constants.getScreenWidth(context) * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      // sites availability
                      Container(
                        margin: EdgeInsets.only(
                            top: Constants.getScreenHeight(context) * 0.02,
                            left: Constants.getScreenWidth(context) * 0.02,
                            right: Constants.getScreenWidth(context) * 0.1),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[200]!),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      data.data!["Sites"][index]["logo"],
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            Constants.getScreenWidth(context) *
                                                0.02),
                                    child: Row(
                                      children: [
                                        Text(
                                          data.data!["Sites"][index]["Name"],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  HexColor(Constants.appColor),
                                              fontFamily: Constants.appFont,
                                              letterSpacing: 0.0,
                                              fontSize:
                                                  Constants.getScreenWidth(
                                                          context) *
                                                      0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            data.data!["Sites"][index]
                                                ["Currency"],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: HexColor(
                                                    Constants.appColor),
                                                fontFamily: Constants.appFont,
                                                letterSpacing: 0.0,
                                                fontSize:
                                                    Constants.getScreenWidth(
                                                            context) *
                                                        0.035,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: Constants.getScreenWidth(
                                                  context) *
                                              0.01),
                                      child: Image.asset(
                                        data.data!["Sites"][index]["av"] == 1
                                            ? "assets/images/In_stock.png"
                                            : "assets/images/Out_of_stock@2x.png",
                                        width: 20,
                                        height: 20,
                                      )),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        data.data!["Sites"][index]["Price"]
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: HexColor(Constants.appColor),
                                            fontFamily: Constants.appFont,
                                            letterSpacing: 0.0,
                                            fontSize: Constants.getScreenWidth(
                                                    context) *
                                                0.035,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          data.data!["Sites"][index]
                                              ["Currency"],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  HexColor(Constants.appColor),
                                              fontFamily: Constants.appFont,
                                              letterSpacing: 0.0,
                                              fontSize:
                                                  Constants.getScreenWidth(
                                                          context) *
                                                      0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount:
                              show == true ? data.data!["Sites"].length : 2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: Constants.getScreenHeight(context) * 0.01,
                              left: Constants.getScreenWidth(context) * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                show == true ? hideProces : showPrices,
                                style: TextStyle(
                                    color: HexColor(Constants.appColor),
                                    fontFamily: Constants.appFont,
                                    letterSpacing: 0.0,
                                    fontSize:
                                        Constants.getScreenWidth(context) *
                                            0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                show == true
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                color: HexColor(Constants.appColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          } else if (data.hasError) {
            return Text("${data.error}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
