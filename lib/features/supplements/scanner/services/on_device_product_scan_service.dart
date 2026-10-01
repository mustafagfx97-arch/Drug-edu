import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../domain/product_scanner_models.dart';

class OnDeviceProductScanService {
  const OnDeviceProductScanService();

  Future<OnDeviceImageScan> scanImage(String filePath) async {
    final image = InputImage.fromFilePath(filePath);
    final textRecognizer = TextRecognizer(
      script: TextRecognitionScript.latin,
    );
    final barcodeScanner = BarcodeScanner(
      formats: const [BarcodeFormat.all],
    );

    try {
      final textFuture = textRecognizer.processImage(image);
      final barcodeFuture = barcodeScanner.processImage(image);
      final recognizedText = await textFuture;
      final barcodes = await barcodeFuture;

      return OnDeviceImageScan(
        recognizedText: recognizedText.text,
        barcodes: barcodes
            .map((item) => item.rawValue ?? item.displayValue ?? '')
            .where((item) => item.trim().isNotEmpty)
            .toSet()
            .toList(growable: false),
      );
    } finally {
      await textRecognizer.close();
      await barcodeScanner.close();
    }
  }
}
