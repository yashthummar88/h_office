import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Screens/home_screen.dart';
import 'package:h_office/Utils/math_utils.dart';

class LoginScreen extends StatefulWidget {
  static const route = "login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: appTheme.statusBarColor,
    ));
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: appTheme.primaryTheme,
              image: DecorationImage(
                  image: AssetImage(login_bg), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(logo)),
                    SizedBox(
                      height: getSize(80, context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(20, context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              labelText: "User Name",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: getSize(2, context))),
                            ),
                          ),
                          SizedBox(
                            height: getSize(15, context),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: getSize(2, context))),
                            ),
                          ),
                          SizedBox(
                            height: getSize(15, context),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              labelText: "Domain Name",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: getSize(2, context))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: getSize(2, context))),
                            ),
                          ),
                          SizedBox(
                            height: getSize(30, context),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(HomeScreen.route);
                            },
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: getFontSize(25, context)),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        getSize(10, context))),
                                padding: EdgeInsets.only(
                                    right: getSize(110, context),
                                    left: getSize(110, context),
                                    top: getSize(5, context),
                                    bottom: getSize(5, context)),
                                primary: Colors.black87),
                          ),
                          SizedBox(
                            height: getSize(100, context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
