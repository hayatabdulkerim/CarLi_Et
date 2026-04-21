import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadBoxWidget extends StatefulWidget {
  final String label;

  const ImageUploadBoxWidget({
    required this.label,
    super.key
  });

  @override
  State<ImageUploadBoxWidget> createState() => _ImageUploadBoxWidgetState();
}

class _ImageUploadBoxWidgetState extends State<ImageUploadBoxWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            widget.label,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[400]!),
            ),

            child: _image == null
              ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image_outlined, size: 50, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                      "Upload Image",
                    style: TextStyle(
                      color: Colors.grey[600]
                    ),
                  )
                ],
              ),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          ),
        ),
        if (_image != null)
          TextButton(
              onPressed: () => setState(() => _image = null),
              child: const Text("Remove Image", style: TextStyle(color: Colors.red)),
          ),
      ],
    );
  }
}
