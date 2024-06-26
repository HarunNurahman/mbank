import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture == null
                    ? const AssetImage('assets/images/img_profile.png')
                    : NetworkImage(user.profilePicture!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '@${user.username}',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
