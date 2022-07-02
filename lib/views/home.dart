import 'package:flutter/material.dart';
import 'package:flutter_app_test/controllers/user_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userController = Get.put(UserController());
  bool isDaily = false;
  bool isMonthly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(80)),
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.perm_identity_sharp,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
        body: GetX<UserController>(builder: (controller) {
          if (controller.allData.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        "Hi, " + controller.allData[0].user!.fName.toString(),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Daily Consumption Status",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isDaily = !isDaily;
                            });
                          },
                          child: Icon(
                            isDaily
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  isDaily
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white, boxShadow: []),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        "Your Daily Status",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Date",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Breakfast",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Lunch",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Dinner",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///Daily consumption widget
                                ///
                                ///
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  child: GetX<UserController>(
                                      builder: (controller) {
                                    return ListView.builder(
                                        //itemCount: controller.products.length,
                                        shrinkWrap: true,
                                        itemCount: userController
                                            .allData[0].reports!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (userController.allData[0]
                                                  .reports![index].optIns
                                                  .toString() !=
                                              '[]') {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              userController
                                                                  .allData[0]
                                                                  .reports![
                                                                      index]
                                                                  .date
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              userController
                                                                      .allData[0]
                                                                      .reports![
                                                                          index]
                                                                      .optIns[
                                                                  'breakfast'],
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: userController.allData[0].reports![index].optIns[
                                                                              'breakfast'] ==
                                                                          'Pending'
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .black),
                                                            ),
                                                            Text(
                                                              userController
                                                                      .allData[0]
                                                                      .reports![
                                                                          index]
                                                                      .optIns[
                                                                  'lunch'],
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: userController.allData[0].reports![index].optIns[
                                                                  'lunch'] ==
                                                                      'Pending'
                                                                      ? Colors
                                                                      .red
                                                                      : Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              userController
                                                                      .allData[0]
                                                                      .reports![
                                                                          index]
                                                                      .optIns[
                                                                  'dinner'],
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: userController.allData[0].reports![index].optIns[
                                                                  'dinner'] ==
                                                                      'Pending'
                                                                      ? Colors
                                                                      .red
                                                                      : Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  )
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container();
                                          }
                                        });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white, boxShadow: []),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  "Your Daily Status",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Monthly Consumption Status",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isMonthly = !isMonthly;
                            });
                          },
                          child: Icon(
                            isMonthly
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                        ),
                      ]),
                      width: MediaQuery.of(context).size.width,
                      height: isMonthly ? 140 : 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Pending Food Orders",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ),
                          isMonthly
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(80)),
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                color: Colors.grey[800],
                                                child: Center(
                                                    child: Text(
                                                  userController
                                                      .totalBreakfastPending
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                          ),
                                          Text(
                                            "Breakfast",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 0.5,
                                      color: Colors.blueGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(80)),
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                color: Colors.grey[800],
                                                child: Center(
                                                    child: Text(
                                                  userController
                                                      .totalLunchPending
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                          ),
                                          Text(
                                            "Lunch",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 0.5,
                                      color: Colors.blueGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(80)),
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                color: Colors.grey[800],
                                                child: Center(
                                                    child: Text(
                                                  userController
                                                      .totalDinnerPending
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ))),
                                          ),
                                          Text(
                                            "Dinner",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                            ),
                          ]),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Fine Amount :      ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                                Text(
                                  userController.fine.toString() + "/-",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                ),
                              ]))),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
