import 'package:flutter/material.dart';
import 'package:lawyer/pdf/pdf_preview.dart';
import 'package:provider/provider.dart';

import '../models/crane.dart';
import '../models/moveble_lease.dart';
import '../models/moveble_lease_second_party.dart';
import '../models/moveble_party.dart';
import '../models/payment.dart';
import '../provider/MovablePdfProvider.dart';

class MovableLease extends StatefulWidget {
  const MovableLease({super.key});

  @override
  State<MovableLease> createState() => _MovableLeaseState();
}

class _MovableLeaseState extends State<MovableLease> {
  final FocusNode governFocus = FocusNode();
  final FocusNode locationFocus = FocusNode();
  final FocusNode carNumberFocus = FocusNode();



  final FocusNode dateFocus = FocusNode();
  final FocusNode firstFullNameFocus = FocusNode();
  final FocusNode firstNationalityFocus = FocusNode();
  final FocusNode firstAddressFocus = FocusNode();
  final FocusNode firstDepartmentFocus = FocusNode();
  final FocusNode firstGovernorateFocus = FocusNode();
  final FocusNode firstFamilyIdFocus = FocusNode();
  final FocusNode firstCivilRegistryFocus = FocusNode();


  final FocusNode secondFullNameFocus = FocusNode();
  final FocusNode secondNationalityFocus = FocusNode();
  final FocusNode secondAddressFocus = FocusNode();
  final FocusNode secondDepartmentFocus = FocusNode();
  final FocusNode secondGovernorateFocus = FocusNode();
  final FocusNode secondFamilyIdFocus = FocusNode();
  final FocusNode secondCivilRegistryFocus = FocusNode();

  final FocusNode penaltyPerHourFocus = FocusNode();
  final FocusNode dailyMaxHoursFocus = FocusNode();
  final FocusNode yearFocus = FocusNode();
  final FocusNode dailyRentFocus = FocusNode();
  final FocusNode hourlyRateFocus = FocusNode();
  final FocusNode makeFocus = FocusNode();





  // General
  final districtCtrl = TextEditingController();

  // First Party
  final governCtrl = TextEditingController();

  final locationCtrl = TextEditingController();

// Second Party

  final dateCtrl = TextEditingController();

  // First Party
  final firstFullNameCtrl = TextEditingController();
  final firstNationalityCtrl = TextEditingController();
  final firstAddressCtrl = TextEditingController();
  final firstDepartmentCtrl = TextEditingController();
  final firstGovernorateCtrl = TextEditingController();
  final firstFamilyIdCtrl = TextEditingController();
  final firstCivilRegistryCtrl = TextEditingController();

// Second Party
  final secondFullNameCtrl = TextEditingController();
  final secondNationalityCtrl = TextEditingController();
  final secondAddressCtrl = TextEditingController();
  final secondDepartmentCtrl = TextEditingController();
  final secondGovernorateCtrl = TextEditingController();
  final secondFamilyIdCtrl = TextEditingController();
  final secondCivilRegistryCtrl = TextEditingController();



  //notorization

  final hourlyRateCtrl=TextEditingController();
  final yearCtrl=TextEditingController();
  final dailyRentCtrl=TextEditingController();
  final dailyMaxHoursCtrl=TextEditingController();
  final penaltyPerHourCtrl=TextEditingController();

  // Article 1
  final carNumberCtrl = TextEditingController();

  final makeCtrl = TextEditingController();




  // Party
  final firstPartyNameCtrl = TextEditingController();
  final secondPartyNameCtrl = TextEditingController();

