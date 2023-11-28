import 'package:flutter/material.dart';

import 'View/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}









// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as img;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   File? _image;
//   List<Function>? filters;
//   img.Image? _filteredImage;
//   int _currentFilterIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     filters = [
//       img.grayscale,
//       img.invert,
//       (img.Image image) => img.gaussianBlur(image, 10), // Apply Gaussian blur with radius 10
//       (img.Image image) => img.adjustColor(image, brightness: 50), // Increase brightness by 50
//     ];
//   }

//   Future<void> pickImage(ImageSource source) async {
//     try {
//       final pickedImage = await ImagePicker().pickImage(source: source);
//       if (pickedImage == null) return;

//       final imageFile = File(pickedImage.path);

//       setState(() {
//         _image = imageFile;
//         _filteredImage = null;
//         _currentFilterIndex = 0;
//       });
//     } catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   void applyFilter() {
//     if (_image == null || filters == null || _currentFilterIndex >= filters!.length) {
//       return;
//     }

//     final bytes = _image!.readAsBytesSync();
//     final image = img.decodeImage(Uint8List.fromList(bytes));

//     final filterFunction = filters![_currentFilterIndex];
//     final filteredImage = filterFunction(image!);

//     setState(() {
//       _filteredImage = filteredImage;
//       _currentFilterIndex++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _filteredImage != null
//             ? Image.memory(Uint8List.fromList(img.encodePng(_filteredImage!)))
//             : _image != null
//                 ? Image.file(_image!)
//                 : const Text(
//                     'No image selected.',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton.extended(
//             onPressed: () {
//               pickImage(ImageSource.gallery);
//             },
//             label: const Text('Gallery'),
//             icon: const Icon(Icons.photo_library),
//             backgroundColor: Colors.blue,
//             heroTag: null,
//           ),
//           const SizedBox(width: 16),
//           FloatingActionButton.extended(
//             onPressed: () {
//               pickImage(ImageSource.camera);
//             },
//             label: const Text('Camera'),
//             icon: const Icon(Icons.camera_alt),
//             backgroundColor: Colors.blue,
//             heroTag: null,
//           ),
//           const SizedBox(width: 16),
//           FloatingActionButton.extended(
//             onPressed: applyFilter,
//             label: const Text('Apply Filter'),
//             icon: const Icon(Icons.blur_on),
//             backgroundColor: Colors.blue,
//             heroTag: null,
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
