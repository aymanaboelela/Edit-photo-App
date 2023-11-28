import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img; // import the 'image' package

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  img.Image? _filteredImage;

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;

      final imageFile = File(pickedImage.path);

      setState(() {
        _image = imageFile;
        _filteredImage =
            null; // Reset filtered image when a new image is selected
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void applyFilter(FilterType filterType) {
    if (_image == null) return;

    // Read the image file
    final bytes = _image!.readAsBytesSync();
    final image = img.decodeImage(Uint8List.fromList(bytes));

    // Apply the desired filter based on the selected type
    img.Image filteredImage;
    switch (filterType) {
      case FilterType.Blur:
        filteredImage = img.gaussianBlur(image!, 10); // Apply Gaussian Blur
        break;
      case FilterType.Sharpening:
        filteredImage =
            _applySharpeningFilter(image!); // Apply Sharpening Filter
        break;
      case FilterType.Smoothing:
        filteredImage = img.gaussianBlur(image!, 5); // Apply Smoothing Filter
        break;
      case FilterType.BlackAndWhite:
        filteredImage =
            img.grayscale(image!); // Apply Black-and-White (Grayscale) Filter
        break;
    }

    setState(() {
      _filteredImage = filteredImage;
    });
  }

  // Function to apply a Sharpening Filter
  img.Image _applySharpeningFilter(img.Image image) {
    var kernel = [
      [-1, -1, -1],
      [-1, 9, -1],
      [-1, -1, -1]
    ];

    return convolve(image, kernel);
  }

  img.Image convolve(img.Image image, List<List<int>> kernel) {
    // ... (Same convolution function as previously defined)
    // Implement the convolution logic here as previously explained
    // ...
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _filteredImage != null
            ? Image.memory(Uint8List.fromList(img.encodePng(_filteredImage!)))
            : _image != null
                ? Image.file(_image!)
                : const Text(
                    'No image selected.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              label: const Text('Gallery'),
              icon: const Icon(Icons.photo_library),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              label: const Text('Camera'),
              icon: const Icon(Icons.camera_alt),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () {
                applyFilter(FilterType.Blur); // Apply Blur Filter
              },
              label: const Text('Blur Filter'),
              icon: const Icon(Icons.blur_on),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () {
                applyFilter(FilterType.Sharpening); // Apply Sharpening Filter
              },
              label: const Text('Sharpening Filter'),
              icon: const Icon(Icons.filter),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () {
                applyFilter(FilterType.Smoothing); // Apply Smoothing Filter
              },
              label: const Text('Smoothing Filter'),
              icon: const Icon(Icons.blur_circular),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
            const SizedBox(width: 16),
            FloatingActionButton.extended(
              onPressed: () {
                applyFilter(FilterType
                    .BlackAndWhite); // Apply Black-and-White (Grayscale) Filter
              },
              label: const Text('Black & White Filter'),
              icon: const Icon(Icons.auto_awesome),
              backgroundColor: Colors.blue,
              heroTag: null,
            ),
          ],
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// Enum to define different filter types
enum FilterType {
  Blur,
  Sharpening,
  Smoothing,
  BlackAndWhite,
}
