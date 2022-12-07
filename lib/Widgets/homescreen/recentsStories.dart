// import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:status_view/status_view.dart';

// class RecentChats extends StatelessWidget {
//   const RecentChats({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(
//         left: 2,
//       ),
//       child: StreamBuilder(
//           stream: status,
//           builder: (context, snapshot) {
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data?.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return snapshot.hasData
//                     ? Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: StatusView(
//                           radius: 60,
//                           numberOfStatus: 2,
//                           seenColor: Colors.grey,
//                           unSeenColor: Colors.green,
//                           centerImageUrl:
//                               '${snapshot.data?.docs[index]['image']}',
//                         ),
//                       )
//                     : Container(
//                         child: Text('no status        '),
//                       );
//               },
//             );
//           }),
//     );
//   }
// }
