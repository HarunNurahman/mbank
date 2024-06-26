import 'package:bank_sha/bloc/auth/auth_bloc.dart';
import 'package:bank_sha/pages/widgets/custom-button.dart';
import 'package:bank_sha/pages/widgets/profile-menu_item.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.errorMessage);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Profile picture
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: state.user.profilePicture == null
                                  ? AssetImage('assets/images/img_friend-4.png')
                                  : NetworkImage(state.user.profilePicture!)
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Verified status
                          child: state.user.verified == 1
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: greenColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // User full name
                      Text(
                        state.user.name!.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Menu item
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_edit-profile.png',
                        title: 'Edit My Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/edit-profile');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_pin.png',
                        title: 'My PIN',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/edit-pin');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_wallet.png',
                        title: 'Wallet Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_my-reward.png',
                        title: 'My Rewards',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_help-center.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icons/ic_sign-out.png',
                        title: 'Sign Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthSignOut());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Report button
                Center(
                  child: CustomTextButton(
                    text: 'Report a Problem',
                    ontap: () {},
                  ),
                ),
                const SizedBox(height: 30),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
