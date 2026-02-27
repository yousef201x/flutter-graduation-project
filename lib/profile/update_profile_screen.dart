import 'package:flutter/material.dart';
import 'package:movies_app_project/services/AuthService.dart';
import 'package:movies_app_project/home/widgets/custom_elevated_button.dart';
import 'package:movies_app_project/home/widgets/custom_text_field.dart';
import 'package:movies_app_project/utils/app_colors.dart';
import 'package:movies_app_project/utils/app_routes.dart';
import 'package:movies_app_project/utils/app_styles.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  int selectedIndex = 8;
  bool showAvatars = false;
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final AuthService _authService = AuthService();

  final List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
    "assets/images/main_avatar.png",
  ];

  @override
  void initState() {
    super.initState();
    nameController.text = _authService.currentUser?.displayName ?? "";

    String? currentPhoto = _authService.currentUser?.photoURL;
    if (currentPhoto != null && avatars.contains(currentPhoto)) {
      selectedIndex = avatars.indexOf(currentPhoto);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.yellowColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text("Update Profile", style: AppStyles.regular16yellowRoboto),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.yellowColor))
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () => setState(() => showAvatars = !showAvatars),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: const Color(0xFF282828),
                  backgroundImage: AssetImage(avatars[selectedIndex]),
                ),
              ),
              if (showAvatars) ...[
                SizedBox(height: height * 0.03),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(color: const Color(0xFF282828), borderRadius: BorderRadius.circular(25)),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: avatars.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 15, crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() {
                          selectedIndex = index;
                          showAvatars = false;
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: isSelected ? AppColors.yellowColor : Colors.transparent, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(avatars[index], fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
              SizedBox(height: height * 0.04),
              CustomTextField(
                controller: nameController,
                hintText: "Full Name",
                hintStyle: AppStyles.regular16white,
                icon: const Icon(Icons.person, color: AppColors.whiteColor),
                color: AppColors.whiteColor,
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                controller: phoneController,
                hintText: "Phone Number",
                hintStyle: AppStyles.regular16white,
                icon: const Icon(Icons.call, color: AppColors.whiteColor),
                color: AppColors.whiteColor,
              ),
              SizedBox(height: height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: _handleResetPassword,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text("Reset Password", style: AppStyles.regular16white),
                ),
              ),
              SizedBox(height: height * 0.23),
              CustomElevatedButton(
                text: "Update Data",
                style: AppStyles.regular20blackRoboto,
                color: AppColors.yellowColor,
                onPressed: _handleUpdate,
              ),
              const SizedBox(height: 15),
              CustomElevatedButton(
                text: "Delete Account",
                style: AppStyles.regular20whiteRoboto,
                color: AppColors.redColor,
                onPressed: _handleDelete,
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  void _handleUpdate() async {
    String newName = nameController.text.trim();

    setState(() => isLoading = true);

    final res = await _authService.updateProfile(
      name: newName,
      photoUrl: avatars[selectedIndex],
    );

    setState(() => isLoading = false);

    if (res == "success") {
      _showSnack("Profile updated successfully!");
    } else {
      _showSnack(res!);
    }
  }

  void _handleDelete() async {
    setState(() => isLoading = true);
    final res = await _authService.deleteAccount();
    setState(() => isLoading = false);
    if (res == "success") {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.loginRouteName,
            (route) => false,
      );
    } else if (res == "re-authenticate") {
      _showSnack("Please login again to confirm deletion");
    } else {
      _showSnack(res!);
    }
  }

  void _handleResetPassword() async {
    String? email = _authService.currentUser?.email;
    if (email != null) {
      await _authService.resetPassword(email);
      _showSnack("Reset link sent to $email");
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.greyColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}