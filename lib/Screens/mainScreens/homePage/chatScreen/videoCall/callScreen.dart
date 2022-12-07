// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:buzzex/Screens/Authentication/controllers/videocallController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({super.key});

//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   vcController vc = Get.put(vcController());
//   @override
//   void initState() {
//     super.initState();
//     vc.initAgora();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => true,
//       child: Scaffold(
//         body: SafeArea(
//             child: Stack(
//           children: [
//             AgoraVideoViewer(
//               client: vc.client,
//               layoutType: Layout.floating,
//             ),
//             AgoraVideoButtons(
//               client: vc.client,
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
