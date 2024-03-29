import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/custom-textfield.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // Text form field
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username
                const CustomTextField(text: 'Username'),
                const SizedBox(height: 16),
                // Full Name
                const CustomTextField(text: 'Full Name'),
                const SizedBox(height: 16),
                // Email
                const CustomTextField(
                  text: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password
                const CustomTextField(text: 'Password', obscureText: true),
                const SizedBox(height: 30),
                // Update button
                CustomButton(
                  text: 'Update Profile',
                  ontap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/edit-profile-success',
                    (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
