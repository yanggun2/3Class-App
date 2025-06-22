import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PortfolioCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PortfolioCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (data['thumbnailBase64'] != null && data['thumbnailBase64'] != '') {
      try {
        imageBytes = base64Decode(data['thumbnailBase64']);
      } catch (e) {
        imageBytes = null;
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageBytes != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  imageBytes,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 12),
            Text(
              data['name'] ?? '이름 없음',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(data['description'] ?? '설명이 없습니다.'),
            const SizedBox(height: 8),
            Text('기술 스택: ${data['stack'] ?? '없음'}'),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SelectableText(
                    data['link'] ?? '',
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: '링크 복사',
                  onPressed: () {
                    final link = data['link'] ?? '';
                    if (link.isNotEmpty) {
                      Clipboard.setData(ClipboardData(text: link));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('링크가 복사되었습니다!')),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.qr_code, size: 20),
                  tooltip: 'QR 코드 보기',
                  onPressed: () {
                    final link = data['link'] ?? '';
                    if (link.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: const Color(0xFF2A2A2A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: 260, // ✅ 박스 너비 줄이기 (QR + 여백 정도만)
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'QR 코드',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                  const SizedBox(height: 20),
                                  QrImageView(
                                    data: link,
                                    version: QrVersions.auto,
                                    size: 200.0,
                                    foregroundColor: Colors.white,
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('닫기', style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
