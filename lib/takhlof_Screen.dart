import 'package:flutter/material.dart';

class TakhlofScreen extends StatelessWidget {
  final String result;

  const TakhlofScreen({super.key, required this.result});

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
                  color: Colors.red.shade700,
                ),
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Text(
                "هذا الشاب متخلف عن أداء الخدمة العسكرية",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.red.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Text(
                "ارجو التوجه لمنطقة التجنيد التابعة لك لتسوية موقفك الجنائي",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
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
                    _buildRequiredDocuments("١. فيش جنائي موجه للتجنيد"),
                    _buildRequiredDocuments("٢. اصل شهادة ميلاد كمبيوتر حديثة"),
                    _buildRequiredDocuments("٣. بطاقة شخصية سارية"),
                    _buildRequiredDocuments(
                        "٤. في حالة عدم وجود رقم ثلاثي يتم احضار نموذج تأكيد بيانات من مصلحة الاحوال المدنية"),
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
                      color: Colors.white),
                ),
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
