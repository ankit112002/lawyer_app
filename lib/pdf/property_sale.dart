import 'package:flutter/material.dart';
import 'package:lawyer/pdf/pdf_preview.dart';
import 'package:provider/provider.dart';

import '../models/boundary.dart';
import '../models/customfields.dart';
import '../models/dimension.dart';
import '../models/party.dart';
import '../models/property_sale_model.dart';
import '../provider/property_sale_pdf.dart';

class PropertySale extends StatefulWidget {
  const PropertySale({super.key});

  @override
  State<PropertySale> createState() => _PropertySaleState();
}

class _PropertySaleState extends State<PropertySale> {
  final FocusNode titleFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode districtFocus = FocusNode();
  final FocusNode governFocus = FocusNode();
  final FocusNode meterFocus = FocusNode();
  final FocusNode propertyFocus = FocusNode();
  final FocusNode lengthFocus = FocusNode();
  final FocusNode epropertyFocus = FocusNode();
  final FocusNode elengthFocus = FocusNode();

  final FocusNode wlengthFocus = FocusNode();
  final FocusNode dayFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();
  final FocusNode firstFullNameFocus = FocusNode();
  final FocusNode firstNationalityFocus = FocusNode();
  final FocusNode mapReferenceFocus = FocusNode();
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

  final FocusNode amountFocus = FocusNode();
  final FocusNode taxNoFocus = FocusNode();
  final FocusNode yearFocus = FocusNode();
  final FocusNode sNOFocus = FocusNode();
  final FocusNode streetNameOrPlotFocus = FocusNode();
  final FocusNode areaNumbersFocus = FocusNode();

  final FocusNode firstPartySignFocus = FocusNode();
  final FocusNode secondPartySignFocus = FocusNode();
  final FocusNode lengthNorthFocus = FocusNode();
  final FocusNode lengthSouthFocus = FocusNode();
  final FocusNode lengthEastFocus = FocusNode();
  final FocusNode lengthWestFocus = FocusNode();
  final FocusNode southOwnerFocus = FocusNode();
  final FocusNode eastOwnerFocus = FocusNode();
  final FocusNode inameFocus = FocusNode();
  final FocusNode IdNumberFocus = FocusNode();
  final FocusNode northFocus = FocusNode();
  final FocusNode southFocus = FocusNode();
  final FocusNode eastFocus = FocusNode();
  final FocusNode westFocus = FocusNode();
  final FocusNode coastalLimitFocus = FocusNode();
  final FocusNode areaDescFocus = FocusNode();
  final FocusNode areaCmFocus = FocusNode();
  final FocusNode remainingAmountFocus = FocusNode();
  final FocusNode taxFileFocus = FocusNode();
  final FocusNode taxYearFocus = FocusNode();
  final FocusNode taxOwnerFocus = FocusNode();
  final FocusNode disclosureFocus = FocusNode();








  // General
  final cityCtrl = TextEditingController();
  final districtCtrl = TextEditingController();
  final IdNumberCtrl = TextEditingController();

  // First Party
  final governCtrl = TextEditingController();
  final meterCtrl = TextEditingController();
  final propertyCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final epropertyCtrl = TextEditingController();
  final elengthCtrl = TextEditingController();
  final wlengthCtrl = TextEditingController();

  // Second Party
  final dayCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final titleCtrl = TextEditingController();

  // First Party
  final firstFullNameCtrl = TextEditingController();
  final firstNationalityCtrl = TextEditingController();
  final firstidNumberCtrl = TextEditingController();
  final firstDepartmentCtrl = TextEditingController();
  final firstGovernorateCtrl = TextEditingController();
  final firstCivilRegistryCtrl = TextEditingController();

  // Second Party
  final secondFullNameCtrl = TextEditingController();
  final secondNationalityCtrl = TextEditingController();
  final secondidNumberCtrl = TextEditingController();
  final secondDepartmentCtrl = TextEditingController();
  final secondGovernorateCtrl = TextEditingController();
  final secondCivilRegistryCtrl = TextEditingController();

