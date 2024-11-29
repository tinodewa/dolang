import 'package:dolang/shared/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class DialogWebviewComponent extends StatelessWidget {
  const DialogWebviewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("In Frame Webview".tr),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyle.blackMedium),
                ),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse('https://venturo.id'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
