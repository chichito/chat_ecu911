import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key, this.photoUrl, required this.name});

  final String? photoUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return (photoUrl != null)
        ? CircleAvatar(backgroundImage: NetworkImage(photoUrl!))
        : Avatar(name: name, shape: AvatarShape.circle(20));
  }
}
