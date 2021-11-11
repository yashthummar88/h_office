import 'package:flutter/material.dart';
import 'package:h_office/Constant/constant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Utils/math_utils.dart';

class LeadScreen extends StatefulWidget {
  static const routes = "lead_screen";
  const LeadScreen({Key? key}) : super(key: key);

  @override
  _LeadScreenState createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  String appBarTitle = "Quotation";
  bool isSearchFieldVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    getAppBarTitle();
    super.initState();
  }

  getAppBarTitle() {
    if (LeadScreenModuleConstant.leadScreenType ==
        LeadScreenModuleConstant.MODULE_TYPE_QUOTATIONS) {
      appBarTitle = "Quotation";
    } else if (LeadScreenModuleConstant.leadScreenType ==
            LeadScreenModuleConstant.MODULE_TYPE_SALES ||
        LeadScreenModuleConstant.leadScreenType ==
            LeadScreenModuleConstant.MODULE_TYPE_TOTAL_ORDER) {
      appBarTitle = "Total Sales(Without Tax)";
    } else if (LeadScreenModuleConstant.leadScreenType ==
        LeadScreenModuleConstant.MODULE_TYPE_NEW_LEAD) {
      appBarTitle = "New Inquiry Stage List";
    } else if (LeadScreenModuleConstant.leadScreenType ==
            LeadScreenModuleConstant.MODULE_TYPE_FOLLOW_UP_FOR_TODAY ||
        LeadScreenModuleConstant.leadScreenType ==
            LeadScreenModuleConstant.MODULE_TYPE_TOTAL_FOLLOWUP ||
        LeadScreenModuleConstant.leadScreenType ==
            LeadScreenModuleConstant.MODULE_TYPE_MISSED_FOLLOWUP) {
      appBarTitle = "Followup";
    } else if (LeadScreenModuleConstant.leadScreenType ==
        LeadScreenModuleConstant.MODULE_TYPE_APPOINTMENTS) {
      appBarTitle = "Appointment";
    } else if (LeadScreenModuleConstant.leadScreenType ==
        LeadScreenModuleConstant.MODULE_TYPE_FORECASTING) {
      appBarTitle = "Forecast";
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (isSearchFieldVisible) {
                isSearchFieldVisible = !isSearchFieldVisible;
                setState(() {});
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  isSearchFieldVisible = !isSearchFieldVisible;
                  setState(() {});
                },
                icon: (isSearchFieldVisible)
                    ? Icon(Icons.close)
                    : Icon(Icons.search)),
          ],
          backgroundColor: appTheme.themeBackground,
          title: (isSearchFieldVisible)
              ? TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                      ),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white30)),
                )
              : Text(
                  appBarTitle,
                  style: TextStyle(
                      color: Colors.white, fontSize: getFontSize(25, context)),
                ),
        ),
      ),
    );
  }
}
