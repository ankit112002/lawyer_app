import 'package:flutter/material.dart';
import 'package:lawyer/pdf/pdf_preview.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import '../models/notorization.dart';
import '../models/request_model.dart';
import '../models/supporting.dart';
import '../models/vehicle.dart';
import 'car_sale_pdf.dart';
import '../provider/car_lease.dart';

class CarSale extends StatefulWidget {
  const CarSale({super.key});

  @override
  State<CarSale> createState() => _CarSaleState();
}

class _CarSaleState extends State<CarSale> {
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


  final FocusNode officeFocus = FocusNode();
  final FocusNode recordNumberFocus = FocusNode();
  final FocusNode yearFocus = FocusNode();
  final FocusNode dayOfMonthFocus = FocusNode();
  final FocusNode dateFormattedFocus = FocusNode();
  final FocusNode notaryNameFocus = FocusNode();


  final FocusNode plateNumberFocus = FocusNode();
  final FocusNode ownershipTypeFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();
  final FocusNode brandFocus = FocusNode();
  final FocusNode modelFocus = FocusNode();
  final FocusNode engineNumberFocus = FocusNode();
  final FocusNode chassisNumberFocus = FocusNode();
  final FocusNode cylindersFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();
  final FocusNode priceWordsFocus = FocusNode();
  final FocusNode firstPartySignFocus = FocusNode();
  final FocusNode secondPartySignFocus = FocusNode();


  // General
  final dayCtrl = TextEditingController();
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
  final officeCtrl=TextEditingController();
  final recordNumberCtrl=TextEditingController();
  final yearCtrl=TextEditingController();
  final dayOfMonthCtrl=TextEditingController();
  final dateFormattedCtrl=TextEditingController();
  final notaryNameCtrl=TextEditingController();

  // Article 1
  final carNumberCtrl = TextEditingController();
  final ownerCtrl=TextEditingController();
  final countryCtrl=TextEditingController();
  final makeCtrl = TextEditingController();
  final modelCtrl = TextEditingController();
  final engineCtrl = TextEditingController();
  final chassisCtrl = TextEditingController();

  // Article 2
  final priceCtrl = TextEditingController();
  final priceTextCtrl = TextEditingController();

  // Party
  final firstPartyNameCtrl = TextEditingController();
  final secondPartyNameCtrl = TextEditingController();