  //notorization
  final amountCtrl = TextEditingController();
  final taxNoCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final inameCtrl = TextEditingController();
  final sNoCtrl = TextEditingController();
  final notaryNameCtrl = TextEditingController();
  //boundry
  final lengthNorthCtrl = TextEditingController();
  final lengthSouthCtrl = TextEditingController();
  final lengthEastCtrl = TextEditingController();
  final lengthWestCtrl = TextEditingController();
  final southOwnerCtrl = TextEditingController();
  final eastOwnerCtrl = TextEditingController();

  // Article 1
  final mapReferenceCtrl = TextEditingController();
  final areaNumbersCtrl = TextEditingController();
  final streetNameOrPlotCtrl = TextEditingController();
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
  final northCtrl = TextEditingController();
  final southCtrl = TextEditingController();
  final eastCtrl = TextEditingController();
  final westCtrl = TextEditingController();

  final coastalLimitCtrl = TextEditingController();
  final areaDescCtrl = TextEditingController();
  final areaCmCtrl = TextEditingController();
  final remainingAmountCtrl = TextEditingController();
  final taxFileCtrl = TextEditingController();
  final taxYearCtrl = TextEditingController();
  final taxOwnerCtrl = TextEditingController();
  final disclosureCtrl = TextEditingController();



