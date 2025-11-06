import 'package:flutter/material.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';
import 'package:url_launcher/url_launcher.dart';

void showTransactionDialog(
  BuildContext context,
  ValueNotifier<String> status,
  ValueNotifier<String?> solscanUrl, {
  VoidCallback? onRetry
}) {
  Navigator.maybePop(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: 320.0,
          width: 240.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: ValueListenableBuilder<String>(
              valueListenable: status,
              builder: (context, title, _) {
                final bool isRejected = title.toLowerCase().contains('reject');
                final bool isSuccess = title.toLowerCase().contains('success');

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isRejected)
                      const Icon(Icons.clear_rounded,
                          color: Colors.red, size: 48.0)
                    else if (isSuccess)
                      const Icon(Icons.check_circle_rounded,
                          color: Colors.green, size: 48.0)
                    else
                      CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
                        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                        strokeWidth: 2.0,
                      ),
                    const SizedBox(height: 24.0),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    if (isSuccess) ...[
                      CustomInkWell(
                        onTap: () async {
                          if (await canLaunchUrl(Uri.parse(solscanUrl.value!))) {
                            await launchUrl(Uri.parse(solscanUrl.value!), mode: LaunchMode.externalApplication);
                          }
                        },
                        child: const Text(
                          'View on Solscan',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      CustomInkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 35.0,
                          width: 100.0,
                          alignment: Alignment.center,
                          child: Text('Close', style: TextStyle(color: Colors.grey.shade700)),
                        ),
                      ),
                    ],
                    if (isRejected) ...[
                      CustomInkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 35.0,
                          width: 100.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          child: Text('Close', style: TextStyle(color: Colors.grey.shade700)),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