  @override
  void dispose() {
    dayCtrl.dispose();
    dateCtrl.dispose();
    carNumberCtrl.dispose();
    makeCtrl.dispose();
    modelCtrl.dispose();
    engineCtrl.dispose();
    chassisCtrl.dispose();
    priceCtrl.dispose();
    priceTextCtrl.dispose();
    firstPartyNameCtrl.dispose();
    secondPartyNameCtrl.dispose();
     officeCtrl.dispose();
     recordNumberCtrl.dispose();
     yearCtrl.dispose();
     dayOfMonthCtrl.dispose();;
     dateFormattedCtrl.dispose();
     notaryNameCtrl.dispose();
     firstFullNameCtrl.dispose();
     firstNationalityCtrl.dispose();
     firstAddressCtrl.dispose();
     firstDepartmentCtrl.dispose();
     firstGovernorateCtrl.dispose();
     firstFamilyIdCtrl.dispose();
     firstCivilRegistryCtrl.dispose();
     secondFullNameCtrl.dispose();
     secondNationalityCtrl.dispose();
     secondAddressCtrl.dispose();
     secondDepartmentCtrl.dispose();
     secondGovernorateCtrl.dispose();
     secondFamilyIdCtrl.dispose();
     secondCivilRegistryCtrl.dispose();

    dateFocus.dispose();

    firstFullNameFocus.dispose();
    firstNationalityFocus.dispose();
    firstAddressFocus.dispose();
    firstDepartmentFocus.dispose();
    firstGovernorateFocus.dispose();
    firstFamilyIdFocus.dispose();
    firstCivilRegistryFocus.dispose();

    secondFullNameFocus.dispose();
    secondNationalityFocus.dispose();
    secondAddressFocus.dispose();
    secondDepartmentFocus.dispose();
    secondGovernorateFocus.dispose();
    secondFamilyIdFocus.dispose();
    secondCivilRegistryFocus.dispose();

    officeFocus.dispose();
    recordNumberFocus.dispose();
    yearFocus.dispose();
    dayOfMonthFocus.dispose();
    dateFormattedFocus.dispose();
    notaryNameFocus.dispose();

    plateNumberFocus.dispose();
    ownershipTypeFocus.dispose();
    countryFocus.dispose();
    brandFocus.dispose();
    modelFocus.dispose();
    engineNumberFocus.dispose();
    chassisNumberFocus.dispose();
    priceFocus.dispose();
    priceWordsFocus.dispose();
    firstPartySignFocus.dispose();
    secondPartySignFocus.dispose();




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
        centerTitle: true,
        title: Text(
          "Car sale contract",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _text(
              "Article 10 of the Traffic Law and Article\n227 of its Implementing Regulations",
              bodyFont,
            ),
            const SizedBox(height: 16),

            Wrap(
              children: [
                Text("On the day of ", style: TextStyle(fontSize: bodyFont)),
                // inlineField(controller: dayCtrl, font: bodyFont, width: 120),
                Text(" corresponding to  ", style: TextStyle(fontSize: bodyFont)),
                inlineField(controller: dateCtrl, font: bodyFont, width: 100,hint: "DD/MM/YY",focusNode: dateFocus),
              ],
            ),



            _text(
              "This contract was drawn up\nbetween:",
              bodyFont,
            ),

            const SizedBox(height: 20),

            _partyCard(
              title: "( First Party )",
              font: bodyFont,
              fullName: firstFullNameCtrl,
              nationality: firstNationalityCtrl,
              address: firstAddressCtrl,
              department: firstDepartmentCtrl,
              governorate: firstGovernorateCtrl,
              familyId: firstFamilyIdCtrl,
              civilRegistry: firstCivilRegistryCtrl,
              fullNameFocus: firstFullNameFocus,
              nationalityFocus: firstNationalityFocus,
              addressFocus: firstAddressFocus,
              departmentFocus: firstDepartmentFocus,
              governorateFocus: firstGovernorateFocus,
              familyIdFocus: firstFamilyIdFocus,
              civilRegistryFocus: firstCivilRegistryFocus,
            ),


            const SizedBox(height: 20),

            _partyCard(
              title: "( Second Party )",
              font: bodyFont,
              fullName: secondFullNameCtrl,
              nationality: secondNationalityCtrl,
              address: secondAddressCtrl,
              department: secondDepartmentCtrl,
              governorate: secondGovernorateCtrl,
              familyId: secondFamilyIdCtrl,
              civilRegistry: secondCivilRegistryCtrl,
              fullNameFocus: secondFullNameFocus,
              nationalityFocus: secondNationalityFocus,
              addressFocus: secondAddressFocus,
              departmentFocus: secondDepartmentFocus,
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

            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Center(child: Text("(Article 1)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                Text("The first party sold to the second party the car number ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: carNumberCtrl,hint: "Car Number",focusNode: plateNumberFocus),
                Text("& Ownership ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: ownerCtrl,hint: "Owner",focusNode: ownershipTypeFocus),
                Text(" Country ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: countryCtrl,hint: "Country",focusNode: countryFocus),
                Text(" make ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 80, controller: makeCtrl,hint: "Brand",focusNode: brandFocus),
                Text(" model ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 80, controller: modelCtrl,hint: "registration year",focusNode: modelFocus),
                Text(" engine number ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 120, controller: engineCtrl,hint: "Engine No",focusNode: engineNumberFocus),
                Text(" chassis number ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 120, controller: chassisCtrl,hint: "Chassis No",focusNode: chassisNumberFocus),
              ],
            ),
            SizedBox(height: 20,),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Center(child: Text("(Article 2)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                Text("This sale was made for a price of ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: priceCtrl,hint: "Selling Amount",focusNode: priceFocus),
                Text(" only ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 220, controller: priceTextCtrl,hint: "amount in text",focusNode: priceWordsFocus),
                Text("which has been fully paid by the members of this contract and signing it constitutes a receipt thereof.",style: TextStyle(fontSize: bodyFont))
              ],
            ),

            _article(
              "(Article 3)",
              "The first party undertakes to deliver the car to the second party immediately upon signing this contract, provided that the first party pays any fines incurred up to the day before delivery.)",
              bodyFont,
            ),

            _article(
              "(Article 4)",
              "The second party acknowledges that he has thoroughly inspected the car, eliminating any ambiguity, and has examined and tested it before contracting, and has agreed to deal with it on this basis and has no recourse against the first party in this regard.)",
              bodyFont,
            ),

            _article(
              "(Article 5)",
              "The second party becomes civilly and criminally responsible for the car as soon as he takes possession of it.)",
              bodyFont,
            ),

            _article(
              "(Article 6)",
              "The first party acknowledges that he is the owner of the car and that he has the right to dispose of it without any restrictions, and he guarantees against any legal claims issued to the second party by third parties, provided that he notifies him of this in a timely manner.)",
              bodyFont,
            ),

            _article(
              "(Article 7)",
              "This contract is deposited after the signatures contained in the vehicle file have been authenticated with the traffic department that issues the operating license, and each party has the right to obtain a copy of it.)",
              bodyFont,
            ),

            const SizedBox(height: 20),

            _text("Signatures", bodyFont, bold: true),
            Wrap(
              children: [
                Text("First party: ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 200, controller: firstPartyNameCtrl,hint: "First Party Signature",focusNode: firstPartySignFocus),
              ],
            ),

            Wrap(
              children: [
                Text("Second party: ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 200, controller: secondPartyNameCtrl,hint: "Second Party Signature",focusNode: secondPartySignFocus),
              ],
            ),


            const SizedBox(height: 30),

            _certificationCard(bodyFont),

            const SizedBox(height: 20),

            _comments(bodyFont),
            SizedBox(height: 30,),
        Consumer<CarLeasePdfProvider>(
          builder: (context, provider, _) {
            return ElevatedButton(
              onPressed: provider.isLoading
                  ? null
                  : () async {
                if (!validateForm(context)) return; // ❌ yahin ruk jao

                final request = CarLeasePdfRequest(
                  date: toIsoDate(dateCtrl.text), // ✅ FIXED

                  firstParty: Party(
                    fullName: firstFullNameCtrl.text,
                    nationality: firstNationalityCtrl.text,
                    address: firstAddressCtrl.text,
                    department: firstDepartmentCtrl.text,
                    governorate: firstGovernorateCtrl.text,
                    familyId: firstFamilyIdCtrl.text,
                    civilRegistry: firstCivilRegistryCtrl.text,
                  ),

                  secondParty: Party(
                    fullName: secondFullNameCtrl.text,
                    nationality: secondNationalityCtrl.text,
                    address: secondAddressCtrl.text,
                    department: secondDepartmentCtrl.text,
                    governorate: secondGovernorateCtrl.text,
                    familyId: secondFamilyIdCtrl.text,
                    civilRegistry: secondCivilRegistryCtrl.text,
                  ),

                  vehicle: Vehicle(
                    plateNumber: carNumberCtrl.text,
                    ownershipType: ownerCtrl.text,
                    country: countryCtrl.text,
                    brand: makeCtrl.text,
                    model: modelCtrl.text,
                    engineNumber: engineCtrl.text,
                    chassisNumber: chassisCtrl.text,
                    cylinders: "4",
                  ),

                  price: priceCtrl.text,
                  priceWords: priceTextCtrl.text,

                  notarization: Notarization(
                    office: officeCtrl.text,
                    recordNumber: recordNumberCtrl.text,
                    year: yearCtrl.text,
                    dayOfMonth: dayOfMonthCtrl.text,
                    // 🔥 FIX HERE
                    dateFormatted: toIsoDate(dateFormattedCtrl.text),
                    notaryName: notaryNameCtrl.text,
                    firstSigner: PartySigner(
                      name: firstPartyNameCtrl.text,
                      familyId: firstFamilyIdCtrl.text,
                      civilRegistry: firstCivilRegistryCtrl.text,
                    ),
                    secondSigner: PartySigner(
                      name: secondPartyNameCtrl.text,
                      familyId: secondFamilyIdCtrl.text,
                      civilRegistry: secondCivilRegistryCtrl.text,
                    ),
                  ),
                );

                final response =
                await provider.generatePdf(request);

                if (!context.mounted) return;

                if (response.success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PdfPreviewScreen(
                        pdfBytes: response.data,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(response.message)),
                  );
                }
              },
              child: provider.isLoading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text("Download PDF"),
            );
          },
        )



        ],
        ),
      ),
    );
  }

  // ---------------- Widgets ----------------
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
    required TextEditingController nationality,
    required TextEditingController address,
    required TextEditingController department,
    required TextEditingController governorate,
    required TextEditingController familyId,
    required TextEditingController civilRegistry,
    required FocusNode fullNameFocus,
    required FocusNode nationalityFocus,
    required FocusNode addressFocus,
    required FocusNode departmentFocus,
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
                Text("Nationality:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: nationality,hint: "Nationality",focusNode: nationalityFocus),
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
                Text("District:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: department,hint:"District",focusNode: departmentFocus),
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


  Widget _article(String title, String body, double font) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _text(title, font, bold: true),
          const SizedBox(height: 8),
          _text(body, font),
        ],
      ),
    );
  }

  Widget _certificationCard(double font) {
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffFBF6EA),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            _text("Certification Report", font, bold: true),
            _text("Ministry of Justice – Real Estate Registration and Documentation Authority", font),
            Wrap(
              children: [
                Text("Notary Office:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: officeCtrl,hint: "office",focusNode: officeFocus),
              ],
            ),
            Wrap(
              children: [
                Text("Certification Report No:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: recordNumberCtrl,hint: "recordNumber",focusNode: recordNumberFocus),
              ],
            ),
            Wrap(
              children: [
                Text(" of the year  ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: yearCtrl,hint: "year",focusNode: yearFocus),
              ],
            ),
            Wrap(
              children: [
                Text("It is on the day of ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: dayOfMonthCtrl,hint: "dayOfMonth",focusNode: dayOfMonthFocus),
              ],
            ),
            Wrap(
              children: [
                Text("corresponding to ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: dateFormattedCtrl,hint: "DD/MM/YY",focusNode: dateFormattedFocus),
                // Text("/", style: TextStyle(fontSize: font)),
                // inlineField(font: font, width: 30),
                // Text("/", style: TextStyle(fontSize: font)),
                // inlineField(font: font, width: 30),
              ],
            ),
            _text(
              "Before us, the undersigned notary public at the aforementioned office, this contract has been signed by both parties.",
              font,
            ),
            Wrap(
              children: [
                Text("The notary ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: notaryNameCtrl,hint: "notaryName",focusNode: notaryNameFocus),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _comments(double font) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _text("Comments:", font, bold: true),
        const SizedBox(height: 8),
        _text(
          "• If the seller refuses to certify his signature, the buyer may file a lawsuit to validate and enforce the contract.",
          font,
        ),
        _text(
          "• Once it becomes final, ownership can be transferred accordingly.",
          font,
        ),
      ],
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


    if (firstNationalityCtrl.text.trim().isEmpty) {
      firstNationalityFocus.requestFocus();
      showError(context, "first party Nationality required");
      return false;
    }
    if (firstAddressCtrl.text.trim().isEmpty) {
      firstAddressFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "First party Address required");
      return false;
    }
    if (firstDepartmentCtrl.text.trim().isEmpty) {
      firstGovernorateFocus.requestFocus(); // ❌ wrong
      showError(context, "first party department required");
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

    if (secondNationalityCtrl.text.trim().isEmpty) {
      secondNationalityFocus.requestFocus();
      showError(context, "Second Party Nationality required");
      return false;
    }
    if (secondAddressCtrl.text.trim().isEmpty) {
      secondAddressFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "second party Address required");
      return false;
    }

    if (secondDepartmentCtrl.text.trim().isEmpty) {
      secondDepartmentFocus.requestFocus();
      showError(context, "second party district required");
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
      plateNumberFocus.requestFocus();
      showError(context, "Car number required");
      return false;
    }

    if (ownerCtrl.text.trim().isEmpty) {
      ownershipTypeFocus.requestFocus();
      showError(context, "Ownership required");
      return false;
    }
    if (countryCtrl.text.trim().isEmpty) {
      countryFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "country required");
      return false;
    }

    if (makeCtrl.text.trim().isEmpty) {
      brandFocus.requestFocus();
      showError(context, "Brand required");
      return false;
    }

    if (modelCtrl.text.trim().isEmpty) {
      modelFocus.requestFocus();
      showError(context, "model required");
      return false;
    }
    if (engineCtrl.text.trim().isEmpty) {
      engineNumberFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "engineNumber required");
      return false;
    }

    if (chassisCtrl.text.trim().isEmpty) {
      chassisNumberFocus.requestFocus();
      showError(context, "chassisNumber required");
      return false;
    }

    if (officeCtrl.text.trim().isEmpty) {
      officeFocus.requestFocus();
      showError(context, "office Name required");
      return false;
    }
    if (recordNumberCtrl.text.trim().isEmpty) {
      recordNumberFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "recordNumber required");
      return false;
    }

    if (yearCtrl.text.trim().isEmpty) {
      yearFocus.requestFocus();
      showError(context, "year required");
      return false;
    }

    if (dayOfMonthCtrl.text.trim().isEmpty) {
      dayOfMonthFocus.requestFocus();
      showError(context, "dayOfMonth required");
      return false;
    }
    if (dateFormattedCtrl.text.trim().isEmpty) {
      dateFormattedFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "dateFormatted required");
      return false;
    }

    if (notaryNameCtrl.text.trim().isEmpty) {
      notaryNameFocus.requestFocus();
      showError(context, "notaryName required");
      return false;
    }

    if (priceCtrl.text.trim().isEmpty) {
      priceFocus.requestFocus();
      showError(context, "Price required");
      return false;
    }
    if (priceTextCtrl.text.trim().isEmpty) {
      priceWordsFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "priceWords required");
      return false;
    }

    if (firstPartyNameCtrl.text.trim().isEmpty) {
      firstPartySignFocus.requestFocus();
      showError(context, "firstPartySign required");
      return false;
    }

    if (secondPartyNameCtrl.text.trim().isEmpty) {
      secondPartySignFocus.requestFocus();
      showError(context, "secondPartySign required");
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
