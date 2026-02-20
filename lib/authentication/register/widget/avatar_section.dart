import 'package:flutter/material.dart';

class AvatarSection extends StatefulWidget {
  const AvatarSection({super.key});

  @override
  State<AvatarSection> createState() => _AvatarSectionState();
}

class _AvatarSectionState extends State<AvatarSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAvatar("assets/images/gamer (1) (2).png", 60),
            _buildAvatar("assets/images/gamer (1) (1).png", 100),
            _buildAvatar("assets/images/gamer (1) (3).png", 60),
          ],
        ),

        const SizedBox(height: 10),

        const Text(
          "Avatar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath, double size) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: AssetImage(imagePath),
    );
  }
}