  @override
  void dispose() {
    IdNumberCtrl.dispose();
    cityCtrl.dispose();
    districtCtrl.dispose();
    mapReferenceCtrl.dispose();
    areaNumbersCtrl.dispose();
    modelCtrl.dispose();
    engineCtrl.dispose();
    chassisCtrl.dispose();
    priceCtrl.dispose();
    priceTextCtrl.dispose();
    firstPartyNameCtrl.dispose();
    secondPartyNameCtrl.dispose();
    amountCtrl.dispose();
    taxNoCtrl.dispose();
    yearCtrl.dispose();
    inameCtrl.dispose();
    ;
    sNoCtrl.dispose();
    notaryNameCtrl.dispose();
    governCtrl.dispose();
    meterCtrl.dispose();
    lengthCtrl.dispose();
    propertyCtrl.dispose();
    elengthCtrl.dispose();
    epropertyCtrl.dispose();
    wlengthCtrl.dispose();
    dayCtrl.dispose();
    dateCtrl.dispose();
    secondidNumberCtrl.dispose();
    secondDepartmentCtrl.dispose();
    secondGovernorateCtrl.dispose();
    secondCivilRegistryCtrl.dispose();
    streetNameOrPlotCtrl.dispose();
    //
    eastOwnerCtrl.dispose();
    southOwnerCtrl.dispose();
    lengthEastCtrl.dispose();
    lengthSouthCtrl.dispose();
    lengthNorthCtrl.dispose();
    lengthWestCtrl.dispose();

    westCtrl.dispose();
    southCtrl.dispose();
    eastCtrl.dispose();
    northCtrl.dispose();

    // dateFocus.dispose();
    //
    // firstFullNameFocus.dispose();
    // firstNationalityFocus.dispose();
    meterFocus.dispose();
    lengthFocus.dispose();
    propertyFocus.dispose();
    elengthFocus.dispose();
    wlengthFocus.dispose();

    epropertyFocus.dispose();
    dayFocus.dispose();
    dateFocus.dispose();
    secondDepartmentFocus.dispose();
    secondGovernorateFocus.dispose();
    secondFamilyIdFocus.dispose();
    secondCivilRegistryFocus.dispose();

    amountFocus.dispose();
    taxNoFocus.dispose();
    yearFocus.dispose();
    areaNumbersFocus.dispose();
    mapReferenceFocus.dispose();
    streetNameOrPlotFocus.dispose();

    //b
    lengthEastFocus.dispose();
    lengthWestFocus.dispose();
    lengthNorthFocus.dispose();
    lengthSouthFocus.dispose();
    eastOwnerFocus.dispose();
    southOwnerFocus.dispose();
    IdNumberFocus.dispose();

    northFocus.dispose();
    southFocus.dispose();
    eastFocus.dispose();
    westFocus.dispose();
    coastalLimitFocus.dispose();
    areaDescFocus.dispose();
    areaCmFocus.dispose();
    remainingAmountFocus.dispose();
    taxFileFocus.dispose();
    taxYearFocus.dispose();
    taxOwnerFocus.dispose();
    disclosureFocus.dispose();


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
          "Final sale contract for a building property",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFont),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              children: [
                Center(
                  child: Row(
                    children: [
                      Text("Title is ", style: TextStyle(fontSize: bodyFont)),
                      inlineField(
                        controller: titleCtrl,
                        font: bodyFont,
                        width: 300,
                        hint: "   title",
                        focusNode: titleFocus,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Regarding a residential building located in the city of ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: cityCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "City Name",
                  focusNode: cityFocus,
                ),
                Text(" district of   ", style: TextStyle(fontSize: bodyFont)),
                inlineField(
                  controller: districtCtrl,
                  font: bodyFont,
                  width: 100,
                  hint: "District",
                  focusNode: districtFocus,
                ),
                Text("governorate of ", style: TextStyle(fontSize: bodyFont)),
                inlineField(
                  controller: governCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Govern",
                  focusNode: governFocus,
                ),
              ],
            ),
            SizedBox(height: 20),
            _text(
              "The transaction involves a five-story residential building where the first floor contains one residential unit and each of the other floors contains one residential unit.",
              bodyFont,
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff655F2E), Color(0xffD3A62A)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 492,
                width: 358,
                decoration: BoxDecoration(color: Color(0xffFBF6EA)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Location according to area map",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: mapReferenceCtrl,
                        decoration: InputDecoration(
                          hintText:
                              "The site is accessed according to the area map.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Flat in numbers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: areaNumbersCtrl,
                        decoration: InputDecoration(
                          hintText: "The surface is entered in numbers",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "border",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Entering the border",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Street name / King number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: streetNameOrPlotCtrl,
                        decoration: InputDecoration(
                          hintText: "Enter street name/property number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              children: [
                Text(
                  "The maritime boundary and the gate: a street with a length of ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: lengthSouthCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "in meter",
                  focusNode: lengthSouthFocus,
                ),
                Text("meters.", style: TextStyle(fontSize: bodyFont)),
                Text(
                  "The northern boundary: Property No.  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: northCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Bountry",
                  focusNode: northFocus,
                ),
                Text(
                  "owned ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: southOwnerCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: " owner",
                  focusNode: southOwnerFocus,
                ),
                Text(
                  " and its length is  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: lengthNorthCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Length",
                  focusNode: lengthNorthFocus,
                ),
                Text("meters.", style: TextStyle(fontSize: bodyFont)),
                Text(
                  "Eastern boundary: Property No.  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: eastCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Boundary",
                  focusNode: eastFocus,
                ),
                Text(
                  "owned ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: eastOwnerCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: " owner",
                  focusNode: eastOwnerFocus,
                ),
                Text(
                  " and its length is  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: lengthEastCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "lenght",
                  focusNode: lengthEastFocus,
                ),
                Text("meters.", style: TextStyle(fontSize: bodyFont)),
                Text(
                  "Western boundary: Street, length ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: lengthWestCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "length",
                  focusNode: lengthWestFocus,
                ),
                Text("meters.", style: TextStyle(fontSize: bodyFont)),
                Text(
                  " Coastal limit length: ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: coastalLimitCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "in meter",
                  focusNode: coastalLimitFocus,
                ),
                Text(" meters.", style: TextStyle(fontSize: bodyFont)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff655F2E), Color(0xffD3A62A)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 184,
                width: 358,
                decoration: BoxDecoration(color: Color(0xffFBF6EA)),
                child: Column(
                  children: [
                    // _text(
                    //   "850 square meters and seventy-five square centimeters only.",
                    //   bodyFont,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("areaDescription"),
                          TextField(
                            controller: areaDescCtrl,
                            focusNode: areaDescFocus,
                            decoration: InputDecoration(
                              hintText: "850 square meters and seventy-five square centimeters only.",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(child: Divider()),
                   // Center(child: Text("75", style: TextStyle(fontSize: 30))),
                    Center(child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("areaCm"),
                          TextField(
                            controller: areaCmCtrl,
                            focusNode: areaCmFocus,
                            decoration: InputDecoration(
                              hintText: "75",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),)

                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                Text("On the day of ", style: TextStyle(fontSize: bodyFont)),
                inlineField(
                  controller: dayCtrl,
                  font: bodyFont,
                  width: 120,
                  focusNode: dayFocus,
                  hint: "Today's Day",
                ),
                Text(
                  " corresponding to  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: dateCtrl,
                  font: bodyFont,
                  width: 100,
                  hint: "DD/MM/YY",
                  focusNode: dateFocus,
                ),
              ],
            ),
            _text("This contract was drawn up\nbetween:", bodyFont),
            firstParty(bodyFont),
            const SizedBox(height: 20),
            secondParty(bodyFont),

            const SizedBox(height: 20),

            _text(
              "Both parties acknowledge their legal capacity to enter into this contract and agree to the following:",
              bodyFont,
              bold: true,
            ),

            const SizedBox(height: 20),
            _text(
              "If any part of the price remains due after registration, the following clause shall be added",
              bodyFont,
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                Text(
                  "Clause: The first party retains the lien granted to him as the seller on the sold property as security for the payment of the remaining price, amounting to  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: remainingAmountCtrl,
                  font: bodyFont,
                  width: 120,
                  focusNode: remainingAmountFocus,
                  hint: "amount",
                ),
                Text(
                  "mmediately upon this right and until payment is made.",
                  style: TextStyle(fontSize: bodyFont),
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
              children: [
                Text(
                  "Item: The sale is located within taxpayer number ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: taxFileCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Tax No",
                  focusNode: taxFileFocus,
                ),
                Text(" for the year  ", style: TextStyle(fontSize: bodyFont)),
                inlineField(
                  controller: taxYearCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "year",
                  focusNode: taxYearFocus,
                ),
                Text("in the name of  ", style: TextStyle(fontSize: bodyFont)),
                inlineField(
                  controller: taxOwnerCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "Length",
                  focusNode: taxOwnerFocus,
                ),
                Text(
                  "according to official statement number.  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                inlineField(
                  controller: disclosureCtrl,
                  font: bodyFont,
                  width: 120,
                  hint: "statement No",
                  focusNode: disclosureFocus,
                ),
              ],
            ),
            SizedBox(height: 30),
            _text(
              "Clause: The first party acknowledges that the sold item was not subject to improvement consideration, and if it turns out to be subject to it, the first party shall be bound by it.",
              bodyFont,
            ),
            SizedBox(height: 30),
            _text(
              "Notes to consider when drafting the final contract:",
              bodyFont,
              bold: true,
            ),
            SizedBox(height: 30),
            Column(
              children: [
                _text(
                  "1.It should be noted that the preliminary contract remains valid until the final contract is signed.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "2.Then the preliminary contract loses its validity and the final contract alone becomes the law of the contracting parties.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "3.The condition stated in the final contract is the one that must be acted upon, without the condition stated in the preliminary contract.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "4.If the preliminary contract includes a condition that is not included in the final contract, then it shall not be enforced.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "5.The Court of Cassation has established that an explicit resolutory condition obliges the judge to rescind the contract if the buyer fails to pay the price.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "6.Adherence to the condition is subject to the theory of abuse of rights, and termination is prohibited if it does not cause real harm.",
                  bodyFont,
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
              children: [
                Text(
                  "First party's signature  ",
                  style: TextStyle(fontSize: bodyFont),
                ),
                //   inlineField(controller: firstPartyNameCtrl, font: bodyFont, width: 220,focusNode: firstPartySignFocus,hint: "First Party Name"),
                Text(
                  "Signature of the second party. ",
                  style: TextStyle(fontSize: bodyFont),
                ),

                //inlineField(controller: secondPartyNameCtrl, font: bodyFont, width: 220,focusNode: secondPartySignFocus,hint: "Second Party Name"),
              ],
            ),
            Consumer<PropertyPdfProvider>(
              builder: (context, provider, _) {
                return Column(
                  children: [
                    // ❌ ERROR MESSAGE
                    if (provider.error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          provider.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                                // 🔥 STEP 1: validate form
                                if (!validateForm(context)) return;

                                // 🔥 STEP 2: build model
                                final contract = PropertySaleContract(
                                  title: titleCtrl.text,
                                  city: cityCtrl.text,
                                  district: districtCtrl.text,
                                  governorate: governCtrl.text,
                                  mapReference: mapReferenceCtrl.text,
                                  areaNumbers: areaNumbersCtrl.text,
                                  boundaries: Boundaries(
                                    north: northCtrl.text,
                                    south: southCtrl.text,
                                    east: eastCtrl.text,
                                    west: westCtrl.text,
                                  ),
                                  customFields: CustomFields(
                                    southOwner: southOwnerCtrl.text,
                                    eastOwner: eastOwnerCtrl.text,
                                  ),
                                  streetNameOrPlot: streetNameOrPlotCtrl.text,
                                  dimensions: Dimensions(
                                    lengthNorth: lengthNorthCtrl.text,
                                    lengthSouth: lengthSouthCtrl.text,
                                    lengthEast: lengthEastCtrl.text,
                                    lengthWest: lengthWestCtrl.text,
                                  ),
                                  coastalLimitLength: coastalLimitCtrl.text,
                                  areaDescription: areaDescCtrl.text,
                                  areaCm: areaCmCtrl.text,
                                  day: dayCtrl.text,
                                  date: dateCtrl.text,
                                  partyOne: Party(
                                    name: firstFullNameCtrl.text,
                                    nationality: firstNationalityCtrl.text,
                                    idNumber: firstidNumberCtrl.text,
                                    civilRegistry: firstCivilRegistryCtrl.text,
                                    department: firstDepartmentCtrl.text,
                                    governorate: firstGovernorateCtrl.text,
                                  ),
                                  partyTwo: Party(
                                    name: secondFullNameCtrl.text,
                                    nationality: secondNationalityCtrl.text,
                                    idNumber: secondidNumberCtrl.text,
                                    civilRegistry: secondCivilRegistryCtrl.text,
                                    department: secondDepartmentCtrl.text,
                                    governorate: secondGovernorateCtrl.text,
                                  ),
                                  remainingAmount: remainingAmountCtrl.text,
                                  taxFileNumber: taxFileCtrl.text,
                                  taxYear: taxYearCtrl.text,
                                  taxOwnerName: taxOwnerCtrl.text,
                                  officialDisclosureNumber: disclosureCtrl.text,
                                );


                                // 🔥 STEP 3: generate PDF
                                await provider.generatePropertyPdf(contract);

                                if (!context.mounted) return;

                                // 🔥 STEP 4: open preview
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
                                        provider.error ??
                                            "Failed to generate PDF",
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: provider.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("Download PDF"),
                      ),
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
        textInputAction: nextFocus != null
            ? TextInputAction.next
            : TextInputAction.done,

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
    required TextEditingController nationality,
    required TextEditingController department,
    required TextEditingController governorate,
    required TextEditingController civilRegistry,
    required TextEditingController idController, // 🔥 add
    required FocusNode idFocus,
    required FocusNode fullNameFocus,
    required FocusNode nationalityFocus,
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
                inlineField(
                  font: font,
                  width: 220,
                  controller: fullName,
                  hint: "Full Name",
                  focusNode: fullNameFocus,
                ),
              ],
            ),
            Wrap(
              children: [
                Text("Nationality:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: nationality,
                  hint: "Nationality",
                  focusNode: nationalityFocus,
                ),
              ],
            ),
            Wrap(
              children: [
                Text("Id Number:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: idController, // 🔥
                  focusNode: idFocus,       // 🔥
                  hint: "Id Number",
                ),
              ],
            ),

            Wrap(
              children: [
                Text("Civil Registry:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: civilRegistry,
                  hint: "Civil Registry",
                  focusNode: civilRegistryFocus,
                ),
              ],
            ),
            Wrap(
              children: [
                Text("Department:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: department,
                  hint: "District",
                  focusNode: departmentFocus,
                ),
              ],
            ),
            Wrap(
              children: [
                Text("Governorate:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: governorate,
                  hint: "Governorate",
                  focusNode: governorateFocus,
                ),
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
    if (titleCtrl.text.trim().isEmpty) {
      titleFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "title required");
      return false;
    }

    if (cityCtrl.text.trim().isEmpty) {
      cityFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "city required");
      return false;
    }

    if (districtCtrl.text.trim().isEmpty) {
      districtFocus.requestFocus();
      showError(context, "District required");
      return false;
    }
    if (governCtrl.text.trim().isEmpty) {
      governFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "Govern required");
      return false;
    }
    if (mapReferenceCtrl.text.trim().isEmpty) {
      mapReferenceFocus.requestFocus();
      showError(context, "mapReference required");
      return false;
    }

    if (areaNumbersCtrl.text.trim().isEmpty) {
      areaNumbersFocus.requestFocus();
      showError(context, "areaNumbers required");
      return false;
    }
    if (coastalLimitCtrl.text.trim().isEmpty) {
      coastalLimitFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "coastalLimit required");
      return false;
    }

    if (streetNameOrPlotCtrl.text.trim().isEmpty) {
      streetNameOrPlotFocus.requestFocus();
      showError(context, "streetNameOrPlot required");
      return false;
    }

    if (coastalLimitCtrl.text.trim().isEmpty) {
      coastalLimitFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "coastalLimit required");
      return false;
    }
    if (northCtrl.text.trim().isEmpty) {
      northFocus.requestFocus();
      showError(context, "north required");
      return false;
    }
    if (southOwnerCtrl.text.trim().isEmpty) {
      southOwnerFocus.requestFocus();
      showError(context, "south required");
      return false;
    }
    if (lengthNorthCtrl.text.trim().isEmpty) {
      lengthNorthFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "lengthNorth required");
      return false;
    }

    if (eastCtrl.text.trim().isEmpty) {
      eastFocus.requestFocus();
      showError(context, "east required");
      return false;
    }




    if (eastOwnerCtrl.text.trim().isEmpty) {
      eastOwnerFocus.requestFocus();
      showError(context, "eastOwner required");
      return false;
    }

    if (lengthEastCtrl.text.trim().isEmpty) {
      lengthEastFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "lengthEast required");
      return false;
    }



    if (lengthWestCtrl.text.trim().isEmpty) {
      lengthWestFocus.requestFocus();
      showError(context, "lengthWest required");
      return false;
    }
    if (areaDescCtrl.text.trim().isEmpty) {
      areaDescFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "areaDesc required");
      return false;
    }

    if (areaCmCtrl.text.trim().isEmpty) {
      areaCmFocus.requestFocus();
      showError(context, "areaCm required");
      return false;
    }

    if (dayCtrl.text.trim().isEmpty) {
      dayFocus.requestFocus();
      showError(context, "day required");
      return false;
    }
    if (dateCtrl.text.trim().isEmpty) {
      dateFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "dateFormatted required");
      return false;
    }
    if (firstFullNameCtrl.text.trim().isEmpty) {
      firstFullNameFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstFullName required");
      return false;
    }

    if (firstNationalityCtrl.text.trim().isEmpty) {
      firstNationalityFocus.requestFocus();
      showError(context, "firstNationality required");
      return false;
    }

    if (firstidNumberCtrl.text.trim().isEmpty) {
      firstFamilyIdFocus.requestFocus();
      showError(context, "firstidNumber required");
      return false;
    }
    if (firstCivilRegistryCtrl.text.trim().isEmpty) {
      firstCivilRegistryFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstCivilRegistry required");
      return false;
    }
    if (firstDepartmentCtrl.text.trim().isEmpty) {
      firstDepartmentFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstDepartment required");
      return false;
    }

    if (firstGovernorateCtrl.text.trim().isEmpty) {
      firstGovernorateFocus.requestFocus();
      showError(context, "firstGovernorate required");
      return false;
    }

    if (secondFullNameCtrl.text.trim().isEmpty) {
      secondFullNameFocus.requestFocus();
      showError(context, "secondFullName required");
      return false;
    }
    if (secondNationalityCtrl.text.trim().isEmpty) {
      secondNationalityFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "secondNationality required");
      return false;
    }
    if (secondidNumberCtrl.text.trim().isEmpty) {
      secondFamilyIdFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "secondidNumber required");
      return false;
    }

    if (secondCivilRegistryCtrl.text.trim().isEmpty) {
      secondCivilRegistryFocus.requestFocus();
      showError(context, "secondCivilRegistry required");
      return false;
    }

    if (secondDepartmentCtrl.text.trim().isEmpty) {
      secondDepartmentFocus.requestFocus();
      showError(context, "secondDepartment required");
      return false;
    }
    if (secondGovernorateCtrl.text.trim().isEmpty) {
      secondGovernorateFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "secondGovernorate required");
      return false;
    }
    if (remainingAmountCtrl.text.trim().isEmpty) {
      remainingAmountFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "remainingAmount required");
      return false;
    }
    if (taxFileCtrl.text.trim().isEmpty) {
      taxFileFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "taxFile required");
      return false;
    }

    if (taxYearCtrl.text.trim().isEmpty) {
      taxYearFocus.requestFocus();
      showError(context, "taxYear required");
      return false;
    }

    if (taxOwnerCtrl.text.trim().isEmpty) {
      taxOwnerFocus.requestFocus();
      showError(context, "taxOwner required");
      return false;
    }
    if (disclosureCtrl.text.trim().isEmpty) {
      disclosureFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "disclosure required");
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
  Widget firstParty(double font) {
    return _partyCard(
      title: "( First Party )",
      font: font,
      fullName: firstFullNameCtrl,
      nationality: firstNationalityCtrl,
      department: firstDepartmentCtrl,
      governorate: firstGovernorateCtrl,
      civilRegistry: firstCivilRegistryCtrl,
      fullNameFocus: firstFullNameFocus,
      nationalityFocus: firstNationalityFocus,
      departmentFocus: firstDepartmentFocus,
      governorateFocus: firstGovernorateFocus,
      familyIdFocus: firstFamilyIdFocus,
      civilRegistryFocus: firstCivilRegistryFocus,
      idController: firstidNumberCtrl, // 🔥 important
      idFocus: firstFamilyIdFocus,
    );
  }

  Widget secondParty(double font) {
    return _partyCard(
      title: "( Second Party )",
      font: font,
      fullName: secondFullNameCtrl,
      nationality: secondNationalityCtrl,
      department: secondDepartmentCtrl,
      governorate: secondGovernorateCtrl,
      civilRegistry: secondCivilRegistryCtrl,
      fullNameFocus: secondFullNameFocus,
      nationalityFocus: secondNationalityFocus,
      departmentFocus: secondDepartmentFocus,
      governorateFocus: secondGovernorateFocus,
      familyIdFocus: secondFamilyIdFocus,
      civilRegistryFocus: secondCivilRegistryFocus,
      idController: secondidNumberCtrl, // 🔥 important
      idFocus: secondFamilyIdFocus,
    );
  }



}
