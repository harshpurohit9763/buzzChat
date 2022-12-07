// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:status_view/status_view.dart';

// class AddStories extends StatelessWidget {
//   AddStories({super.key, required this.userImage});
//   String userImage;

//   @override
//   Widget build(BuildContext context) {
//     RxBool isStatusEmpty = false.obs;
//     return Container(
//       child: userImage.isEmpty
//           ? Container()
//           : Padding(
//               padding: EdgeInsets.all(8.0),
//               child: StatusView(
//                   radius: 60,
//                   numberOfStatus: 5,
//                   seenColor: Colors.grey,
//                   unSeenColor: Colors.green,
//                   centerImageUrl: userImage),
//             ),
//     );
//   }
// }
