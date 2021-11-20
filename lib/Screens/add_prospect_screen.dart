import 'package:flutter/material.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Utils/math_utils.dart';

class AddProspectScreen extends StatefulWidget {
  static const routes = "add_prospect_screen";
  const AddProspectScreen({Key? key}) : super(key: key);

  @override
  _AddProspectScreenState createState() => _AddProspectScreenState();
}

class _AddProspectScreenState extends State<AddProspectScreen> {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController officeNumberController = TextEditingController();
  TextEditingController otherNumberController = TextEditingController();
  TextEditingController homeNumberController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController linkedIdController = TextEditingController();

  bool moreInfoVisible = false;
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.themeBackground,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Add Prospect",
            style: TextStyle(
                color: Colors.white, fontSize: getFontSize(25, context)),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: getSize(20, context)),
          children: [
            SizedBox(
              height: getSize(30, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getSize(20, context), bottom: getSize(30, context)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: getSize(45, context),
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(ProspectUser),
                    ),
                  ),
                  SizedBox(
                    width: getSize(30, context),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: getSize(30, context),
                        right: getSize(10, context),
                        top: getSize(10, context),
                        bottom: getSize(10, context)),
                    height: getSize(45, context),
                    width: getSize(155, context),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mr.",
                          style: TextStyle(fontSize: getFontSize(20, context)),
                        ),
                        Image(
                          image: AssetImage(ProspectDropDownIcon),
                          width: getSize(50, context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            getTextField(hintText: "Contact Name*", icon: ProspectPerson),
            getTextField(hintText: "Company Name*", icon: ProspectCompany),
            getTextField(hintText: "Mobile Number*", icon: ProspectMOB),
            getTextField(hintText: "E-Mail", icon: ProspectEmail),
            getTextField(hintText: "Address", icon: ProspectAddress),
            getTextField(hintText: "Zop/Pincode", icon: ProspectPinCode),
            getTextField(hintText: "Office Number*", icon: ProspectOffice),
            SizedBox(
              height: getSize(10, context),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  moreInfoVisible = !moreInfoVisible;
                });
              },
              child: Container(
                height: getSize(50, context),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  (!moreInfoVisible) ? "Add more info" : "Add less info",
                  style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: appTheme.primaryTheme),
                ),
              ),
            ),
            SizedBox(
              height: getSize(15, context),
            ),
            Visibility(
              visible: moreInfoVisible,
              child: Column(
                children: [
                  getTextField(hintText: "Other Number", icon: ProspectPhone),
                  getTextField(
                      hintText: "Home Number", icon: ProspectTelephone),
                  getTextField(hintText: "Website", icon: ProspectWeb),
                  getTextField(hintText: "Linked ID", icon: ProspectLinkedIN),
                  getDropDownSelection(title: "Select Source"),
                  getDropDownSelection(title: "Select Contact Type"),
                  getDropDownSelection(title: "India"),
                  getDropDownSelection(title: "Select State"),
                  getDropDownSelection(title: "Select City"),
                  getDropDownSelection(title: "Select Industry"),
                ],
              ),
            ),
            Text(
              "Select key account manager for this contact:",
              style: TextStyle(
                  fontSize: getFontSize(20, context),
                  color: appTheme.primaryTheme),
            ),
            SizedBox(
              height: getSize(10, context),
            ),
            getDropDownSelection(title: "Laxman Parmar"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: checkBoxValue,
                    onChanged: (val) {
                      setState(() {
                        checkBoxValue = val!;
                      });
                    }),
                Text(
                  "also save in phone contacts",
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getSize(15, context),
            ),
            Container(
              height: getSize(58, context),
              margin: EdgeInsets.symmetric(horizontal: getSize(60, context)),
              decoration: BoxDecoration(
                color: appTheme.primaryTheme,
                borderRadius: BorderRadius.circular(getSize(70, context)),
              ),
              alignment: Alignment.center,
              child: Text(
                "SAVE",
                style: TextStyle(
                    color: Colors.white, fontSize: getFontSize(20, context)),
              ),
            ),
            SizedBox(
              height: getSize(30, context),
            ),
          ],
        ),
      ),
    );
  }

  getDropDownSelection({
    required String title,
  }) {
    return Container(
      height: getSize(45, context),
      margin: EdgeInsets.only(bottom: getSize(10, context)),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: getSize(35, context)),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: getFontSize(20, context)),
              )),
          Image(
            image: AssetImage(ProspectDropDownIcon),
            width: getSize(50, context),
          ),
        ],
      ),
    );
  }

  getTextField({required String hintText, required String icon}) {
    return Container(
      height: getSize(50, context),
      margin: EdgeInsets.only(bottom: getSize(10, context)),
      child: TextField(
        controller: contactNameController,
        cursorColor: appTheme.primaryTheme,
        cursorHeight: getSize(25, context),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey.shade500, fontSize: getFontSize(20, context)),
          contentPadding: EdgeInsets.only(
              top: getSize(15, context), left: getSize(30, context)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getSize(35, context)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getSize(35, context)),
          ),
          suffixIconConstraints: BoxConstraints(minHeight: 15, minWidth: 15),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: getSize(20, context)),
            child: Image(
              height: 27,
              image: AssetImage(icon),
            ),
          ),
        ),
      ),
    );
  }
}
