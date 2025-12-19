import 'package:flutter/material.dart';
import 'package:lawyer/provider/api_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double width;
  late double height;

  // Helper for responsive design
  double w(double value) => width * (value / 390);
  double h(double value) => height * (value / 844);

  // Controllers for TextFields
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController jobController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    // ✅ CONTROLLERS INITIALIZE
    firstNameController = TextEditingController();
    lastNameController  = TextEditingController();
    jobController       = TextEditingController();
    emailController     = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ApiProvider>(context, listen: false);

      if (provider.data != null) {
        firstNameController.text = provider.data?["firstName"] ?? "";
        lastNameController.text  = provider.data?["lastName"] ?? "";
        jobController.text       = provider.data?["userType"] ?? "";
        emailController.text     = provider.data?["email"] ?? "";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    final provider = Provider.of<ApiProvider>(context);

    return Scaffold(
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(40)),

              // Back Button + Title
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, size: w(22), color: Colors.black),
                  ),
                  SizedBox(width: w(8)),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: w(20), fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: w(22), fontWeight: FontWeight.bold),
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

              _label("Job title/Specialization"),
              _inputField(jobController),
              SizedBox(height: h(16)),

              _label("Your email address"),
              _inputField(emailController),
              SizedBox(height: h(16)),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: h(54),
                    width: width * 0.40,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0XFFEB4335)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black, fontSize: w(18), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // Gradient Save Button
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF655F2E), Color(0xFFD3A62A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: h(54),
                      width: width * 0.40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          final provider = Provider.of<ApiProvider>(context, listen: false);

                          if (provider.accessToken.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Access token missing! Please login again.")),
                            );
                            return;
                          }

                          provider.updateProfile(
                            firstNameController.text,
                            lastNameController.text,
                            jobController.text,
                          ).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Profile updated successfully!")),
                            );
                          });

                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white, fontSize: w(18), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h(40)),

              // Delete Button
              SizedBox(
                height: h(54),
                width: width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0XFFEB4335)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Delete account",
                    style: TextStyle(color: Colors.red, fontSize: w(18), fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: h(40)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: w(16), fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _inputField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelStyle: TextStyle(fontSize: w(15), color: const Color(0XFFB3BBC0)),
      ),
    );
  }
}
