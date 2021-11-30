import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GenLoginSignupHeader extends StatelessWidget {
  const GenLoginSignupHeader({required this.headerName});

  final String headerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Text(
          headerName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30.0),
        ),
        const SizedBox(height: 10.0),
        Image.asset(
          'images/logo.png',
          scale: 3.0,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

// Widget imageProfile(BuildContext context) {
//
//   return Column(
//     children: [
//       const SizedBox(height: 50.0),
//       Text(
//         'Sign Up',
//         style: const TextStyle(
//             fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30.0),
//       ),
//       const SizedBox(height: 10.0),
//       Stack(
//         children: [
//           CircleAvatar(
//             radius: 80.0,
//             backgroundImage: AssetImage('images/logo2png.png'),
//             backgroundColor: Colors.transparent,
//           ),
//           Positioned(
//             child: InkWell(
//               onTap: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: ((builder) => bottomSheet(context)),
//                 );
//               },
//               child: Icon(Icons.camera_alt),
//             ),
//             top: 30.0,
//             right: 30.0,
//           ),
//         ],
//       ),
//       const SizedBox(height: 10.0),
//     ],
//   );
// }

// Widget bottomSheet(BuildContext context) {
//   return Container(
//     height: 100.0,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 20,
//     ),
//     child: Column(
//       children: [
//         Text(
//           "Choose Profile Picture",
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(children: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.camera),
//             onPressed: () {
//               takePhoto(ImageSource.camera);
//             },
//             label: Text("Camera"),
//           ),
//           FlatButton.icon(
//             icon: Icon(Icons.image),
//             onPressed: () {},
//             label: Text("Gallery"),
//           ),
//         ])
//       ],
//     ),
//   );
// }

// void takePhoto(ImageSource source) async {
//   final pickedFile = await picker.getImage(
//     source: source,
//   );
//   setState(() {
//     _imageFile = pickedFile;
//   });
// }
