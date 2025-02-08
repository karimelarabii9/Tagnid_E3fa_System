import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlySonExemptionResultScreenFinal extends StatelessWidget {
  final String result;

  const OnlySonExemptionResultScreenFinal({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "قرار الإعفاء",
          style: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.white,
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 24, // Increased font size
          ),
        ),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                result,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 26, // Increased font size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.green.shade800,
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1.5, color: Colors.grey.shade300),
            SizedBox(height: 20),

            // Section title for required documents
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الأوراق المطلوبة:",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 22, // Increased font size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.blue.shade800,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 15),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // Align items to right
                  children: [
                    _buildRequiredDocuments("١. قيد عائلي"),
                    _buildRequiredDocuments("٢. شهادات ميلاد الأسرة."),
                    _buildRequiredDocuments("٣. بطاقة الشاب و الوالد."),
                    _buildRequiredDocuments("٤. بطاقة عسكرية ٧ جند."),
                    _buildRequiredDocuments(
                      "٥. شهادة وفاة إذا كان الأب متوفي.",
                      isRed: true,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم إرسال طلب الطباعة!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "طباعة",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20, // Increased font size
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Button to open the link
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Uri _url = Uri.parse('https://kaid-qr.vercel.app/');
                if (await canLaunchUrl(_url)) {
                  await launchUrl(_url);
                } else {
                  throw 'Could not launch $_url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "لإرسال الأوراق ",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20, // Increased font size
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequiredDocuments(String document, {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Align row content to right
        children: [
          Expanded(
            child: Text(
              document,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.bold, // Bold text
                color: isRed ? Colors.red : Colors.black87,
              ),
              textAlign: TextAlign.right, // Align text to right
            ),
          ),
          Icon(Icons.check_circle,
              color: Colors.green.shade600, size: 20), // Slightly larger icon
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
