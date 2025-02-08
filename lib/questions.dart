import 'package:Tagnid_E3fa_System/OnlyMotherSonExemptionResultScreenFinal.dart';
import 'package:Tagnid_E3fa_System/OnlySonExemptionResultScreenFinal.dart';
import 'package:flutter/material.dart';
import 'package:Tagnid_E3fa_System/takhlof_Screen.dart';
import 'package:Tagnid_E3fa_System/exScreen.dart';
import 'package:Tagnid_E3fa_System/exScreen2.dart';
import 'package:Tagnid_E3fa_System/tagnid.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  Map<String, dynamic> answers = {
    "hasBrothers": null,
    "hasFatherHalfBrothers": null,
    "hasMotherHalfBrothers": null,
    "fatherAlive": null,
    "fatherAge": null,
    "userAge": null,
    "hasMotherHalfBrother": null,
    "isMotherHalfBrotherOlder": null, // السؤال الجديد
  };

  final List<Map<String, dynamic>> questions = [
    {
      "question": "هل لديك إخوة ذكور أشقاء (من نفس الأب والأم)؟",
      "key": "hasBrothers",
      "options": [true, false],
    },
    {
      "question": "هل لديك إخوة ذكور غير أشقاء من الأب؟",
      "key": "hasFatherHalfBrothers",
      "options": [true, false],
    },
    {
      "question": "ما هي حالة والدتك؟",
      "key": "motherStatus",
      "options": ["متزوجة", "مطلقة", "أرملة"],
    },
    {
      "question": "هل لديك إخوة ذكور غير أشقاء من الأم؟",
      "key": "hasMotherHalfBrothers",
      "options": [true, false],
    },
    {
      "question": "هل أخ الغير شقيق أكبر منك؟", // السؤال الجديد
      "key": "isMotherHalfBrotherOlder",
      "options": [true, false],
    },
    {
      "question": "هل والدك لا يزال على قيد الحياة؟",
      "key": "fatherAlive",
      "options": [true, false],
    },
    {
      "question": "كم عمر والدك؟",
      "key": "fatherAge",
      "options": ["أقل من 60 سنة", "60 سنة أو أكثر"],
    },
    {
      "question": "كم عمرك؟",
      "key": "userAge",
      "options": ["أقل من 30 سنة", "30 سنة أو أكثر"],
    },
  ];

  void checkExemption() {
    // التحقق من حالات الإعفاء المختلفة
    if (checkOnlySonExemption()) return;
    if (checkOnlyMotherSon()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TagnidPapers(result: "❌ لا تستحق إعفاء ❌"),
      ),
    );
  }

  bool checkOnlySonExemption() {
    if (answers["hasBrothers"] == false &&
        answers["hasFatherHalfBrothers"] == false &&
        answers["hasMotherHalfBrothers"] == false &&
        answers['motherStatus'] == "متزوجة") {
      if (answers["fatherAge"] == "60 سنة أو أكثر" ||
          answers["userAge"] == "30 سنة أو أكثر" ||
          answers['fatherAlive'] == false) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnlySonExemptionResultScreenFinal(
                result: "🎉 تستحق إعفاء نهائي (الابن الوحيد) 🎉"),
          ),
        );
        return true;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnlySonExemptionResultScreen(
                result: "✅ تستحق إعفاء مؤقت (الابن الوحيد) ✅"),
          ),
        );
        return true;
      }
    }
    return false;
  }

  bool checkOnlyMotherSon() {
    if (answers["motherStatus"] == "أرملة" ||
        answers["motherStatus"] == "مطلقة") {
      if (answers["hasMotherHalfBrothers"] == false ||
          (answers["hasMotherHalfBrothers"] == true)) {
        if (answers["userAge"] == "30 سنة أو أكثر") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TakhlofScreen(
                result: "❌ لا تستحق إعفاء ❌",
              ), // Redirect to TakhlofTagnid page
            ),
          );
          return true;
        }
        // إعفاء نهائي إذا كانت الأم أرملة
        if (answers["motherStatus"] == "أرملة") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnlyMotherSonExemptionResultScreenFinal(
                  result: "🎉 تستحق إعفاء نهائي (العائل لولدته الأرملة) 🎉"),
            ),
          );
          return true;
        }

        // إعفاء مؤقت إذا كانت الأم مطلقة
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnlyMotherSonExemptionResultScreen(
                result: "🎉 تستحق إعفاء مؤقت (العائل لولدته المطلقة) 🎉"),
          ),
        );
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // زيادة ارتفاع الـ AppBar
        title: Stack(
          alignment: Alignment.center,
          children: [
            // النصوص على أقصى اليمين
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "هيــئة التنـظيـم والإدارة ق.م",
                    style: TextStyle(
                        fontFamily: 'Cairo', color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "إدارة التجـنـيــــد والتــعـبـئــة",
                    style: TextStyle(
                        fontFamily: 'Cairo', color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "منطـقة تجنيد وتعبئة القاهرة",
                    style: TextStyle(
                        fontFamily: 'Cairo', color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            // العنوان في المنتصف
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "منظومة فحص الإعفاء من التجنيد",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 10), // Adjust position
            child: Image.asset(
              'assets/photo.png', // تأكد من إضافة الصورة إلى مجلد assets
              fit: BoxFit.contain, // يضمن أن الصورة تتناسب مع الـ AppBar
              width: 95, // تعيين عرض الصورة
              height: 95, // تعيين ارتفاع الصورة
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 5,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...questions.map((q) {
                  // تحقق من إظهار السؤال بناءً على الشرط
                  if (q["key"] == "isMotherHalfBrotherOlder" &&
                      answers["hasMotherHalfBrothers"] == false) {
                    return SizedBox(); // إخفاء السؤال إذا لم يكن هناك أخ غير شقيق من الأم
                  }
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          q["question"],
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        ...q["options"].map<Widget>((option) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: option,
                                  groupValue: answers[q["key"]],
                                  onChanged: (value) {
                                    setState(() {
                                      answers[q["key"]] = value;
                                    });
                                  },
                                ),
                                Text(
                                  option == true
                                      ? "نعم"
                                      : option == false
                                          ? "لا"
                                          : option.toString(),
                                  style: TextStyle(
                                      fontFamily: "Cairo", fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: checkExemption,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Change text color
                    backgroundColor: Colors.blue.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(fontFamily: "Cairo", fontSize: 18),
                  ),
                  child: Text("تحقق من الإعفاء"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
