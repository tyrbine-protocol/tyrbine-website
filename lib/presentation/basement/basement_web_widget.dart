import 'package:flutter/material.dart';
import 'package:tyrbine_website/utils/links.dart';
import 'package:tyrbine_website/widgets/hover_text_button.dart';
import 'package:tyrbine_website/widgets/social_icon_button.dart';
import 'dart:js' as js;
import '../../build_version.dart';

class BasementWebWidget extends StatelessWidget {
  const BasementWebWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 280.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade600, 
            width: 0.15
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HoverTextButton(
            text: 'How it works?', 
            onTap: () => js.context.callMethod('open', [litepaperLink])
            ),
          const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SocialIconButton(
                    assetPath: "assets/icons/x_icon.svg",
                    url: twitterLink,
                    height: 12.0,
                  ),
                  SizedBox(width: 24.0),
                  SocialIconButton(
                    assetPath: "assets/icons/telegram_icon.svg",
                    url: telegramLink,
                    height: 12.0,
                  ),
                  SizedBox(width: 24.0),
                  SocialIconButton(
                    assetPath: "assets/icons/chat.svg",
                    url: telegramChatLink,
                    height: 12.0,
                  ),
                  SizedBox(width: 24.0),
                  SocialIconButton(
                    assetPath: "assets/icons/github_icon.svg",
                    url: githubLink,
                    height: 14.0,
                  ),
                ],
              ),
              Text("v: $buildVersion'",
                  style:
                      TextStyle(fontSize: 12.0, color: Colors.grey.shade800)),
        ],
      ),
    );
  }
}
