import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class PortfolioFormScreen extends StatefulWidget {
  final Map<String, dynamic>? existingData;
  final String? docId;

  const PortfolioFormScreen({super.key, this.existingData, this.docId});

  @override
  State<PortfolioFormScreen> createState() => _PortfolioFormScreenState();
}

class _PortfolioFormScreenState extends State<PortfolioFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _stackController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  String? _base64Image;
  Uint8List? _selectedBytes;

  @override
  void initState() {
    super.initState();
    if (widget.existingData != null) {
      _nameController.text = widget.existingData!['name'] ?? '';
      _descriptionController.text = widget.existingData!['description'] ?? '';
      _stackController.text = widget.existingData!['stack'] ?? '';
      _linkController.text = widget.existingData!['link'] ?? '';
      _base64Image = widget.existingData!['thumbnailBase64'];
    }
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);

    if (result != null && result.files.single.bytes != null) {
      final originalBytes = result.files.single.bytes!;
      final decoded = img.decodeImage(originalBytes);
      if (decoded != null) {
        final resized = img.copyResize(decoded, width: 600);
        final compressed = img.encodeJpg(resized, quality: 70);
        final base64Str = base64Encode(compressed);

        if (base64Str.length > 1000000) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('이미지가 너무 큽니다 (1MB 이하로 제한).')),
          );
          return;
        }

        setState(() {
          _selectedBytes = Uint8List.fromList(compressed);
          _base64Image = base64Str;
        });
      }
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final data = {
      'name': _nameController.text.trim(),
      'description': _descriptionController.text.trim(),
      'stack': _stackController.text.trim(),
      'link': _linkController.text.trim(),
      'thumbnailBase64': _base64Image ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    };

    final collection = FirebaseFirestore.instance.collection('portfolios');

    if (widget.docId != null) {
      await collection.doc(widget.docId).update(data);
    } else {
      await collection.add(data);
    }

    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.docId != null ? '포트폴리오 수정' : '새 포트폴리오 등록'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (_base64Image != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Image.memory(
                    base64Decode(_base64Image!),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              TextButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text('썸네일 이미지 선택'),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: '이름'),
                validator: (value) => value == null || value.isEmpty ? '이름을 입력하세요' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: '설명'),
                validator: (value) => value == null || value.isEmpty ? '설명을 입력하세요' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _stackController,
                decoration: const InputDecoration(labelText: '기술 스택'),
                validator: (value) => value == null || value.isEmpty ? '기술 스택을 입력하세요' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _linkController,
                decoration: const InputDecoration(labelText: '링크'),
                validator: (value) => value == null || value.isEmpty ? '링크를 입력하세요' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: Text(widget.docId != null ? '수정하기' : '등록하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
