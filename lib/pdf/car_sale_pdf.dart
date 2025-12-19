import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<pw.Document> generateCarSalePdf({
  // Date
  required String day,
  required String date,

  // First party
  required String fullName,
  required String nationality,
  required String address,
  required String department,
  required String governorate,
  required String familyId,
  required String civilRegistry,

  // Car
  required String carNumber,
  required String make,
  required String model,
  required String engine,
  required String chassis,

  // Price
  required String price,
  required String priceText,

  // Signatures
  required String firstParty,
  required String secondParty,

  // Notary
  required String office,
  required String recordNumber,
  required String year,
  required String dayOfMonth,
  required String dateFormatted,
  required String notaryName,
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(24),
      build: (context) => [

        _title("Car Sale Contract"),

        _text("Article 10 of the Traffic Law and Article 227 of its Implementing Regulations"),
        _space(),

        _text("On the day of $day corresponding to $date"),
        _space(height: 16),

        // FIRST PARTY
        _section("( First Party )"),
        _text("Mr./ $fullName"),
        _text("$nationality national residing at $address"),
        _text("District: $department"),
        _text("Governorate: $governorate"),
        _text("Family card number: $familyId"),
        _text("Civil Registry: $civilRegistry"),

        _space(height: 20),

        // SECOND PARTY
        _section("( Second Party )"),
        _text("Mr./ $secondParty"),

        _space(height: 20),

        // ARTICLE 1
        _section("(Article 1)"),
        _text(
          "The first party sold to the second party the car number $carNumber, "
              "make $make, model $model, engine number $engine, chassis number $chassis.",
        ),

        _space(),

        // ARTICLE 2
        _section("(Article 2)"),
        _text(
          "This sale was made for a price of $price only ($priceText), "
              "fully paid upon signing this contract.",
        ),
        _space(),

        // ARTICLE 2
        _section("(Article 3)"),
        _text(
          "The first party undertakes to deliver the car to the second party immediately upon signing this contract, provided that the first party pays any fines incurred up to the day before delivery,"
        ),
        _space(),

        // ARTICLE 2
        _section("(Article 4)"),
        _text("The second party acknowledges that he has thoroughly inspected the car, eliminating any ambiguity, and has examined and tested it before contracting, and has agreed to deal with it on this basis and has no recourse against the first party in this regard."),
        _space(),

        // ARTICLE 2
        _section("(Article 5)"),
        _text("The second party becomes civilly and criminally responsible for the car as soon as he takes possession of it."),
        _space(),

        // ARTICLE 2
        _section("(Article 6)"),
        _text("The first party acknowledges that he is the owner of the car and that he has the right to dispose of it without any restrictions, and he guarantees against any legal claims issued to the second party by third parties, provided that he notifies him of this in a timely manner."),
        _space(),

        // ARTICLE 2
        _section("(Article 7)"),
       _text("This contract is deposited after the signatures contained in the vehicle file have been authenticated with the traffic department that issues the operating license, and each party has the right to obtain a copy of it."),

        _space(height: 20),

        // SIGNATURES
        _section("Signatures"),
        _text("First Party: $firstParty"),
        _text("Second Party: $secondParty"),

        _space(height: 20),

        // CERTIFICATION
        _section("Certification Report"),
        _text("Notary Office: $office"),
        _text("Certification Report No: $recordNumber of year $year"),
        _text("On the day of $dayOfMonth corresponding to $dateFormatted"),
        _text("Notary Name: $notaryName"),
      ],
    ),
  );

  return pdf;
}

/* ---------------- HELPERS ---------------- */

pw.Widget _title(String text) => pw.Center(
  child: pw.Text(
    text,
    style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
  ),
);

pw.Widget _section(String text) => pw.Padding(
  padding: const pw.EdgeInsets.only(top: 10, bottom: 4),
  child: pw.Text(
    text,
    style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
  ),
);

pw.Widget _text(String text) =>
    pw.Text(text, style: const pw.TextStyle(fontSize: 12));

pw.Widget _space({double height = 10}) =>
    pw.SizedBox(height: height);
