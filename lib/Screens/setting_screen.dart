import 'package:flutter/material.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Utils/math_utils.dart';

class SettingScreen extends StatefulWidget {
  static const routes = "setting_screen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool enableCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Settings"),
        backgroundColor: appTheme.themeBackground,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getSize(15, context),
          vertical: getSize(25, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Company Details",
              style: TextStyle(color: appTheme.primaryTheme),
            ),
            SizedBox(
              height: getSize(20, context),
            ),
            Text(
              "Test Medical",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getFontSize(18, context)),
            ),
            Text(
              "Hofficedemo4_ondemandcrm_co",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(
              height: getSize(40, context),
            ),
            Text(
              "General",
              style: TextStyle(color: appTheme.primaryTheme),
            ),
            SizedBox(
              height: getSize(20, context),
            ),
            InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Linked Accounts"),
                  Text(
                    "Linked Account to gmail",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: getSize(20, context),
                  ),
                  Divider(
                    height: getSize(1, context),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSize(20, context),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sync"),
                      Text(
                        "Sync database from server",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: getSize(10, context)),
                    child: Image(
                      image: AssetImage(SyncIcon),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSize(20, context),
            ),
            Divider(
              height: getSize(1, context),
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: getSize(20, context),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enable"),
                      Text(
                        "Enable Call Dialog",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Checkbox(
                      value: enableCheckBox,
                      onChanged: (val) {
                        setState(() {
                          enableCheckBox = val!;
                        });
                      })
                ],
              ),
            ),
            SizedBox(
              height: getSize(10, context),
            ),
            Divider(
              height: getSize(1, context),
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    ));
  }
}
