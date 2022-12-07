import 'package:buzzex/Screens/Authentication/controllers/Controllers.dart';
import 'package:buzzex/Widgets/global/bIgText.dart';
import 'package:buzzex/Widgets/global/smallText.dart';
import 'package:buzzex/Widgets/profileDashboard/detailscard.dart';
import 'package:buzzex/Widgets/profileDashboard/settingsTools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Authentication/controllers/fetchController.dart';

class UserPannel extends StatelessWidget {
  UserPannel({super.key});
  AuthenticationController authCtrl = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    RxBool IsOnline = true.obs;

    return Scaffold(
      body: SizedBox(
        child: StreamBuilder(
          stream: dataOfUser,
          builder: (context, snapshot) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.white,
              child: SafeArea(
                child: snapshot.hasData
                    ? Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                      snapshot.data?['profile'] ??
                                          'asset/userdemoPics/1.png',
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              BigText(
                                text: snapshot.data?['name'],
                                size: 22,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[100]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SmallText(
                                    text: '${snapshot.data?['dob']}',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8.0, right: 8.0),
                                        child: Text(
                                          'Bio: ',
                                          style: GoogleFonts.openSansCondensed(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 12.0),
                                        child: BigText(
                                            text: snapshot.data?['bio']),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Container(
                                //   width: Get.width,
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey[200],
                                //   ),
                                //   child: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.start,
                                //     children: [
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             top: 8.0, left: 8.0, right: 8.0),
                                //         child: Text(
                                //           'Skills: ',
                                //           style: GoogleFonts.openSansCondensed(
                                //               fontSize: 16,
                                //               fontWeight: FontWeight.w300),
                                //         ),
                                //       ),
                                //       const Divider(
                                //         thickness: 1,
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             left: 12.0, right: 12.0),
                                //         child: SizedBox(
                                //           height: 100,
                                //           child: ListView.builder(
                                //             itemCount:
                                //                 snapshot.data?['skills'].length,
                                //             itemBuilder: (BuildContext context,
                                //                 int index) {
                                //               return BigText(
                                //                   text: snapshot.data?[
                                //                               'skills'] ==
                                //                           null
                                //                       ? ''
                                //                       : "○ ${snapshot.data?['skills'][index]}");
                                //             },
                                //           ),
                                //         ),
                                //       ),
                                //       const SizedBox(
                                //         height: 20,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //TODO
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue[700],
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
