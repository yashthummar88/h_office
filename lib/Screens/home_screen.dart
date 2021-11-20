import 'package:flutter/material.dart';
import 'package:h_office/Constant/constant.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Screens/ContactScreens/contact_screen.dart';
import 'package:h_office/Screens/add_prospect_screen.dart';
import 'package:h_office/Screens/lead&task_screen.dart';
import 'package:h_office/Screens/setting_screen.dart';
import 'package:h_office/Utils/math_utils.dart';
import 'dart:math' as math;

import 'package:h_office/Utils/utilities.dart';
import 'package:h_office/Widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const route = "home_screen";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage(h_logo2),
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingScreen.routes);
                },
                icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.power_settings_new)),
          ],
          backgroundColor: appTheme.themeBackground,
          title: Text(
            "Home",
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
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getSize(30, context), vertical: getSize(30, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ModuleConstant.screenType =
                          ModuleConstant.MODULE_TYPE_LEAD_SCREEN;
                      Navigator.of(context).pushNamed(LeadTaskScreen.routes);
                    },
                    child: getContainer(
                        image: InquiryIcon,
                        title: "Inquiry",
                        imageSize: getSize(125, context)),
                  ),
                  InkWell(
                    onTap: () {
                      ModuleConstant.screenType =
                          ModuleConstant.MODULE_TYPE_TASK_SCREEN;
                      Navigator.of(context).pushNamed(LeadTaskScreen.routes);
                    },
                    child: getContainer(
                        image: TaskIcon,
                        title: "Task",
                        imageSize: getSize(125, context)),
                  )
                ],
              ),
              SizedBox(
                height: getSize(40, context),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ContactScreen.routes);
                },
                child: getContainer(
                    image: ContactIcon,
                    title: "Contact",
                    imageSize: getSize(125, context)),
              )
            ],
          ),
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
        Padding(
          padding: EdgeInsets.only(right: getSize(8, context)),
          child: InkWell(
            onTap: () {
              if (title == "Task") {
                print("Task");
                _showMyBottomSheet();
              } else if (title == "Raw Data") {
                Navigator.of(context).pushNamed(AddProspectScreen.routes);
              }
            },
            child: CircleAvatar(
              backgroundColor: appTheme.primaryTheme,
              radius: getSize(23, context),
              child: Image(
                image: AssetImage(image),
                width: getSize(imageSize, context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container getContainer(
      {required String image,
      required String title,
      required double imageSize}) {
    return Container(
      alignment: Alignment.center,
      height: getSize(150, context),
      width: getSize(150, context),
      color: appTheme.themeBackground,
      child: Column(
        children: [
          SizedBox(
            height: getSize(10, context),
          ),
          Image(
            image: AssetImage(image),
            width: getSize(imageSize, context),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: getFontSize(20, context)),
          )
        ],
      ),
    );
  }

  void _showMyBottomSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return MyBottomSheetLayout();
        });
  }
}
