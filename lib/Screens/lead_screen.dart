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
