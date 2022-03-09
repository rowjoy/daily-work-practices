import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class TextToImage extends GetxController {
  TextDetector textDetector = GoogleMlKit.vision.textDetector();
  var scanText = ''.obs;
  var hasImage = false;

  Future getText(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          scanText.value = scanText.value + '  ' + element.text;
        }
        scanText.value = scanText + '\n';
      }
    }
    print(scanText.value);
  }
}
