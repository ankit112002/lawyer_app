import 'package:flutter/material.dart';
import 'package:lawyer/pdf/pdf_preview.dart';
import 'package:provider/provider.dart';

import '../models/company_contract.dart';
import '../models/company_supporting.dart';
import '../provider/company_contract_provider.dart';

class ArticleOfAssociation extends StatefulWidget {
  const ArticleOfAssociation({super.key});

  @override
  State<ArticleOfAssociation> createState() => _ArticleOfAssociationState();
}

class _ArticleOfAssociationState extends State<ArticleOfAssociation> {
  final auditorResidenceCtrl = TextEditingController();
  final nameCtrl1 = TextEditingController();
  final nationalityCtrl1 = TextEditingController();
  final monetaryCtrl1 = TextEditingController();
  final inKindCtrl1 = TextEditingController();
  final shareCtrl1 = TextEditingController();




  final nameCtrl2 = TextEditingController();
  final nationalityCtrl2 = TextEditingController();
  final monetaryCtrl2 = TextEditingController();
  final inKindCtrl2 = TextEditingController();
  final shareCtrl2 = TextEditingController();

  final partnernameCtrl1 = TextEditingController();
  final partnernameCtrl2 = TextEditingController();
  final descCtrl1 = TextEditingController();
  final descCtrl2 = TextEditingController();

  final FocusNode auditorResidenceFocus = FocusNode();
  final FocusNode locationFocus = FocusNode();
  final FocusNode carNumberFocus = FocusNode();

  final FocusNode dateFocus = FocusNode();
  final FocusNode firstFullNameFocus = FocusNode();
  final FocusNode firstProfessionFocus = FocusNode();
  final FocusNode firstNationalityFocus = FocusNode();
  final FocusNode firstBirthDateFocus = FocusNode();
  final FocusNode firstIdProofFocus = FocusNode();
  final FocusNode firstResidenceFocus = FocusNode();
  final FocusNode firstCivilRegistryFocus = FocusNode();



  final FocusNode secondFullNameFocus = FocusNode();
  final FocusNode secondProfessionFocus = FocusNode();
  final FocusNode secondNationalityFocus = FocusNode();
  final FocusNode secondBirthDateFocus = FocusNode();
  final FocusNode secondIdProofFocus = FocusNode();
  final FocusNode secondResidenceFocus = FocusNode();
  final FocusNode secondCivilRegistryFocus = FocusNode();



  final FocusNode nationality1Focus = FocusNode();
  final FocusNode name1Focus = FocusNode();
  final FocusNode monetary1Focus = FocusNode();
  final FocusNode inKind1Focus = FocusNode();
  final FocusNode share1Focus = FocusNode();
  final FocusNode nationality2Focus = FocusNode();
  final FocusNode name2Focus = FocusNode();
  final FocusNode monetary2Focus = FocusNode();
  final FocusNode inKind2Focus = FocusNode();
  final FocusNode share2Focus = FocusNode();
  final FocusNode auditorNameFocus = FocusNode();

  final FocusNode partnername1Focus = FocusNode();
  final FocusNode partnername2Focus = FocusNode();
  final FocusNode desc1Focus = FocusNode();
  final FocusNode desc2Focus = FocusNode();

  final FocusNode fullame1Focus = FocusNode();
  final FocusNode fullname2Focus = FocusNode();
  final FocusNode fullname3Focus = FocusNode();
  final FocusNode fullname4Focus = FocusNode();
  final FocusNode fullname5Focus = FocusNode();
  final FocusNode fullname6Focus = FocusNode();
  final FocusNode residence1Focus = FocusNode();
  final FocusNode residence2Focus = FocusNode();
  final FocusNode residence3Focus = FocusNode();
  final FocusNode residence4Focus = FocusNode();
  final FocusNode residence5Focus = FocusNode();
  final FocusNode residence6Focus = FocusNode();


  // 📅 Contract
  final contractDateFocus = FocusNode();

// 🏢 Company info
  final companyNameFocus = FocusNode();

  final purposeFocus = FocusNode();

  final durationYearsFocus = FocusNode();

  final centerCityFocus = FocusNode();

// 💰 Capital & shares
  final capitalAmountFocus = FocusNode();

  final shareValueFocus = FocusNode();

  final totalSharesFocus = FocusNode();

  final cashSharesTotalFocus = FocusNode();

  final inKindSharesTotalFocus = FocusNode();

  final paidCashAmountFocus = FocusNode();

// 📦 In-kind
  final inKindValuationFocus = FocusNode();

  final inKindContributorNameFocus = FocusNode();

// 👔 Managers
  final managerDurationFocus = FocusNode();

  final managersAnnualSalaryFocus = FocusNode();

// 👁 Supervision
  final supervisionCountFocus = FocusNode();

  final supervisionTermYearsFocus = FocusNode();

  final minSharesForSupervisionFocus = FocusNode();

  final supervisoryBoardSumAmountFocus = FocusNode();

// 🏛 Assembly & fiscal
  final assemblyCityFocus = FocusNode();

  final fiscalYearStartFocus = FocusNode();

  final fiscalYearEndFocus = FocusNode();

// 📊 Percentages
  final reservePercentageFocus = FocusNode();

  final firstProfitSharePercentageFocus = FocusNode();

  final managersBonusPercentageFocus = FocusNode();

  final workersSharePercentageFocus = FocusNode();


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
  final firstProfessionCtrl = TextEditingController();
  final firstResidenceCtrl = TextEditingController();
  final firstGovernorateCtrl = TextEditingController();
  final firstBirthDateCtrl = TextEditingController();
  final firstIdProofCtrl = TextEditingController();


  // Second Party
  final secondFullNameCtrl = TextEditingController();
  final secondProfessionCtrl = TextEditingController();
  final secondNationalityCtrl = TextEditingController();
  final secondBirthDateCtrl = TextEditingController();
  final secondIdProofCtrl = TextEditingController();
  final secondResidenceCtrl = TextEditingController();

  //notorization

  final auditorNameCtrl = TextEditingController();
  final fullnameCtrl1 = TextEditingController();
  final fullnameCtrl2 = TextEditingController();
  final fullnameCtrl3 = TextEditingController();
  final fullnameCtrl4 = TextEditingController();
  final fullnameCtrl5 = TextEditingController();
  final fullnameCtrl6 = TextEditingController();
  final residenceCtrl1 = TextEditingController();
  final residenceCtrl2 = TextEditingController();
  final residenceCtrl3 = TextEditingController();
  final residenceCtrl4 = TextEditingController();
  final residenceCtrl5 = TextEditingController();
  final residenceCtrl6 = TextEditingController();


  // Party
  final firstPartyNameCtrl = TextEditingController();
  final secondPartyNameCtrl = TextEditingController();

