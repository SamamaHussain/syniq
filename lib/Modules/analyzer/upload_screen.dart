// lib/modules/upload/view/screens/upload_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syniq/core/themes/app_colors.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _selectedFile;
  String? _fileName;
  bool _isUploading = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
    }
  }

  Future<void> _processResume() async {
    if (_selectedFile == null) return;

    setState(() {
      _isUploading = true;
    });

    // Simulate processing
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isUploading = false;
    });

    // Navigate to parsing result
    // Navigator.push(context, MaterialPageRoute(builder: (_) => ParsingResultScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Upload Resume',
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Upload & Parse',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Upload your resume for automatic text extraction',
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.6),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              // Upload Area
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBg,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Upload Icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accent1,
                        ),
                        child: Icon(
                          Icons.upload_file,
                          color: AppColors.black,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Title
                      Text(
                        _selectedFile == null
                            ? 'Choose a file'
                            : 'Ready to process',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        _selectedFile == null
                            ? 'PDF, DOC, DOCX, TXT • Max 10MB'
                            : 'Tap process to extract text',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // File Preview
                      if (_selectedFile != null)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.description, color: AppColors.black),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _fileName ?? 'Resume',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${(_selectedFile!.lengthSync() / 1024).toStringAsFixed(1)} KB',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.5),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.black.withOpacity(0.5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedFile = null;
                                    _fileName = null;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                      const Spacer(),

                      // Buttons
                      if (_selectedFile == null)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _pickFile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent1,
                              foregroundColor: AppColors.black,
                              minimumSize: const Size(double.infinity, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Choose File',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      else
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _isUploading ? null : _processResume,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accent1,
                                  foregroundColor: AppColors.black,
                                  minimumSize: const Size(double.infinity, 56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: _isUploading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          color: AppColors.black,
                                        ),
                                      )
                                    : const Text(
                                        'Process Resume',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: _isUploading ? null : _pickFile,
                              child: Text(
                                'Choose different file',
                                style: TextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Features
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What we do:',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem('Auto text extraction'),
                  _buildFeatureItem('Section detection'),
                  _buildFeatureItem('Format preservation'),
                  _buildFeatureItem('Ready for AI analysis'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: AppColors.accent1,
              shape: BoxShape.circle,
            ),
          ),
          Text(text, style: TextStyle(color: AppColors.black.withOpacity(0.7))),
        ],
      ),
    );
  }
}
