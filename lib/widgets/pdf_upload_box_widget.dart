import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PdfUploadBoxWidget extends StatefulWidget {
  final String label;

  const PdfUploadBoxWidget({required this.label, super.key});

  @override
  State<PdfUploadBoxWidget> createState() => _PdfUploadBoxWidgetState();
}

class _PdfUploadBoxWidgetState extends State<PdfUploadBoxWidget> {
  File? _pdfFile;
  String? _fileName;

  Future<void> _pickPdf() async {
    try {
      // Accessing the platform-specific picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _pdfFile = File(result.files.single.path!);
          _fileName = result.files.single.name;
        });
      }
    } catch (e) {
      debugPrint("Error picking PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickPdf,
          child: Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _pdfFile == null ? Colors.grey[400]! : const Color(0xFF008080),
                width: 1.5,
              ),
            ),
            child: _pdfFile == null
                ? const _UploadPlaceholder()
                : _FilePreview(fileName: _fileName),
          ),
        ),
        if (_pdfFile != null)
          TextButton.icon(
            onPressed: () => setState(() {
              _pdfFile = null;
              _fileName = null;
            }),
            icon: const Icon(Icons.delete_outline, size: 18),
            label: const Text("Remove PDF"),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
      ],
    );
  }
}

// Helper widget for the empty state
class _UploadPlaceholder extends StatelessWidget {
  const _UploadPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 85),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text("Upload a file", style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(height: 1),
            Text("or drag and drop", style: TextStyle(color: Color(0xFF8F8D8D), fontSize: 12)),
            SizedBox(height: 1),
            Text("* only PDF file", style: TextStyle(color: Color(0xFF8F8D8D), fontSize: 7)),
          ],
        ),
      ],
    );
  }
}

// Helper widget for the selected state
class _FilePreview extends StatelessWidget {
  final String? fileName;
  const _FilePreview({this.fileName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.insert_drive_file, size: 50, color: Color(0xFF008080)),
          const SizedBox(height: 12),
          Text(
            fileName ?? "Document.pdf",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}