  // 📅 Contract
  final contractDateCtrl = TextEditingController();

// 🏢 Company info
  final companyNameCtrl = TextEditingController();
  final purposeCtrl = TextEditingController();
  final durationYearsCtrl = TextEditingController();
  final centerCityCtrl = TextEditingController();

// 💰 Capital & shares
  final capitalAmountCtrl = TextEditingController();
  final shareValueCtrl = TextEditingController();
  final totalSharesCtrl = TextEditingController();
  final cashSharesTotalCtrl = TextEditingController();
  final inKindSharesTotalCtrl = TextEditingController();
  final paidCashAmountCtrl = TextEditingController();

// 📦 In-kind
  final inKindValuationCtrl = TextEditingController();
  final inKindContributorNameCtrl = TextEditingController();

// 👔 Managers
  final managerDurationCtrl = TextEditingController();
  final managersAnnualSalaryCtrl = TextEditingController();

// 👁 Supervision
  final supervisionCountCtrl = TextEditingController();
  final supervisionTermYearsCtrl = TextEditingController();
  final minSharesForSupervisionCtrl = TextEditingController();
  final supervisoryBoardSumAmountCtrl = TextEditingController();

// 🏛 Assembly & fiscal
  final assemblyCityCtrl = TextEditingController();
  final fiscalYearStartCtrl = TextEditingController();
  final fiscalYearEndCtrl = TextEditingController();

// 📊 Percentages
  final reservePercentageCtrl = TextEditingController();
  final firstProfitSharePercentageCtrl = TextEditingController();
  final managersBonusPercentageCtrl = TextEditingController();
  final workersSharePercentageCtrl = TextEditingController();
  // ✅ Dummy lists (replace with your dynamic data)
  final List<Party> partiesList = [];
  final List<ShareTable> sharesTableList = [];
  final List<InKindContribution> inKindList = [];
  final List<Manager> managersList = [];
  final List<Manager> managerCandidatesList = [];
  final List<SupervisionMember> supervisionMembersList = [];
  final Auditor auditorModel = Auditor(
    fullName: "Auditor Name",
    residence: "Cairo",
  );





