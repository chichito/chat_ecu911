import 'package:chat_ecu911/ui/core/ui/colors.dart';
import 'package:chat_ecu911/ui/core/ui/widgets/chat_avatar.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.mySelf,
    required this.userName,
    this.photoUrl,
    required this.msg,
    required this.date,
  });
  final bool mySelf;
  final String userName;
  final String? photoUrl;
  final String msg;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final color = mySelf ? AppColors.primary : AppColors.messageGrey;
    final colorText = mySelf ? Colors.white : Colors.black;
    final textTheme = Theme.of(context).textTheme;
    // final dateFormat = DateFormat.jm().format(date);
    const dateFormat = '1:46';

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mySelf
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!mySelf)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ChatAvatar(name: userName, photoUrl: photoUrl),
            ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!mySelf)
                          Text(userName, style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: mySelf
                                  ? const Radius.circular(16)
                                  : Radius.zero,
                              topRight: mySelf
                                  ? Radius.zero
                                  : const Radius.circular(16),
                              bottomLeft: const Radius.circular(16),
                              bottomRight: const Radius.circular(16),
                            ),
                            color: color,
                          ),
                          child: Text(msg, style: TextStyle(color: colorText)),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  dateFormat,
                  style: TextStyle(color: AppColors.darkGrey),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
