import 'package:flutter/material.dart';
import 'package:lawyer/screens/others/pdf_preview.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import '../../models/notorization.dart';
import '../../models/request_model.dart';
import '../../models/supporting.dart';
import '../../models/vehicle.dart';
import '../../pdf/car_sale_pdf.dart';
import '../../provider/car_lease.dart';

class CarSale extends StatefulWidget {
  const CarSale({super.key});

  @override
  State<CarSale> createState() => _CarSaleState();
}

class _CarSaleState extends State<CarSale> {
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
                inlineField(controller: dayCtrl, font: bodyFont, width: 120),
                Text(" corresponding to ", style: TextStyle(fontSize: bodyFont)),
                inlineField(controller: dateCtrl, font: bodyFont, width: 150),
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
                inlineField(font: bodyFont, width: 100, controller: carNumberCtrl),
                Text("& Ownership ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: ownerCtrl),
                Text(" Country ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: countryCtrl),
                Text(" make ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 80, controller: makeCtrl),
                Text(" model ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 80, controller: modelCtrl),
                Text(" engine number ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 120, controller: engineCtrl),
                Text(" chassis number ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 120, controller: chassisCtrl),
              ],
            ),
            SizedBox(height: 20,),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Center(child: Text("(Article 2)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                Text("This sale was made for a price of ",
                    style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 100, controller: priceCtrl),
                Text(" only ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 220, controller: priceTextCtrl),
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
                inlineField(font: bodyFont, width: 200, controller: firstPartyNameCtrl),
              ],
            ),

            Wrap(
              children: [
                Text("Second party: ", style: TextStyle(fontSize: bodyFont)),
                inlineField(font: bodyFont, width: 200, controller: secondPartyNameCtrl),
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
                inlineField(font: font, width: 220, controller: fullName),
              ],
            ),
            Wrap(
              children: [
                Text("Nationality:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: nationality),
              ],
            ),
            Wrap(
              children: [
                Text("Address:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: address),
              ],
            ),
            Wrap(
              children: [
                Text("District:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: department),
              ],
            ),
            Wrap(
              children: [
                Text("Governorate:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: governorate),
              ],
            ),
            Wrap(
              children: [
                Text("Family Card No:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: familyId),
              ],
            ),
            Wrap(
              children: [
                Text("Civil Registry:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 180, controller: civilRegistry),
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
                inlineField(font: font, width: 100, controller: officeCtrl),
              ],
            ),
            Wrap(
              children: [
                Text("Certification Report No:- ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: recordNumberCtrl),
              ],
            ),
            Wrap(
              children: [
                Text(" of the year  ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: yearCtrl),
              ],
            ),
            Wrap(
              children: [
                Text("It is on the day of ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: dayOfMonthCtrl),
              ],
            ),
            Wrap(
              children: [
                Text("corresponding to ", style: TextStyle(fontSize: font)),
                inlineField(font: font, width: 100, controller: dateFormattedCtrl),
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
                inlineField(font: font, width: 100, controller: notaryNameCtrl),
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
  }) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: font),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
  String toIsoDate(String inputDate) {
    // input example: 19/12/2025
    final parts = inputDate.split('/');

    if (parts.length != 3) return inputDate;

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];

    return "$year-$month-$day"; // ISO format
  }


}
