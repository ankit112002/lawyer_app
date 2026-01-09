import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/api_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void showTopMessage(BuildContext context,
      String message, {
        bool success = false,
      }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) =>
          Positioned(
            top: MediaQuery
                .of(context)
                .padding
                .top + 12,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: success ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 2), () {
      entry.remove();
    });
  }

  late double width;
  late double height;

  // Controllers
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController jobController;
  late TextEditingController emailController;
  List<String> jobTypeList = [
    'Individual',
    'Trainee Lawyer',
    'Licensed Lawyer',
    'Student',
    'Legal Advisor',
    'Academic',
    'Human Resources Officer',
    'Other'
  ];

  String? selectedJobType;


  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    jobController = TextEditingController();
    emailController = TextEditingController();

    // Fetch profile data after widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<ApiProvider>(context, listen: false);
      await provider.getProfileData();

      if (provider.data != null) {
        firstNameController.text = provider.data?["firstName"] ?? "";
        lastNameController.text = provider.data?["lastName"] ?? "";
        emailController.text = provider.data?["email"] ?? "";

        final apiUserType = provider.data?["userType"];

        if (jobTypeList.contains(apiUserType)) {
          selectedJobType = apiUserType; // ✅ signup wali value
        } else {
          selectedJobType = jobTypeList.first;
        }

        setState(() {});
      }
    });
  }

  double w(double value) => width * (value / 390);

  double h(double value) => height * (value / 844);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          if (provider.isProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: h(40)),

                  // Back Button + Title
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, size: w(22),
                            color: Colors.black),
                      ),
                      SizedBox(width: w(8)),
                      Text(
                        "Back",
                        style: TextStyle(fontSize: w(20),
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: w(22),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: h(30)),

                  _label("First Name"),
                  _inputField(firstNameController),
                  SizedBox(height: h(16)),

                  _label("Last Name"),
                  _inputField(lastNameController),
                  SizedBox(height: h(16)),

                  _label("Job title / Specialization"),
                  SizedBox(height: h(6)),

              DropdownButtonFormField<String>(
                value: selectedJobType,
                alignment: Alignment.centerRight, // 👈 dropdown button align
                items: jobTypeList.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    alignment: Alignment.centerRight,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedJobType = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
                  SizedBox(height: h(16)),



                  _label("Your email address"),
                  _inputField(emailController, enabled: false),
                  SizedBox(height: h(40)),

                  // Buttons Row
                 // Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //  children: [
                      // SizedBox(
                      //   height: h(54),
                      //   width: width * 0.40,
                      //   child: OutlinedButton(
                      //     style: OutlinedButton.styleFrom(
                      //       side: const BorderSide(color: Color(0XFFEB4335)),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)),
                      //     ),
                      //     onPressed: () {
                      //       if (provider.data != null) {
                      //         firstNameController.text =
                      //             provider.data?["firstName"] ?? "";
                      //         lastNameController.text =
                      //             provider.data?["lastName"] ?? "";
                      //
                      //         selectedJobType = provider.data?["userType"];
                      //         setState(() {});
                      //       }
                      //     },
                      //
                      //     child: Text(
                      //       "Cancel",
                      //       style: TextStyle(color: Colors.black,
                      //           fontSize: w(18),
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
                       // begin: Alignment.topLeft,
                      //  end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: h(54),
                      // width: width * 0.40,
                      width: double.infinity ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () async {
                          if (provider.accessToken.isEmpty) {
                            showTopMessage(
                              context,
                              "Access token missing! Please login again.",
                              success: false,
                            );
                            return;
                          }

                          await provider.updateProfile(
                            firstNameController.text,
                            lastNameController.text,
                            selectedJobType ?? '',
                          );

                          showTopMessage(
                            context,
                            "Profile updated successfully!",
                            success: true,
                          );
                        },

                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white,
                              fontSize: w(18),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h(20)),

                  // Delete Button
                  SizedBox(
                    height: h(54),
                    width: width,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0XFFEB4335)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius
                            .circular(10)),
                      ),
                      onPressed: () {
                        // Add delete account functionality
                      },
                      child: Text(
                        "Delete account",
                        style: TextStyle(color: Colors.red,
                            fontSize: w(18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(height: h(40)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _label(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: w(16),
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }


  Widget _inputField(TextEditingController controller, {bool enabled = true}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      textAlign: TextAlign.right, // 👈 important
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