  @override
  void dispose() {
    districtCtrl.dispose();
    carNumberCtrl.dispose();
    makeCtrl.dispose();

    firstPartyNameCtrl.dispose();
    secondPartyNameCtrl.dispose();

    hourlyRateCtrl.dispose();
    yearCtrl.dispose();
    penaltyPerHourCtrl.dispose();;
    dailyMaxHoursCtrl.dispose();
    dailyRentCtrl.dispose();
    governCtrl.dispose();

    locationCtrl.dispose();

    dateCtrl.dispose();
    secondAddressCtrl.dispose();
    secondDepartmentCtrl.dispose();

    //
    // dateFocus.dispose();
    //
    // firstFullNameFocus.dispose();
    // firstNationalityFocus.dispose();

    locationFocus.dispose();
    firstFullNameFocus.dispose();
    firstAddressFocus.dispose();
    firstGovernorateFocus.dispose();
    firstFamilyIdFocus.dispose();
    firstCivilRegistryFocus.dispose();

    secondFullNameFocus.dispose();
    secondAddressFocus.dispose();
    secondGovernorateFocus.dispose();
    secondFamilyIdFocus.dispose();
    secondCivilRegistryFocus.dispose();


    carNumberFocus.dispose();
    makeFocus.dispose();


    dateFocus.dispose();
    secondDepartmentFocus.dispose();
    secondGovernorateFocus.dispose();
    secondFamilyIdFocus.dispose();
    secondCivilRegistryFocus.dispose();

    dailyMaxHoursFocus.dispose();
    dailyRentFocus.dispose();
    yearFocus.dispose();
    penaltyPerHourFocus.dispose();
    hourlyRateFocus.dispose();





    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Responsive font sizes
    final titleFont = width * 0.065;
    final bodyFont = width * 0.045;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movable lease agreement",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              children: [
                Text("This contract was drawn up on ", style: TextStyle(fontSize: bodyFont)),
                Text("the day of ", style: TextStyle(fontSize: bodyFont)),
                inlineField(controller: dateCtrl, font: bodyFont, width: 100,hint: "DD/MM/YY",focusNode: dateFocus),
                Text("  Between.", style: TextStyle(fontSize: bodyFont)),
              ],
            ),
            SizedBox(height: 20,),
            _partyCard(
              title: "( First Party )",
              font: bodyFont,
              fullName: firstFullNameCtrl,
              address: firstAddressCtrl,
              governorate: firstGovernorateCtrl,
              familyId: firstFamilyIdCtrl,
              civilRegistry: firstCivilRegistryCtrl,
              fullNameFocus: firstFullNameFocus,
              addressFocus: firstAddressFocus,
              governorateFocus: firstGovernorateFocus,
              familyIdFocus: firstFamilyIdFocus,
              civilRegistryFocus: firstCivilRegistryFocus,
            ),


            const SizedBox(height: 20),

            _partyCard(
              title: "( Second Party )",
              font: bodyFont,
              fullName: secondFullNameCtrl,
              address: secondAddressCtrl,
              governorate: secondGovernorateCtrl,
              familyId: secondFamilyIdCtrl,
              civilRegistry: secondCivilRegistryCtrl,
              fullNameFocus: secondFullNameFocus,
              addressFocus: secondAddressFocus,
              governorateFocus: secondGovernorateFocus,
              familyIdFocus: secondFamilyIdFocus,
              civilRegistryFocus: secondCivilRegistryFocus,
            ),

            const SizedBox(height: 20),
            _text(
              "Both parties acknowledge their legal capacity to enter into this contract and agree to the following:",
              bodyFont,
              bold: true,
            ),

            const SizedBox(height: 20),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: bodyFont, color: Colors.black),
          children: [
            const TextSpan(text: "(Article 1) The first party rented out "),
            const TextSpan(text: "Crane No "),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: carNumberCtrl,
                font: bodyFont,
                width: 110,
                hint: "Crane No",
                focusNode: carNumberFocus,
              ),
            ),
            const TextSpan(text: " Brand "),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: makeCtrl,
                font: bodyFont,
                width: 100,
                hint: "  Brand",
                focusNode: makeFocus,
              ),
            ),
            const TextSpan(
              text:
              " to the second party to carry out the work of lifting equipment owned by him and located at ",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: locationCtrl,
                font: bodyFont,
                width: 100,
                hint: "Location",
                focusNode: locationFocus,
              ),
            ),
            const TextSpan(
              text: " to load it onto vehicles to transport it to another location.",
            ),
          ],
        ),
      ),
            Divider(height: 60,),

      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: bodyFont, color: Colors.black),
          children: [
            const TextSpan(
              text:
              "Clause Two) The crane shall be operated by the workers of the first party, provided that the second party bears the cost of this at a rate of ",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: hourlyRateCtrl,
                font: bodyFont,
                width: 120,
                hint: "hourlyRate",
                focusNode: hourlyRateFocus,
              ),
            ),
            const TextSpan(
              text:
              " pounds per hour, which the first party shall distribute among them on its own authority.",
            ),
          ],
        ),
      ),

     Divider(height: 60,),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: bodyFont, color: Colors.black),
          children: [
            const TextSpan(
              text: "(Clause Three) This lease was made for a fee of ",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: dailyRentCtrl,
                font: bodyFont,
                width: 120,
                hint: "dailyRent",
                focusNode: dailyRentFocus,
              ),
            ),
            const TextSpan(text: " only "),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: dailyMaxHoursCtrl,
                font: bodyFont,
                width: 120,
                hint: "dailyMaxHours",
                focusNode: dailyMaxHoursFocus,
              ),
            ),
            const TextSpan(
              text:
              " per day, provided that the work does not exceed six hours. If the work on the last day is less than this rate, the first party is entitled to a full day’s wage.",
            ),
          ],
        ),
      ),

      Divider(height: 60,),
            _text("(Article Four) The first party undertakes to carry out maintenance work, provided that it is carried out after the period scheduled for operation. If it is carried out during that period, the second party shall complete the daily operating hours after carrying out the maintenance work.", bodyFont),
            Divider(height: 60,),
            _text("(Article Five) The second party shall not interfere in the operational work carried out by the workers of the first party. If he has an objection, he shall address it to the first party, otherwise he shall be responsible for them as an employer is responsible for the work of his employees.", bodyFont),
            Divider(height: 60,),
            _text("(Article Six) The second party may not move the crane to a location other than the one inspected by the first party regarding the equipment that was agreed to be lifted.", bodyFont),
            Divider(height: 60,),
            _text("(Article Seven) In the event that the crane is not suitable for lifting the equipment subject to this contract, the first party shall be obligated to bring another one on the next day immediately, otherwise the second party shall do so at the expense of the first party.", bodyFont),
            Divider(height: 60,),
            _text("The following item can be replaced with this item:", bodyFont,bold: true),
            Divider(height: 60,),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: bodyFont, color: Colors.black),
          children: [
            const TextSpan(
              text:
              "If the crane is not suitable for lifting the equipment covered by this contract, the contract shall be considered terminated automatically without the need for notice, warning or any other procedure, and the first party shall be entitled to the sum of ",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: penaltyPerHourCtrl,
                font: bodyFont,
                width: 120,
                hint: "penaltyPerHour",
                focusNode: penaltyPerHourFocus,
              ),
            ),
            const TextSpan(
              text: " for each hour or fraction of an hour of operation.",
            ),
          ],
        ),
      ),

            Divider(height: 60,),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: bodyFont, color: Colors.black),
          children: [
            const TextSpan(
              text: "(Article 8) The courts of ",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: inlineField(
                controller: governCtrl,
                font: bodyFont,
                width: 120,
                hint: "courts",
                focusNode: governFocus,
              ),
            ),
            const TextSpan(
              text:
              " shall have jurisdiction over any disputes that may arise in connection with the execution of this contract, and the address of each party indicated in B shall be considered a chosen domicile in this regard.",
            ),
          ],
        ),
      ),

      Divider(height: 60,),
            _text("(Article Nine) This contract was drawn up in two copies, one copy for each party.", bodyFont,bold: true),
            Divider(height: 60,),
           Column(
             children: [
               _text("(Party One)(Party Two)", bodyFont),
               _text("List of Equipment", bodyFont),
               _text("Agreed Upon To be Removed", bodyFont),
               _text("Specify type and Quantity for operational purposes", bodyFont),
               _text("(Party One)(Party Two)", bodyFont),

             ],
           ),
            const SizedBox(height: 30),

            Consumer<MovablePdfProvider>(
              builder: (context, provider, _) {
                return Column(
                  children: [
                    if (provider.errorMessage != null)
                      Text(
                        provider.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                          // 🔥 STEP 1: Validate form
                          if (!validateForm(context)) return;

                          final request = CraneContractModel(
                            date: toIsoDate(dateCtrl.text),

                            firstParty: Party(
                              name: firstFullNameCtrl.text,
                              address: firstAddressCtrl.text,
                              governorate: firstGovernorateCtrl.text,
                              familyCardNumber: firstFamilyIdCtrl.text,
                              civilRegistry: firstCivilRegistryCtrl.text,
                            ),

                            secondParty: SecondParty(
                              name: secondFullNameCtrl.text,
                              department: secondAddressCtrl.text,
                              jobPlace: secondGovernorateCtrl.text,
                              familyCardNumber: secondFamilyIdCtrl.text,
                              civilRegistry: secondCivilRegistryCtrl.text,
                            ),

                            crane: Crane(
                              number: carNumberCtrl.text,
                              brand: makeCtrl.text,
                              location: locationCtrl.text,
                            ),

                            payment: Payment(
                              hourlyRate: hourlyRateCtrl.text,
                              dailyRent: dailyRentCtrl.text,
                              dailyMaxHours: dailyMaxHoursCtrl.text,
                              penaltyPerHour: penaltyPerHourCtrl.text,
                            ),

                            courts: governCtrl.text,
                            equipmentList: const [],
                            useAlternativeArticle7: true,
                            additionalNotes: "",
                          );

                          await provider.generatePdf(request);

                          if (!context.mounted) return;

                          if (provider.pdfBytes != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PdfPreviewScreen(
                                  pdfBytes: provider.pdfBytes!,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  provider.errorMessage ?? "Failed to generate PDF",
                                ),
                              ),
                            );
                          }
                        },
                        child: provider.isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                            : const Text("Download PDF"),                      ),
                    ),

                  ],
                );
              },
            ),



          ],
        ),
      ),

    );

  }
  Widget inlineField({
    required TextEditingController controller,
    required double font,
    double width = 180,
    String? hint,
    FocusNode? focusNode,
    FocusNode? nextFocus, // ✅ ADD
  }) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        focusNode: focusNode,

        // 🔥 ADD HERE
        textInputAction:
        nextFocus != null ? TextInputAction.next : TextInputAction.done,

        onSubmitted: (_) {
          if (nextFocus != null) {
            nextFocus.requestFocus(); // 👉 next field
          } else {
            FocusScope.of(context).unfocus(); // 👉 keyboard close
          }
        },

        style: TextStyle(fontSize: font),
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
  Widget _text(String text, double size, {bool bold = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      ),
    );
  }

  Widget _partyCard({
    required String title,
    required double font,
    required TextEditingController fullName,
    required TextEditingController address,
    required TextEditingController governorate,
    required TextEditingController familyId,
    required TextEditingController civilRegistry,
    required FocusNode fullNameFocus,
    required FocusNode addressFocus,
    required FocusNode governorateFocus,
    required FocusNode familyIdFocus,
    required FocusNode civilRegistryFocus,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff655F2E), Color(0xffD3A62A)],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffFBF6EA),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _text(title, font, bold: true),

            Wrap(
              children: [
                Text("1- Mr./ ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 220, controller: fullName,hint: "Full Name",focusNode: fullNameFocus),
              ],
            ),

            Wrap(
              children: [
                Text("Address:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: address,hint: "Address",focusNode: addressFocus),
              ],
            ),

            Wrap(
              children: [
                Text("Governorate:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: governorate,hint: "Governorate",focusNode: governorateFocus),
              ],
            ),
            Wrap(
              children: [
                Text("Family Card No:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: familyId,hint: "Family Card No",focusNode: familyIdFocus),
              ],
            ),
            Wrap(
              children: [
                Text("Civil Registry:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: civilRegistry,hint: "Civil Registry",focusNode: civilRegistryFocus),
              ],
            ),


          ],
        ),
      ),
    );
  }
  String toIsoDate(String inputDate) {
    try {
      final parts = inputDate.split('/');
      if (parts.length != 3) return inputDate;

      final day = parts[0].padLeft(2, '0');
      final month = parts[1].padLeft(2, '0');
      String year = parts[2];

      if (year.length == 2) {
        year = "20$year"; // assumes 20xx
      }

      return "$year-$month-$day";
    } catch (_) {
      return inputDate;
    }
  }

  bool validateForm(BuildContext context) {

    if (dateCtrl.text.trim().isEmpty) {
      dateFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "date required");
      return false;
    }

    if (firstFullNameCtrl.text.trim().isEmpty) {
      firstFullNameFocus.requestFocus();
      showError(context, "First party Full Name required");
      return false;
    }
    if (firstAddressCtrl.text.trim().isEmpty) {
      firstAddressFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "First party Address required");
      return false;
    }
    if (firstGovernorateCtrl.text.trim().isEmpty) {
      firstGovernorateFocus.requestFocus();
      showError(context, "first party department required");
      return false;
    }

    if (firstFamilyIdCtrl.text.trim().isEmpty) {
      firstFamilyIdFocus.requestFocus();
      showError(context, "first party FamilyId required");
      return false;
    }
    if (firstCivilRegistryCtrl.text.trim().isEmpty) {
      firstCivilRegistryFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "First party CivilRegistry required");
      return false;
    }

    if (secondFullNameCtrl.text.trim().isEmpty) {
      secondFullNameFocus.requestFocus();
      showError(context, "Second Party FullName required");
      return false;
    }

    if (secondAddressCtrl.text.trim().isEmpty) {
      secondAddressFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "second party Address required");
      return false;
    }
    if (secondGovernorateCtrl.text.trim().isEmpty) {
      secondGovernorateFocus.requestFocus();
      showError(context, "second party Governorate required");
      return false;
    }
    if (secondFamilyIdCtrl.text.trim().isEmpty) {
      secondFamilyIdFocus.requestFocus();
      showError(context, "Second party FamilyId required");
      return false;
    }
    if (secondCivilRegistryCtrl.text.trim().isEmpty) {
      secondCivilRegistryFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "Second party CivilRegistry required");
      return false;
    }

    if (carNumberCtrl.text.trim().isEmpty) {
      carNumberFocus.requestFocus();
      showError(context, "Car number required");
      return false;
    }




    if (makeCtrl.text.trim().isEmpty) {
      makeFocus.requestFocus();
      showError(context, "Brand required");
      return false;
    }

    if (locationCtrl.text.trim().isEmpty) {
      locationFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "location required");
      return false;
    }



    if (hourlyRateCtrl.text.trim().isEmpty) {
      hourlyRateFocus.requestFocus();
      showError(context, "office Name required");
      return false;
    }
    if (dailyRentCtrl.text.trim().isEmpty) {
      dailyRentFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "recordNumber required");
      return false;
    }

    if (dailyMaxHoursCtrl.text.trim().isEmpty) {
      dailyMaxHoursFocus.requestFocus();
      showError(context, "year required");
      return false;
    }

    if (penaltyPerHourCtrl.text.trim().isEmpty) {
      penaltyPerHourFocus.requestFocus();
      showError(context, "dayOfMonth required");
      return false;
    }
    if (governCtrl.text.trim().isEmpty) {
      governFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "dateFormatted required");
      return false;
    }



    return true; // ✅ sab filled
  }
  void showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ),
    );
  }



}