  @override
  void dispose() {
    auditorResidenceCtrl.dispose();

    firstPartyNameCtrl.dispose();
    secondPartyNameCtrl.dispose();


    governCtrl.dispose();

    locationCtrl.dispose();

    dateCtrl.dispose();


    contractDateCtrl.dispose();
    companyNameCtrl.dispose();
    purposeCtrl.dispose();
    durationYearsCtrl.dispose();
    centerCityCtrl.dispose();
    capitalAmountCtrl.dispose();
    shareValueCtrl.dispose();
    totalSharesCtrl.dispose();
    cashSharesTotalCtrl.dispose();
    inKindSharesTotalCtrl.dispose();
    paidCashAmountCtrl.dispose();
    inKindValuationCtrl.dispose();
    inKindContributorNameCtrl.dispose();
    managerDurationCtrl.dispose();
    managersAnnualSalaryCtrl.dispose();
    supervisionCountCtrl.dispose();
    supervisionTermYearsCtrl.dispose();
    minSharesForSupervisionCtrl.dispose();
    supervisoryBoardSumAmountCtrl.dispose();
    assemblyCityCtrl.dispose();
    fiscalYearStartCtrl.dispose();
    fiscalYearEndCtrl.dispose();
    reservePercentageCtrl.dispose();
    firstProfitSharePercentageCtrl.dispose();
    managersBonusPercentageCtrl.dispose();
    workersSharePercentageCtrl.dispose();

    //
    // dateFocus.dispose();
    //
    // firstFullNameFocus.dispose();
    // firstNationalityFocus.dispose();

    auditorResidenceFocus.dispose();
    firstFullNameFocus.dispose();
    firstNationalityFocus.dispose();
    firstIdProofFocus.dispose();
    firstBirthDateFocus.dispose();
    firstResidenceFocus.dispose();
    firstProfessionFocus.dispose();

    secondFullNameFocus.dispose();
    secondNationalityFocus.dispose();
    secondIdProofFocus.dispose();
    secondResidenceFocus.dispose();
    secondBirthDateFocus.dispose();

    carNumberFocus.dispose();
    secondProfessionFocus.dispose();

    dateFocus.dispose();

    secondCivilRegistryFocus.dispose();

    name1Focus.dispose();
    name2Focus.dispose();
    nationality1Focus.dispose();
    nationality2Focus.dispose();
    monetary1Focus.dispose();
    monetary2Focus.dispose();


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
          "Articles of Incorporation of a Limited Liability Company",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFont),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "(In accordance with the provisions of Law No. 159 of 1981)",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: [
                SizedBox(height: 10),

                Wrap(
                  children: [
                    Text(
                      "It is on the day of ",
                      style: TextStyle(fontSize: bodyFont),
                    ),
                    inlineField(
                      controller: contractDateCtrl,
                      font: bodyFont,
                      width: 100,
                      hint: "DD/MM/YY",
                      focusNode: contractDateFocus,
                    ),
                    Text(
                      "  Between the two signatories below:.",
                      style: TextStyle(fontSize: bodyFont),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                _partyCard(
                  title: "( First Party )",
                  font: bodyFont,

                  fullName: firstFullNameCtrl,
                  profession: firstProfessionCtrl,
                  nationality: firstNationalityCtrl,
                  birthDate: firstBirthDateCtrl,
                  idProof: firstIdProofCtrl,
                  Residence: firstResidenceCtrl,

                  fullNameFocus: firstFullNameFocus,
                  professionFocus: firstProfessionFocus,
                  nationalityFocus: firstNationalityFocus,
                  birthDateFocus: firstBirthDateFocus,
                  idProofFocus: firstIdProofFocus,
                  ResidenceFocus: firstResidenceFocus,
                ),

                const SizedBox(height: 20),

                _partyCard(
                  title: "( Second Party )",
                  font: bodyFont,

                  fullName: secondFullNameCtrl,
                  profession: secondProfessionCtrl,
                  nationality: secondNationalityCtrl,
                  birthDate: secondBirthDateCtrl,
                  idProof: secondIdProofCtrl,
                  Residence: secondResidenceCtrl,

                  fullNameFocus: secondFullNameFocus,
                  professionFocus: secondProfessionFocus,
                  nationalityFocus: secondNationalityFocus,
                  birthDateFocus: secondBirthDateFocus,
                  idProofFocus: secondIdProofFocus,
                  ResidenceFocus: secondResidenceFocus,
                ),

                const SizedBox(height: 20),
                _text(
                  "They have agreed among themselves to establish a limited liability company in accordance with the provisions of the applicable laws, and the provisions of the Law on Joint Stock Companies, Limited Partnerships by Shares and Limited Liability Companies issued by Law No. 159 of 1981 and its executive regulations and the provisions of this contract. The signatories acknowledge that they have observed the rules stipulated in the aforementioned laws in establishing this company.",
                  bodyFont,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Chapter One",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Company name – its purpose – its duration – its headquarters)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "(Article 1) The company's address or name ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: companyNameCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Company Name",
                          focusNode: companyNameFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " (Limited Liability Company).",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "(Article 2) The purpose of the company is: ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: purposeCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "purpose",
                          focusNode: purposeFocus,
                        ),
                      ),

                    ],
                  ),
                ),


                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "(Article 3) The duration of the company is ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: durationYearsCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "duration",
                          focusNode: durationYearsFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " starting from the date of its registration in the Commercial Register. "
                            "The duration may be extended under the conditions specified in this contract "
                            "and with the approval of the committee stipulated in Article 18 of the Law on "
                            "Joint Stock Companies, Limited Partnerships by Shares and Limited Liability Companies.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 4) The company’s principal place of business and legal domicile "
                            "shall be in the city of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: centerCityCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "city",
                          focusNode: centerCityFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " in the Arab Republic of Egypt.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                _text(
                  "The company’s directors may decide to move the headquarters to any other location in the same city, and they may also decide to establish branches or agencies for the company in Egypt or abroad.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "If the headquarters is moved to another city, this must be based on a decision by the Extraordinary General Assembly of Partners.",
                  bodyFont,
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Two",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Capital - Shares)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "(Article 5) The company's capital is set at an amount of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: capitalAmountCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "amount",
                          focusNode: capitalAmountFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " divided into shares, each with a value of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: shareValueCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "shareValue",
                          focusNode: shareValueFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " including a cash share with a value of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: totalSharesCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "totalShares",
                          focusNode: totalSharesFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " and an in-kind share with a value of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: cashSharesTotalCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "cashShares",
                          focusNode: cashSharesTotalFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " and these shares are distributed among the partners as follows: inkindShareTotal",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: inKindSharesTotalCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "KindShares",
                          focusNode: inKindSharesTotalFocus,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: DataTable(
                columnSpacing: 20,
                border: TableBorder.all(color: Colors.grey),
                columns: const [
                  DataColumn(label: Text('Partner name')),
                  DataColumn(label: Text('Nationality')),
                  DataColumn(label: Text('Monetary')),
                  DataColumn(label: Text('In Kind')),
                  DataColumn(label: Text('Shares %')),
                ],
                rows: [
                  _dataRow(
                    nameCtrl1,
                    nationalityCtrl1,
                    monetaryCtrl1,
                    inKindCtrl1,
                    shareCtrl1,
                  ),
                  _dataRow(
                    nameCtrl2,
                    nationalityCtrl2,
                    monetaryCtrl2,
                    inKindCtrl2,
                    shareCtrl2,
                  ),
                ],
              ),
            ),
          ),


          SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "The partners agree that the cash contributions have been paid in full "
                            "and amount to ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: paidCashAmountCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "paidCash",
                          focusNode: paidCashAmountFocus,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                _text(
                  "The following is a statement of in-kind contributions made by the partners.",
                  bodyFont,
                  bold: true,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Point 1
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("1- Mr./Ms. ", style: TextStyle(fontSize: bodyFont)),
                        inlineField(
                          controller: partnernameCtrl1,
                          font: bodyFont,
                          width: 120,
                          hint: "partnerName",
                          focusNode: partnername1Focus,
                        ),
                        Text(
                          " submitted the following:",
                          style: TextStyle(fontSize: bodyFont),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("Description:- ", style: TextStyle(fontSize: bodyFont)),
                        inlineField(
                          controller: descCtrl1,
                          font: bodyFont,
                          width: 200,
                          hint: "description",
                          focusNode: desc1Focus,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // 🔹 Point 2
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("2- Mr./Ms. ", style: TextStyle(fontSize: bodyFont)),
                        inlineField(
                          controller: partnernameCtrl2,
                          font: bodyFont,
                          width: 120,
                          hint: "partnerName",
                          focusNode: partnername2Focus,
                        ),
                        Text(
                          " submitted the following:",
                          style: TextStyle(fontSize: bodyFont),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("Description:- ", style: TextStyle(fontSize: bodyFont)),
                        inlineField(
                          controller: descCtrl2,
                          font: bodyFont,
                          width: 200,
                          hint: "description",
                          focusNode: desc2Focus,
                        ),
                      ],
                    ),
                  ],
                ),


                SizedBox(height: 10),

                _text(
                  "Ownership of these shares transfers to the company from the date of signing the contract, and all rights and obligations related to them also transfer to it.",
                  bodyFont,
                  bold: true,
                ),
                SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: bodyFont,
                color: Colors.black,
              ),
              children: [
                const TextSpan(
                  text: "The founders agreed to value the in-kind contribution from Mr. ",
                ),

                // 👤 Name field
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: inlineField(
                    controller: inKindContributorNameCtrl,
                    font: bodyFont,
                    width: 120,
                    hint: " Name",
                    focusNode: inKindContributorNameFocus,
                  ),
                ),

                const TextSpan(
                  text: " at the amount of ",
                ),

                // 💰 Amount field
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: inlineField(
                    controller: inKindValuationCtrl,
                    font: bodyFont,
                    width: 100,
                    hint: " Amount",
                    focusNode: inKindValuationFocus,
                  ),
                ),

                const TextSpan(
                  text: ".",
                ),
              ],
            ),
          ),


          SizedBox(height: 10),
                _text(
                  "(Article 6) Shares entitle the holders to equal rights in receiving profits and in dividing the company's assets upon liquidation. The partners are only obligated to the extent of the value of their shares.   The rights and obligations related to the share follow it in the hands of whoever acquires ownership of it. Ownership of the share necessarily entails acceptance of the provisions of this contract and the resolutions of the General Assembly.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "(Article 7) The capital may be increased in one or more installments, either by issuing new shares or by converting the free reserve capital into shares, by a decision of the Extraordinary General Assembly and in accordance with the provisions stipulated in both the law and its executive regulations.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "In the event of issuing new cash shares, the partners shall have a pre-emptive right to subscribe to them in proportion to the number of shares each of them owns. This right shall be exercised in accordance with the terms and conditions set by the managers with the approval of the supervisory board, unless the extraordinary general meeting decides otherwise.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "(Article 8) The Extraordinary General Assembly may decide to reduce the capital for any reason, provided that it is not less than the minimum capital specified in the Executive Regulations of Law No. 159 of 1981. The reduction shall be in the manner that the Assembly deems appropriate, whether by reducing the number of shares, redeeming some of them, or reducing the nominal value, provided that the nominal value of each of them is not less than one hundred pounds.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "(Article 9) Shares are transferable between partners or between them and third parties, and this transfer or disposal must be recorded in the register prepared for that purpose.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "Anyone who intends to sell their share to a third party must notify the company's management of this by registered letter, which includes the name and title of the transferee, their profession, place of residence, and the number of shares being transferred. The management, in turn, notifies the partners within the following three days. The partners have one month from the notification to first redeem the share under the same conditions, otherwise this right is forfeited. If more than one partner exercises the right of redemption, the sold share is divided among them in proportion to each partner's share in the capital.",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text(
                  "(Article 10) The company's headquarters shall maintain a special register of partners containing the following:",
                  bodyFont,
                ),
                SizedBox(height: 10),
                _text("1- The names, descriptions, place of residence, and professions of the partners.", bodyFont),
                SizedBox(height: 10),
                _text("2- The number of shares owned by each partner and the amount they paid.", bodyFont),
                SizedBox(height: 10),
                _text("3- Restrictions on shares and the transfer of ownership, along with a statement of the date of signing by the transferor and the transferee.", bodyFont),
                SizedBox(height: 10),
                _text("The transferee in the case of a transaction between living persons, the signature of the manager, and the person to whom the share was transferred in the case of inheritance. The transfer or assignment shall have no effect on the company or on third parties except from the date of its registration in this register.", bodyFont),
                SizedBox(height: 10),
                _text("Each partner and any interested party other than partners may view this record during the company's daily working hours.", bodyFont),
                SizedBox(height: 10),
                _text("In January of each year, a list containing the data in this register and any changes thereto shall be sent to the General Administration of Companies.", bodyFont),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Three",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Company Management)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "(Article 11) The company shall be managed by Mr./ ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl1,
                          font: bodyFont,
                          width: 120,
                          hint: "fullName",
                          focusNode: fullame1Focus,
                        ),
                      ),
                      const TextSpan(text: " residing in "),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl1,
                          font: bodyFont,
                          width: 120,
                          hint: "residence",
                          focusNode: residence1Focus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " as the sole manager, and his employment shall end on ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: dateCtrl,
                          font: bodyFont,
                          width: 110,
                          hint: "DD/MM/YY",
                          focusNode: dateFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " or by commencing management for an unlimited period.",
                      ),
                    ],
                  ),
                  softWrap: true,
                ),

                SizedBox(height: 10,),
                _text("Or the company may be managed by directors appointed by the general assembly from among the partners or from outside the company. Notwithstanding the foregoing, the partners appoint the initial management body from among:", bodyFont),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "1- Mr ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl2,
                          font: bodyFont,
                          width: 100,
                          hint: "fullName",
                          focusNode: fullname2Focus,
                        ),
                      ),
                      const TextSpan(
                        text: " Resident in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl2,
                          font: bodyFont,
                          width: 100,
                          hint: "residence",
                          focusNode: residence2Focus,
                        ),
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "2- Mr ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl3,
                          font: bodyFont,
                          width: 100,
                          hint: "fullName",
                          focusNode: fullname3Focus,
                        ),
                      ),
                      const TextSpan(
                        text: " Resident in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl3,
                          font: bodyFont,
                          width: 100,
                          hint: "residence",
                          focusNode: residence3Focus,
                        ),
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "etc ",
                      ),
                      // WidgetSpan(
                      //   alignment: PlaceholderAlignment.baseline,
                      //   baseline: TextBaseline.alphabetic,
                      //   child: inlineField(
                      //     controller: dateCtrl,
                      //     font: bodyFont,
                      //     width: 100,
                      //     hint: "DD/MM/YY",
                      //     focusNode: dateFocus,
                      //   ),
                      // ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "The managers' employment ends on ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: managerDurationCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Duration",
                          focusNode: managerDurationFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " or they continue in their position for an indefinite period.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("(Article 12) The manager or managers represent the company in its relations with third parties and have, individually or jointly... in this regard, the broadest powers to act in its name and to carry out all contracts and transactions within the purpose of the company, and in particular to appoint, suspend and dismiss the company’s agents and employees, determine their salaries, wages and bonuses, collect and pay all sums, and sign, transfer, sell and settle all (1) mandatory data (1, 2) choose one of the two arbitrators.", bodyFont),
                SizedBox(height: 10,),
                _text("The powers mentioned are representative and some of them may be assigned to the General Assembly.", bodyFont),
                SizedBox(height: 10,),
                _text("Commercial promissory notes and the conclusion of all contracts, agreements, and transactions related to the company's dealings, whether in cash or on credit, and they have the right to purchase all materials, supplies, goods, and movable assets, and to make assumptions through letters of credit...etc.", bodyFont),
                SizedBox(height: 10,),
                _text("Loans not secured by bank credit, purchases, exchanges, sales of commercial premises and real estate, mortgages, and participation in other institutions may only be carried out with the approval of the general assembly by a majority of partners holding three-quarters of the capital (or by unanimous decision of the partners). The transaction is not binding on the company unless it is signed by the manager or another employee, accompanied by a statement of their capacity.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 13) The manager is subject to dismissal at any time by a reasoned decision issued with the approval of the numerical majority of the partners holding three-quarters of the capital, or by a collective decision of the partners. He may resign at the end of the financial year, provided that he submits his resignation to the Chairman of the Supervisory Board, the other managers, or the General Assembly at least one month before that.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 14) In the event of the termination of the position of one of the directors, the remaining directors must, within one month, call for an extraordinary general assembly to convene to consider the matter and appoint a new director.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 15) The directors, in their relationship with each other and as an internal measure, may form a board of directors which shall appoint its chairman and secretary.", bodyFont),
                SizedBox(height: 10,),
                _text("The Board of Directors shall meet at the request of the Chairman or two other members whenever the interests of the company so require, and the meeting shall be held at the company headquarters or at any other place designated by the letter of invitation.", bodyFont),
                SizedBox(height: 10,),
                _text("Its meeting shall not be valid unless at least half of the members of the Board of Directors are present.", bodyFont),
                SizedBox(height: 10,),
                _text("The Board of Directors' decisions are issued by a majority vote of the attending managers. If the votes are equal, the Chairman's vote is decisive. The aforementioned decisions are recorded in minutes that are kept in a special register with numbered pages, and are signed by the managers who participated in issuing these decisions. The Chairman of the Board approves copies or extracts of these minutes.", bodyFont),
                SizedBox(height: 10,),
                _text("The Board of Directors deliberates on all matters presented to it that relate to the management of the company’s affairs, and the Board must decide in particular on every transaction or contract that entails a commitment from the company or bank exceeding ().", bodyFont),
                SizedBox(height: 10,),
                _text("Managers must implement the decisions issued by the board of directors and follow its instructions, otherwise they will be dismissed from their positions and liable to pay compensation to the company.", bodyFont),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 16) The directors have the right to a total annual amount of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: managersAnnualSalaryCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "AnnualSalary",
                          focusNode: managersAnnualSalaryFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " pounds as a bonus to be paid every “month or three months, for example” "
                            "and recorded in the general expenses account, in addition to their right "
                            "to recover representation expenses and travel and transportation allowances.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("They also have the right to receive a share of the profits as set out in Article 38 of this contract.", bodyFont),
                SizedBox(height: 10,),
                _text("These amounts are distributed among the managers according to what they agree upon among themselves.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 17) Advertisements, copies of contracts, and all other papers and publications issued by the company must bear the name of the company and be preceded or followed by the phrase “Limited Liability Company” written in clear and legible letters, along with a statement of the company’s headquarters and a statement of its capital if it is not less than its fixed value in the last balance sheet.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 18) The company’s notifications referred to in this contract, whether between the partners or between them and the company, shall be in the form of registered letters.", bodyFont)

              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Four",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Supervisory Board)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 19) The company shall have a supervisory board consisting of "
                            "at least three members or at most ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: supervisionCountCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Count",
                          focusNode: supervisionCountFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " members, elected by the general assembly from among the partners, "
                            "and their fees shall be determined.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("Notwithstanding the foregoing, the founders appointed the first supervisory board consisting of their members:", bodyFont),
                SizedBox(height: 10,),

                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "1- Mr ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl4,
                          font: bodyFont,
                          width: 100,
                          hint: "fullName",
                          focusNode: fullname4Focus,
                        ),
                      ),
                      const TextSpan(
                        text: " Resident in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl4,
                          font: bodyFont,
                          width: 100,
                          hint: "residence",
                          focusNode: residence4Focus,
                        ),
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "2- Mr ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl5,
                          font: bodyFont,
                          width: 100,
                          hint: "fullName",
                          focusNode: fullname5Focus,
                        ),
                      ),
                      const TextSpan(
                        text: " Resident in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl5,
                          font: bodyFont,
                          width: 100,
                          hint: "residence",
                          focusNode: residence5Focus,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "3- Mr ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fullnameCtrl6,
                          font: bodyFont,
                          width: 100,
                          hint: "fullName",
                          focusNode: fullname6Focus,
                        ),
                      ),
                      const TextSpan(
                        text: " Resident in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: residenceCtrl6,
                          font: bodyFont,
                          width: 100,
                          hint: "residence",
                          focusNode: residence6Focus,
                        ),
                      ),
                    ],
                  ),
                ),


                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text: "etc ",
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 20) The term of membership in the Supervisory Board is ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: supervisionTermYearsCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "TermYears",
                          focusNode: supervisionTermYearsFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " years, for example, three years.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "However, the supervisory board appointed in the preceding article shall remain in office for a period ",
                      ),
                      const TextSpan(
                        text: " years",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("At the end of this term, the council is renewed as a whole, and then one-third of the members are renewed (for example) every year when the general assembly is held. The first two-thirds are appointed by way of voting, and then the members are renewed according to seniority in appointment. If the number of council members is not divisible by three, the remaining number is merged.", bodyFont),
                SizedBox(height: 10,),
                _text("Those covered by the last renewal may always be re-elected, and members whose term of membership has expired may also be re-elected.", bodyFont),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 21) It is required that a member of the Supervisory Board owns a number of shares in the company, amounting to at least ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: minSharesForSupervisionCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Shares",
                          focusNode: minSharesForSupervisionFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " shares, which are allocated to guarantee against any errors that he may commit during his membership, and these shares shall not be tradable during the aforementioned period.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                _text("(Article 22) The Supervisory Board may appoint members to the positions of members that become vacant during the year due to resignation, death or for any other reason. This must be done during the month following the vacancy if the number of members falls below three.", bodyFont),
                SizedBox(height: 10,),
                _text("The members appointed in this manner shall commence work immediately until the first meeting of the General Assembly is held, at which point it will either approve their appointment or appoint others in their place.", bodyFont),
                SizedBox(height: 10,),
                _text("The member who is appointed in place of another completes the remaining term of his predecessor.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 23) The Supervisory Board shall appoint from among its members a Chairman and a Secretary, and in the absence of the Chairman, the Board shall appoint the member who shall temporarily carry out the duties of the Chairman.", bodyFont),
                SizedBox(height: 10,),
                _text("The Supervisory Board shall hold its meetings at the company headquarters or at any other place specified in the invitation letter whenever its interests require it to be held, based on the invitation of the Chairman and two of its members, for example. It may be called to an extraordinary meeting at the request of the company's management.", bodyFont),
                SizedBox(height: 10,),
                _text("The council meeting is valid with the presence of at least half of its members, and decisions are issued by a majority vote of those present. If the votes are equal, the president's vote is decisive.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 24) The Supervisory Board represents the partners in their dealings with the company's management. It is responsible for examining the books, accounts, treasury, securities portfolio, and company assets.", bodyFont),
                SizedBox(height: 10,),
                _text("Each year, he submits to the General Assembly a report on the results of his work, showing any violations and errors he may find in the inventory lists, as well as the reasons that may prevent the distribution of profit shares proposed by the company's management.", bodyFont),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 25) The members of the Supervisory Board have the right to receive the sum of ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: supervisoryBoardSumAmountCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Amount",
                          focusNode: supervisoryBoardSumAmountFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " pounds as an “attendance allowance or reward” to be distributed among them as they see fit.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),

              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Five",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(General Assembly)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 26) The General Assembly represents all partners and may only be convened in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: assemblyCityCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "City",
                          focusNode: assemblyCityFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " (the city in which the company's headquarters are located).",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("(Article 27) Every partner has the right to attend the General Assembly, regardless of the number of shares he represents, whether in person or by appointing another partner to represent him in the Assembly. Each partner has a number of votes estimated by the number of shares he owns or represents, without limitation.", bodyFont),
                
                SizedBox(height: 10,),
                _text("(Article 28) The General Assembly shall be chaired by the Chairman of the Supervisory Board or the Director, as the case may be.", bodyFont),
                SizedBox(height: 10,),
                _text("Or whoever is acting on his behalf, and in his absence, one of his colleagues, chosen by the council, shall preside over it. The president shall appoint a secretary and a vote-counting auditor, provided that the general assembly approves their appointment.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 29) Invitations to attend general assemblies shall be sent by registered letters to each partner at least fifteen days before the date of the meeting.", bodyFont),
                SizedBox(height: 10,),
                _text("Invitation letters must include a statement of the agenda, the meeting place and time.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 30) The General Assembly may not discuss matters other than those included in the agenda shown in the invitation letter. Decisions issued by the General Assembly in accordance with the company contract shall be binding on all partners, including those who are absent, dissenting, or incapacitated.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 31) The General Assembly shall be held every year upon invitation from the company’s management within the six months following the end of the company’s financial year.", bodyFont),
                SizedBox(height: 10,),
                _text("It meets in particular to hear the directors’ report on the company’s activity and financial position, the supervisory board’s report, and to approve, when necessary, the budget and profit and loss statement, to determine the profit shares to be distributed to the partners, to appoint directors or members of the supervisory board and determine their remuneration, and other matters that do not fall within the jurisdiction of the extraordinary general meeting.", bodyFont),
                SizedBox(height: 10,),
                _text("Resolutions of the Ordinary General Assembly shall only be valid if passed by a majority of votes representing at least the share capital. If a quorum is not met for the first meeting, a second General Assembly meeting shall be held within the following thirty days, and its second meeting shall be considered valid regardless of the number of shares represented therein.", bodyFont),
                SizedBox(height: 10,),
                _text("Decisions are issued by a majority vote at least, and in case of a tie, the side on which the president  on prevails", bodyFont),
                SizedBox(height: 10,),
                _text("The invitation to the first meeting may include the date of the second meeting in case a quorum is not reached.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 32) The Extraordinary General Assembly may amend the company's articles of association, except for those relating to increasing the partners' obligations, unless their approval is unanimous.", bodyFont),
                SizedBox(height: 10,),
                _text("ولا تكون قرارات الجمعية صحيحة الا اذا صدرت بموافقة الاغلبية العددية للشركاء الحائزة لثلاثة ارباع راس المال ( على الاقل )", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 33) The Directors may call for an extraordinary general meeting whenever the need arises. The Supervisory Board may issue the invitation if it is requested from the Directors by registered letter and eight days have passed without the Directors issuing the invitation.", bodyFont),
                SizedBox(height: 10,),
                _text("The general assembly may be called at the request of one or more partners representing more than 5% of the capital if they request it from the managers by registered letter and eight days have passed without the managers issuing the invitation.", bodyFont),
                SizedBox(height: 10,),
                _text("The agenda is set by the party that called for the meeting– the directors, the supervisory board, or the partners, as the case may be.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 34) Each partner, during the general assembly meeting, has the right to discuss the matters included in the agenda, and the managers are obligated to answer the partners’ questions to the extent that it does not harm the company’s interests.", bodyFont),
                SizedBox(height: 10,),
                _text("If one of the partners believes that the answer to his question is insufficient, he may appeal to the general assembly, and its decision shall be binding.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 35) The deliberations and decisions of the general assembly shall be recorded in minutes that are registered in a special register with numbered pages, and they shall be signed by the president of the assembly, the secretary, the vote counters, and the auditor. The president of the assembly shall certify copies or extracts of these minutes.", bodyFont),

                SizedBox(height: 10,),


              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Six",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Company Year – Inventory – Final Accounts – Reserve Funds – Profit Distribution)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: bodyFont,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: "(Article 36) The company's fiscal year is twelve calendar months, beginning on the first of ",
                      ),

                      // 👤 Name field
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fiscalYearStartCtrl,
                          font: bodyFont,
                          width: 120,
                          hint: " year",
                          focusNode: fiscalYearStartFocus,
                        ),
                      ),

                      const TextSpan(
                        text: " and ending on the last of ",
                      ),

                      // 💰 Amount field
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: fiscalYearEndCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: " year",
                          focusNode: fiscalYearEndFocus,
                        ),
                      ),

                      const TextSpan(
                        text: "provided that the first year includes the period elapsed from the date of the company's final incorporation until [date].",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                _text("The first general assembly will be held after this year.", bodyFont),
                SizedBox(height: 10,),
                _text("The General Assembly, within 6 months at most from the date of the end of the company's budget, inventory list and profit and loss account, shall submit a report on the company's activity during the fiscal year and its financial position at the end of the same year.", bodyFont),
                SizedBox(height: 10,),
                _text("The budget shall be deposited with the Commercial Registry Office 15 days after the date of its preparation, and any interested party may request to view it there.", bodyFont),
                SizedBox(height: 10,),
                _text("Each partner may, during the fifteen days preceding the convening of the General Assembly, examine these documents himself or through an agent he chooses from among the partners or others, as well as the report of the Supervisory Board.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 38) The company's net annual profits, after deducting all general expenses and other costs, shall be distributed as follows:", bodyFont),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: bodyFont,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: "1- It begins by deducting an amount of (5%) at least from the profits to form a reserve, and this deduction stops when the total reserve reaches an amount equivalent to  ",
                      ),

                      // 👤 Name field
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: reservePercentageCtrl,
                          font: bodyFont,
                          width: 120,
                          hint: " year",
                          focusNode: reservePercentageFocus,
                        ),
                      ),

                      const TextSpan(
                        text: " at least” of the capital, and when the reserve falls below that, it is necessary to return to the deduction.",
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: bodyFont,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text:
                        "2- The amount necessary to distribute the first share of profits, amounting to ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: firstProfitSharePercentageCtrl,
                          font: bodyFont,
                          width: 120,
                          hint: "Profit",
                          focusNode: firstProfitSharePercentageFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " of the capital at least, to the partners on account of the value of their shares, shall then be deducted, provided that if the company’s profits in any year do not allow for the distribution of this share, it shall not be permissible to claim it from the profits of future years.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: bodyFont,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: "3- After the above, ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: managersBonusPercentageCtrl,
                          font: bodyFont,
                          width: 120,
                          hint: "Bonus",
                          focusNode: managersBonusPercentageFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " of the remaining profits (at most) shall be allocated as a reward for the managers.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                _text("4- A percentage of the profits, based on a proposal from the Board of Directors and approval by the General Assembly, shall be distributed to the employees.", bodyFont),
                SizedBox(height: 10,),
                _text("5- The remaining profits shall then be distributed to the partners as an additional share of the profits, or carried forward, based on the proposal of the Board of Directors, to the next year, or shall be an extraordinary reserve, or an extraordinary depreciation fund, or an extraordinary depreciation fund.", bodyFont),
                SizedBox(height: 10,),
                _text("As for losses – if any – they are borne by the partners in proportion to their shares, without obligating any of them to more than the value of his shares.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 39) The reserve shall be used by a decision of the Board of Directors in a manner that benefits the company.", bodyFont),
                SizedBox(height: 10,),
                _text("(Article 40) The profit shares shall be paid to the partners at the place and times determined by the managers.", bodyFont),
                SizedBox(height: 10,),
                _text("With the approval of the Supervisory Board, the managers may distribute an amount from the current year’s profit shares if the profits allocated in the current year allow for it.", bodyFont),
                SizedBox(height: 10,),
                _text("In the auditor", bodyFont),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: bodyFont, color: Colors.black),
                    children: [
                      const TextSpan(
                        text:
                        "(Article 41) The company shall have one or more auditors who meet the conditions stipulated in the Law on the Practice of the Accounting Profession, "
                            "appointed by the General Assembly, which shall determine their fees. Notwithstanding the above, the founders have appointed Mr./ ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: auditorNameCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "name",
                          focusNode: auditorNameFocus,
                        ),
                      ),
                      const TextSpan(
                        text: " residing in ",
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: inlineField(
                          controller: auditorResidenceCtrl,
                          font: bodyFont,
                          width: 100,
                          hint: "Residence",
                          focusNode: auditorResidenceFocus,
                        ),
                      ),
                      const TextSpan(
                        text:
                        " as the company’s chief auditor. The auditor shall be held accountable for the accuracy of the data contained in his report as an agent for all shareholders. "
                            "Each shareholder, during the General Assembly meeting, may discuss the auditor’s report and seek clarification from him regarding what is stated therein. ",
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Seven",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Disputes)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                _text("(Article 42) Disputes that affect the general and common interest may not be brought against the directors or against one of them except in the name of all the partners and pursuant to a decision of the General Assembly.", bodyFont),
                SizedBox(height: 10,),
                _text("Any partner wishing to raise such a dispute must notify the directors by registered letter at least one month before the next general meeting, and the directors must include this proposal in the meeting's agenda.", bodyFont),
                SizedBox(height: 10,),
                _text("If the assembly rejects this proposal, no partner may resubmit it in his personal name. If it is accepted, the general assembly shall appoint one or more delegates to carry out the lawsuit, and all official notices must be directed to them.", bodyFont),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter Eight",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(The company's rope – its liquidation)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                _text("(Article 43) When the company’s term expires or in the event of its dissolution before the specified term, the assembly, at the request of the managers, shall determine the method of liquidation and appoint one or more liquidators and define their powers. The managers’ authority shall end with the appointment of the liquidators, while the general assembly’s authority shall remain in place throughout the liquidation period until the liquidators’ responsibility is discharged.", bodyFont),
              ],
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chapter nine",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFont,
                  ),
                ),
                Text(
                  "(Concluding Provisions)",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                ),
                SizedBox(height: 10,),
                _text("(Article 44) The provisions of the Law on Joint Stock Companies, Limited Partnerships by Shares and Limited Liability Companies referred to and its executive regulations shall apply to matters not specifically addressed in this contract.", bodyFont),
                SizedBox(height: 10,),
                Wrap(
                  children: [
                    Text("(Article 45) This contract shall be registered in the Commercial Register and published in accordance with the law. The partners have authorized Mr./ ", style: TextStyle(fontSize: bodyFont)),
                    // inlineField(controller: auditorNameCtrl, font: bodyFont, width: 100,hint: "DD/MM/YY",focusNode: auditorNameFocus),
                  ],
                ),
                SizedBox(height: 10,),
                _text("Taking all necessary measures in this regard. Expenses, costs, wages, and expenses incurred in establishing the company shall be deducted from the general expenses account.", bodyFont),
              ],
            ),
            Consumer<CompanyContractPdfProvider>(
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
                          final contract = CompanyContractModel(
                            contractDateFormatted: contractDateCtrl.text,
                            parties: [
                              Party(
                                fullName: firstFullNameCtrl.text,
                                profession: firstProfessionCtrl.text,
                                nationality: firstNationalityCtrl.text,
                                birthDate: firstBirthDateCtrl.text,
                                idProof: firstIdProofCtrl.text,
                                residence: firstResidenceCtrl.text,
                              ),
                              Party(
                                fullName: secondFullNameCtrl.text,
                                profession: secondProfessionCtrl.text,
                                nationality: secondNationalityCtrl.text,
                                birthDate: secondBirthDateCtrl.text,
                                idProof: secondIdProofCtrl.text,
                                residence: secondResidenceCtrl.text,
                              ),
                            ],
                            companyName: companyNameCtrl.text,
                            purpose: purposeCtrl.text,
                            durationYears: int.tryParse(durationYearsCtrl.text) ?? 0,
                            centerCity: centerCityCtrl.text,
                            capitalAmount: int.tryParse(capitalAmountCtrl.text) ?? 0,
                            shareValue: int.tryParse(shareValueCtrl.text) ?? 0,
                            totalShares: int.tryParse(totalSharesCtrl.text) ?? 0,
                            cashSharesTotal: int.tryParse(cashSharesTotalCtrl.text) ?? 0,
                            inKindSharesTotal: int.tryParse(inKindSharesTotalCtrl.text) ?? 0,

                              sharesTable: [
                                ShareTable(
                                  name: nameCtrl1.text,
                                  nationality: nationalityCtrl1.text,
                                  cash: int.tryParse(monetaryCtrl1.text) ?? 0,
                                  inKind: int.tryParse(inKindCtrl1.text) ?? 0,
                                  percentage: shareCtrl1.text,
                                ),
                                ShareTable(
                                  name: nameCtrl2.text,
                                  nationality: nationalityCtrl2.text,
                                  cash: int.tryParse(monetaryCtrl2.text) ?? 0,
                                  inKind: int.tryParse(inKindCtrl2.text) ?? 0,
                                  percentage: shareCtrl2.text,
                                ),
                              ],
                            paidCashAmount: int.tryParse(paidCashAmountCtrl.text) ?? 0,
                            inKindContributions: [
                              InKindContribution(
                                partnerName: partnernameCtrl1.text,
                                description: descCtrl1.text,
                              ),
                              InKindContribution(
                                partnerName: partnernameCtrl2.text,
                                description: descCtrl2.text,
                              ),
                            ], // fill from form if needed
                            inKindValuation: int.tryParse(inKindValuationCtrl.text) ?? 0,
                            inKindContributorName: inKindContributorNameCtrl.text,
                            managers: [
                              Manager(fullName: fullnameCtrl1.text, residence: residenceCtrl1.text),

                            ], // fill if needed
                            managerCandidates: [
                              Manager(fullName: fullnameCtrl2.text, residence: residenceCtrl2.text),
                              Manager(fullName: fullnameCtrl3.text, residence: residenceCtrl3.text),
                            ], // fill if needed
                            managerDuration: managerDurationCtrl.text,
                            managersAnnualSalary: int.tryParse(managersAnnualSalaryCtrl.text) ?? 0,
                            supervisionCount: int.tryParse(supervisionCountCtrl.text) ?? 0,
                            supervisionMembers: [
                              SupervisionMember(fullName: fullnameCtrl4.text, residence: residenceCtrl4.text),
                              SupervisionMember(fullName:fullnameCtrl5.text, residence: residenceCtrl5.text),
                              SupervisionMember(fullName: fullnameCtrl6.text, residence: residenceCtrl6.text),
                            ], // fill if needed
                            supervisionTermYears: int.tryParse(supervisionTermYearsCtrl.text) ?? 0,
                            minSharesForSupervision: int.tryParse(minSharesForSupervisionCtrl.text) ?? 0,
                            supervisoryBoardSumAmount: int.tryParse(supervisoryBoardSumAmountCtrl.text) ?? 0,
                            assemblyCity: assemblyCityCtrl.text,
                            fiscalYearStart: fiscalYearStartCtrl.text,
                            fiscalYearEnd: fiscalYearEndCtrl.text,
                            reservePercentage: int.tryParse(reservePercentageCtrl.text) ?? 0,
                            firstProfitSharePercentage: int.tryParse(firstProfitSharePercentageCtrl.text) ?? 0,
                            managersBonusPercentage: int.tryParse(managersBonusPercentageCtrl.text) ?? 0,
                            workersSharePercentage: int.tryParse(workersSharePercentageCtrl.text) ?? 0,
                            auditor: Auditor(
                              fullName: auditorNameCtrl.text,
                              residence: auditorResidenceCtrl.text,
                            ),

                          );


                          // 🔥 STEP 3: generate PDF
                          await provider.generateCompanyPdf(contract);

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
                          child: CircularProgressIndicator(strokeWidth: 2),
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
    required TextEditingController profession,
    required TextEditingController nationality,
    required TextEditingController birthDate,
    required TextEditingController idProof,
    required TextEditingController Residence,

    required FocusNode fullNameFocus,
    required FocusNode professionFocus,
    required FocusNode nationalityFocus,
    required FocusNode birthDateFocus,
    required FocusNode idProofFocus,
    required FocusNode ResidenceFocus,

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
                Text("Name :- ", style: TextStyle(fontSize: font)),
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
                Text("Profession:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: profession,
                  hint: "Profession",
                  focusNode: professionFocus,
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
                Text("Date of Birth:- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: birthDate,
                  hint: "DD/MM/YY",
                  focusNode: birthDateFocus,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Proof of Identity :- ",
                    style: TextStyle(fontSize: font),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 180,
                  child: inlineField(
                    font: font,
                    controller: idProof,
                    hint: "Civil Registry",
                    focusNode: idProofFocus,
                  ),
                ),
              ],
            ),

            Wrap(
              children: [
                Text("Residence :- ", style: TextStyle(fontSize: font)),
                inlineField(
                  font: font,
                  width: 180,
                  controller: Residence,
                  hint: "Civil Registry",
                  focusNode: ResidenceFocus,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  DataRow _dataRow(
      TextEditingController name,
      TextEditingController nationality,
      TextEditingController monetary,
      TextEditingController inKind,
      TextEditingController shares,
      ) {
    return DataRow(
      cells: [
        _editableCell(name, width: 140, hint: 'Name'),
        _editableCell(nationality, width: 120, hint: 'Nationality'),
        _editableCell(monetary, width: 80, hint: 'Amount'),
        _editableCell(inKind, width: 80, hint: 'Amount'),
        _editableCell(shares, width: 80, hint: '%'),
      ],
    );
  }

  DataCell _editableCell(
      TextEditingController controller, {
        double width = 100,
        required String hint,
      }) {
    return DataCell(
      SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
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
    if (contractDateCtrl.text.trim().isEmpty) {
      contractDateFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "contractDate required");
      return false;
    }

    if (firstFullNameCtrl.text.trim().isEmpty) {
      firstFullNameFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstFullName required");
      return false;
    }

    if (firstProfessionCtrl.text.trim().isEmpty) {
      firstProfessionFocus.requestFocus();
      showError(context, "firstProfession required");
      return false;
    }
    if (firstNationalityCtrl.text.trim().isEmpty) {
      firstNationalityFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstNationality required");
      return false;
    }
    if (firstIdProofCtrl.text.trim().isEmpty) {
      firstIdProofFocus.requestFocus();
      showError(context, "firstIdProof required");
      return false;
    }

    if (firstBirthDateCtrl.text.trim().isEmpty) {
      firstBirthDateFocus.requestFocus();
      showError(context, "firstBirthDate required");
      return false;
    }
    if (firstResidenceCtrl.text.trim().isEmpty) {
      firstResidenceFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstResidence required");
      return false;
    }

    if (secondFullNameCtrl.text.trim().isEmpty) {
      secondFullNameFocus.requestFocus();
      showError(context, "secondFullName required");
      return false;
    }

    if (secondProfessionCtrl.text.trim().isEmpty) {
      secondProfessionFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "secondProfession required");
      return false;
    }
    if (secondNationalityCtrl.text.trim().isEmpty) {
      secondNationalityFocus.requestFocus();
      showError(context, "secondNationality required");
      return false;
    }
    if (secondBirthDateCtrl.text.trim().isEmpty) {
      secondBirthDateFocus.requestFocus();
      showError(context, "secondBirthDate required");
      return false;
    }
    if (secondIdProofCtrl.text.trim().isEmpty) {
      secondIdProofFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "secondIdProof required");
      return false;
    }

    if (secondResidenceCtrl.text.trim().isEmpty) {
      secondResidenceFocus.requestFocus();
      showError(context, "secondResidence required");
      return false;
    }




    if (companyNameCtrl.text.trim().isEmpty) {
      companyNameFocus.requestFocus();
      showError(context, " companyName required");
      return false;
    }

    if (purposeCtrl.text.trim().isEmpty) {
      purposeFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "purpose required");
      return false;
    }



    if (durationYearsCtrl.text.trim().isEmpty) {
      durationYearsFocus.requestFocus();
      showError(context, "durationYears required");
      return false;
    }
    if (centerCityCtrl.text.trim().isEmpty) {
      centerCityFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "centerCity required");
      return false;
    }

    if (capitalAmountCtrl.text.trim().isEmpty) {
      capitalAmountFocus.requestFocus();
      showError(context, "capitalAmount required");
      return false;
    }

    if (shareValueCtrl.text.trim().isEmpty) {
      shareValueFocus.requestFocus();
      showError(context, "shareValue required");
      return false;
    }
    if (totalSharesCtrl.text.trim().isEmpty) {
      totalSharesFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "totalShares required");
      return false;
    }
    if (cashSharesTotalCtrl.text.trim().isEmpty) {
      cashSharesTotalFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "cashSharesTotal required");
      return false;
    }

    if (inKindSharesTotalCtrl.text.trim().isEmpty) {
      inKindSharesTotalFocus.requestFocus();
      showError(context, "inKindSharesTotal required");
      return false;
    }

    if (nameCtrl1.text.trim().isEmpty) {
      name1Focus.requestFocus();
      showError(context, "name1 required");
      return false;
    }
    if (nationalityCtrl1.text.trim().isEmpty) {
      nationality1Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "nationality1 required");
      return false;
    }
    if (monetaryCtrl1.text.trim().isEmpty) {
      monetary1Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "monetary1 required");
      return false;
    }

    if (inKindCtrl1.text.trim().isEmpty) {
      inKind1Focus.requestFocus();
      showError(context, "inKind1 required");
      return false;
    }
    if (shareCtrl1.text.trim().isEmpty) {
      share1Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "share1 required");
      return false;
    }


    if (nameCtrl2.text.trim().isEmpty) {
      name2Focus.requestFocus();
      showError(context, "name2 required");
      return false;
    }
    if (nationalityCtrl2.text.trim().isEmpty) {
      nationality2Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "nationality2 required");
      return false;
    }

    if (monetaryCtrl2.text.trim().isEmpty) {
      monetary2Focus.requestFocus();
      showError(context, "monetary2 required");
      return false;
    }

    if (inKindCtrl2.text.trim().isEmpty) {
      inKind2Focus.requestFocus();
      showError(context, "inKind2 required");
      return false;
    }
    if (shareCtrl2.text.trim().isEmpty) {
      share2Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "share2 required");
      return false;
    }
    if (paidCashAmountCtrl.text.trim().isEmpty) {
      paidCashAmountFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "paidCashAmount required");
      return false;
    }
    if (partnernameCtrl1.text.trim().isEmpty) {
      partnername1Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "partnername1 required");
      return false;
    }

    if (partnernameCtrl2.text.trim().isEmpty) {
      partnername2Focus.requestFocus();
      showError(context, "partnername2 required");
      return false;
    }

    if (descCtrl1.text.trim().isEmpty) {
      desc1Focus.requestFocus();
      showError(context, "desc1 required");
      return false;
    }
    if (descCtrl2.text.trim().isEmpty) {
      desc2Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "desc2 required");
      return false;
    }
    //here
    if (inKindValuationCtrl.text.trim().isEmpty) {
      inKindValuationFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "inKindValuation required");
      return false;
    }

    if (inKindContributorNameCtrl.text.trim().isEmpty) {
      inKindContributorNameFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "inKindContributorName required");
      return false;
    }

    if (fullnameCtrl1.text.trim().isEmpty) {
      fullame1Focus.requestFocus();
      showError(context, "fullname1 required");
      return false;
    }
    if (fullnameCtrl2.text.trim().isEmpty) {
      fullname2Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "fullname2 required");
      return false;
    }
    if (fullnameCtrl3.text.trim().isEmpty) {
      fullname3Focus.requestFocus();
      showError(context, "fullname3 required");
      return false;
    }

    if (fullnameCtrl4.text.trim().isEmpty) {
      fullname4Focus.requestFocus();
      showError(context, "fullname4 required");
      return false;
    }
    if (fullnameCtrl5.text.trim().isEmpty) {
      fullname5Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "fullname5 required");
      return false;
    }

    if (fullnameCtrl6.text.trim().isEmpty) {
      fullname6Focus.requestFocus();
      showError(context, "FullName required");
      return false;
    }

    if (residenceCtrl1.text.trim().isEmpty) {
      residence1Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "residence required");
      return false;
    }
    if (residenceCtrl2.text.trim().isEmpty) {
      residence2Focus.requestFocus();
      showError(context, "residence required");
      return false;
    }
    if (residenceCtrl3.text.trim().isEmpty) {
      residence3Focus.requestFocus();
      showError(context, "residence required");
      return false;
    }
    if (residenceCtrl4.text.trim().isEmpty) {
      residence4Focus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "residence required");
      return false;
    }

    if (residenceCtrl5.text.trim().isEmpty) {
      residence5Focus.requestFocus();
      showError(context, "residence required");
      return false;
    }




    if (residenceCtrl6.text.trim().isEmpty) {
      residence6Focus.requestFocus();
      showError(context, " residence required");
      return false;
    }

    if (managerDurationCtrl.text.trim().isEmpty) {
      managerDurationFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "managerDuration required");
      return false;
    }



    if (managersAnnualSalaryCtrl.text.trim().isEmpty) {
      managersAnnualSalaryFocus.requestFocus();
      showError(context, "managersAnnualSalary required");
      return false;
    }
    if (supervisionCountCtrl.text.trim().isEmpty) {
      supervisionCountFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "supervisionCount required");
      return false;
    }

    if (supervisionTermYearsCtrl.text.trim().isEmpty) {
      supervisionTermYearsFocus.requestFocus();
      showError(context, "supervisionTermYears required");
      return false;
    }

    if (minSharesForSupervisionCtrl.text.trim().isEmpty) {
      minSharesForSupervisionFocus.requestFocus();
      showError(context, "minSharesForSupervision required");
      return false;
    }
    if (supervisoryBoardSumAmountCtrl.text.trim().isEmpty) {
      supervisoryBoardSumAmountFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "supervisoryBoardSumAmount required");
      return false;
    }
    if (assemblyCityCtrl.text.trim().isEmpty) {
      assemblyCityFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "assemblyCity required");
      return false;
    }

    if (fiscalYearStartCtrl.text.trim().isEmpty) {
      fiscalYearStartFocus.requestFocus();
      showError(context, "fiscalYearStart required");
      return false;
    }

    if (fiscalYearEndCtrl.text.trim().isEmpty) {
      fiscalYearEndFocus.requestFocus();
      showError(context, "fiscalYearEnd required");
      return false;
    }
    if (reservePercentageCtrl.text.trim().isEmpty) {
      reservePercentageFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "reservePercentage required");
      return false;
    }
    if (firstProfitSharePercentageCtrl.text.trim().isEmpty) {
      firstProfitSharePercentageFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "firstProfitSharePercentage required");
      return false;
    }

    if (managersBonusPercentageCtrl.text.trim().isEmpty) {
      managersBonusPercentageFocus.requestFocus();
      showError(context, "managersBonusPercentage required");
      return false;
    }
    // if (workersSharePercentageCtrl.text.trim().isEmpty) {
    //   workersSharePercentageFocus.requestFocus(); // 🔥 cursor yahin jayega
    //   showError(context, "workersSharePercentage required");
    //   return false;
    // }


    if (auditorNameCtrl.text.trim().isEmpty) {
      auditorNameFocus.requestFocus();
      showError(context, "uditorName required");
      return false;
    }
    if (auditorResidenceCtrl.text.trim().isEmpty) {
      auditorResidenceFocus.requestFocus(); // 🔥 cursor yahin jayega
      showError(context, "auditorResidence required");
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
