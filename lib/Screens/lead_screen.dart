import 'package:flutter/material.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Utils/math_utils.dart';
import 'package:h_office/Utils/utilities.dart';
import 'package:h_office/main.dart';

class LeadScreen extends StatefulWidget {
  static const routes = "lead_screen";
  const LeadScreen({Key? key}) : super(key: key);

  @override
  _LeadScreenState createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  List<String> leadCategoriesTitle = [
    "Quotations",
    "Sales",
    "Total Order",
    "New Lead",
    "Followup for Today",
    "Missed Followup",
    "Appointments",
    "Total Followup",
    "Forecasting"
  ];
  List<String> leadCategoriesImage = [
    LeadQuotation,
    LeadSales,
    LeadTotalOrder,
    LeadNewLead,
    LeadTodayFollowUp,
    LeadMFU,
    LeadAppoinment,
    LeadTotalFollowUp,
    LeadForecast
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image(
            image: AssetImage(h_logo2),
            color: appTheme.primaryTheme,
            width: getSize(20, context),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
            IconButton(onPressed: () {}, icon: Icon(Icons.autorenew)),
          ],
          backgroundColor: appTheme.themeBackground,
          title: Text(
            "Laed",
            style: TextStyle(
                color: Colors.white, fontSize: getFontSize(25, context)),
          ),
        ),
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            getRow(
                context: context,
                image: TaskIcon,
                title: "Task",
                imageSize: 25),
            getRow(
                context: context,
                image: ContactIcon,
                title: "Raw Data",
                imageSize: 35),
            getRow(
                context: context,
                image: InquiryIcon,
                title: "Inquiry",
                imageSize: 35),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getSize(5, context),
                        vertical: getSize(10, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("01/11/2021-30/11/2021"),
                        Text("My Inquiry"),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: getSize(390, context),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getSize(10, context),
                                  vertical: getSize(0, context)),
                              child: GridView.builder(
                                  itemCount: leadCategoriesTitle.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 3
                                            : 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: (5 / 4.7),
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: getSize(5, context)),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "\$10",
                                            style: TextStyle(
                                                color: appTheme.primaryTheme),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                leadCategoriesImage[index]),
                                            width: getSize(50, context),
                                          ),
                                          Text(
                                            leadCategoriesTitle[index],
                                            style: TextStyle(
                                                fontSize:
                                                    getFontSize(15, context)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          getFunnelContainer(
                              context: context,
                              image: Funnel1,
                              width: 450,
                              height: 70,
                              text: "1 (Prospect)"),
                          getFunnelContainer(
                              context: context,
                              image: Funnel2,
                              width: 450,
                              height: 70,
                              text: "1 (Lead)"),
                          getFunnelContainer(
                              context: context,
                              image: Funnel3,
                              width: 450,
                              height: 70,
                              text: "0 (Q.Lead"),
                          getFunnelContainer(
                              context: context,
                              image: Funnel4,
                              width: 450,
                              height: 70,
                              text: "0 (Opportunity)"),
                          getFunnelContainer(
                              context: context,
                              image: Funnel5,
                              width: 450,
                              height: 70,
                              text: "0 (Lost)"),
                          getFunnelContainer(
                              context: context,
                              image: Funnel6,
                              width: 450,
                              height: 70,
                              text: "2 (Won)"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: getSize(92, context),
              right: getSize(18, context),
              child: FloatingActionButton(
                onPressed: () {},
                heroTag: "as1",
                child: Icon(
                  Icons.search,
                  size: getSize(30, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row getRow(
      {required BuildContext context,
      required String image,
      required String title,
      required double imageSize}) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: getSize(10, context),
                vertical: getSize(5, context)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(getSize(5, context)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45, blurRadius: 2, spreadRadius: 2)
                ]),
            child: Text(
              title,
              style: TextStyle(color: appTheme.primaryTheme),
            )),
        SizedBox(
          width: getSize(7, context),
        ),
        FloatingActionButton(
          heroTag: "a21",
          mini: true,
          onPressed: () {},
          child: Image(
            image: AssetImage(image),
            width: getSize(imageSize, context),
          ),
        ),
      ],
    );
  }
}
