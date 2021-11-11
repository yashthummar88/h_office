import 'package:flutter/material.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Utils/math_utils.dart';
import 'package:h_office/Utils/utilities.dart';

class ContactScreen extends StatefulWidget {
  static const routes = "contact_screen";
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool searchVisible = false;
  bool radioVisible = false;
  String groupValue = "Name";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appTheme.themeBackground,
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
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white, fontSize: getFontSize(18, context)),
            ),
            bottom: TabBar(
              indicatorColor: appTheme.primaryTheme,
              tabs: [
                Tab(
                  child: Text("CONTACTS"),
                ),
                Tab(
                  child: Text("RAW CONTACTS"),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              searchVisible = !searchVisible;
              if (radioVisible = true) {
                radioVisible = false;
              }
              setState(() {});
            },
            child: Icon(Icons.search),
            heroTag: "AS1234",
          ),
          body: TabBarView(
            children: [
              getTabBody(),
              getTabBody(),
            ],
          ),
        ),
      ),
    );
  }

  getTabBody() {
    return Column(
      children: [
        Visibility(
          visible: searchVisible,
          child: InkWell(
            onTap: () {
              radioVisible = true;
              setState(() {});
            },
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getSize(10, context),
                        horizontal: getSize(10, context)),
                    height: getSize(55, context),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        getSize(5, context),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(10, context)),
                      child: TextFormField(
                        onTap: () {
                          if (radioVisible == false) {
                            radioVisible = true;
                          } else {
                            FocusManager.instance.primaryFocus?.unfocus();
                            radioVisible = false;
                          }
                          setState(() {});
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: (groupValue == "Name")
                              ? "Type Name"
                              : "Type Mobile No",
                          prefixIcon: Icon(
                            Icons.search,
                            color: appTheme.themeBackground,
                          ),
                          suffixIcon: (!radioVisible)
                              ? SizedBox()
                              : Icon(
                                  Icons.close,
                                  color: appTheme.themeBackground,
                                ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appTheme.primaryTheme, width: 2.0),
                          ),
                        ),
                        cursorColor: appTheme.primaryTheme,
                        cursorHeight: getSize(25, context),
                      ),
                    )),
                Visibility(
                    visible: radioVisible,
                    child: Row(
                      children: [
                        Radio(
                            value: "Name",
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = val.toString();
                                print(groupValue);
                              });
                            }),
                        Text("Name"),
                        Radio(
                            value: "Number",
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = val.toString();
                                print(groupValue);
                              });
                            }),
                        Text("Mobile No"),
                      ],
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "123456789",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(25, context)),
                    ),
                    SizedBox(
                      height: getSize(10, context),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: getSize(5, context),
                          ),
                          CircleAvatar(
                            radius: getSize(35, context),
                            backgroundColor: appTheme.lightGreenColor,
                            child: Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(30, context)),
                            ),
                          ),
                          SizedBox(
                            width: getSize(10, context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getTextItems(
                                  title: "Mobile:", text: " 7598452526"),
                              SizedBox(
                                height: getSize(2, context),
                              ),
                              getTextItems(title: "E-Mail:", text: " N/A"),
                              SizedBox(
                                height: getSize(2, context),
                              ),
                              getTextItems(title: "Acc.Manager:", text: " N/A"),
                              SizedBox(
                                height: getSize(2, context),
                              ),
                              getTextItems(title: "CreatedBy:", text: " N/A"),
                              SizedBox(
                                height: getSize(2, context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getSize(15, context),
                    ),
                    Divider(
                      height: getSize(1, context),
                      color: appTheme.themeBackground,
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
