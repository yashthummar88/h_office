import 'package:flutter/material.dart';
import 'package:h_office/Constant/constant.dart';
import 'package:h_office/Constant/imageConstant.dart';
import 'package:h_office/Helper/theme_helper.dart';
import 'package:h_office/Screens/TaskScreens/task_screen.dart';
import 'package:h_office/Screens/add_prospect_screen.dart';
import 'package:h_office/Utils/math_utils.dart';
import 'package:h_office/Utils/utilities.dart';
import 'package:h_office/Widgets/bottom_sheet.dart';
import 'package:h_office/main.dart';
import 'LeadScreens/lead_screen.dart';

class LeadTaskScreen extends StatefulWidget {
  static const routes = "lead_and_task_screen";
  const LeadTaskScreen({Key? key}) : super(key: key);

  @override
  _LeadTaskScreenState createState() => _LeadTaskScreenState();
}

class _LeadTaskScreenState extends State<LeadTaskScreen> {
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
  List<String> taskCategoriesImage = [
    TaskNewDueTask,
    TaskOverDueTask,
    TaskFollowingTask,
    TaskOpenTask,
    TaskCloseTask,
    TaskALLTask,
  ];
  List<String> taskCategoriesTitle = [
    "New Tasks",
    "Overdue Tasks",
    "Following Tasks",
    "Open Tasks",
    "Close Tasks",
    "All Tasks",
  ];
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
            IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
            IconButton(onPressed: () {}, icon: Icon(Icons.autorenew)),
          ],
          backgroundColor: appTheme.themeBackground,
          title: Text(
            (ModuleConstant.screenType ==
                    ModuleConstant.MODULE_TYPE_TASK_SCREEN)
                ? "Task"
                : "Lead",
            style: TextStyle(
                color: Colors.white, fontSize: getFontSize(25, context)),
          ),
        ),
        floatingActionButton: ((ModuleConstant.screenType ==
                ModuleConstant.MODULE_TYPE_TASK_SCREEN))
            ? FloatingActionButton(
                onPressed: () {
                  _showMyBottomSheet();
                },
                child: Icon(Icons.add),
              )
            : ExpandableFab(
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
                        Text((ModuleConstant.screenType ==
                                ModuleConstant.MODULE_TYPE_TASK_SCREEN)
                            ? "My Task"
                            : "My Inquiry"),
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
                            height: getSize(
                                (ModuleConstant.screenType ==
                                        ModuleConstant.MODULE_TYPE_TASK_SCREEN)
                                    ? 260
                                    : 390,
                                context),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getSize(10, context),
                                  vertical: getSize(0, context)),
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: (ModuleConstant.screenType ==
                                          ModuleConstant
                                              .MODULE_TYPE_TASK_SCREEN)
                                      ? taskCategoriesImage.length
                                      : leadCategoriesTitle.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 3
                                            : 3,
                                    crossAxisSpacing: getSize(10, context),
                                    mainAxisSpacing: getSize(10, context),
                                    childAspectRatio: (5 / 4.7),
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        if (ModuleConstant.screenType ==
                                            ModuleConstant
                                                .MODULE_TYPE_TASK_SCREEN) {
                                          TaskScreenModuleConstant
                                                  .taskListScreenType =
                                              taskCategoriesTitle[index];
                                          Navigator.of(context)
                                              .pushNamed(TaskScreen.routes);
                                        } else {
                                          LeadScreenModuleConstant
                                                  .leadScreenType =
                                              leadCategoriesTitle[index];
                                          Navigator.of(context)
                                              .pushNamed(LeadScreen.routes);
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: getSize(5, context)),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              image: AssetImage((ModuleConstant
                                                          .screenType ==
                                                      ModuleConstant
                                                          .MODULE_TYPE_TASK_SCREEN)
                                                  ? taskCategoriesImage[index]
                                                  : leadCategoriesImage[index]),
                                              width: getSize(50, context),
                                            ),
                                            Text(
                                              (ModuleConstant.screenType ==
                                                      ModuleConstant
                                                          .MODULE_TYPE_TASK_SCREEN)
                                                  ? taskCategoriesTitle[index]
                                                  : leadCategoriesTitle[index],
                                              style: TextStyle(
                                                  fontSize:
                                                      getFontSize(15, context)),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          if (ModuleConstant.screenType ==
                              ModuleConstant.MODULE_TYPE_LEAD_SCREEN)
                            Column(
                              children: [
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
                          if (ModuleConstant.screenType ==
                              ModuleConstant.MODULE_TYPE_TASK_SCREEN)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "All Open Tasks",
                                  style: TextStyle(
                                      fontSize: getFontSize(20, context)),
                                ),
                              ],
                            ),
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

  void _showMyBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return MyBottomSheetLayout();
        });
  }
}
