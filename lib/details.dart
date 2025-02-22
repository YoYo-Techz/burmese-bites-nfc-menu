import 'package:flutter/material.dart';

String _imageUrl =
    "https://cdn.i-scmp.com/sites/default/files/d8/images/methode/2019/09/04/80e5a9ca-ce2f-11e9-9cec-db56b3c139e7_image_hires_182307.JPG";

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 5 / 3,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: NetworkImage(_imageUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("ဆိတ်သားခြောက်ထောင်း"),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("70 Baht", style: TextStyle(color: Colors.red)),
                  Text("11/3/2025"),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Allergy Notice"),
                    SizedBox(height: 10),
                    Text("peanuts , tree nuts, soy, milk, eggs, and wheat."),
                    SizedBox(height: 10),
                    Text("Please inform us if you have any allergies.",
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "သန့်ရှင်းလတ်ဆက် သော ဆိတ်သား ခြောက်အား နူးညံ၍ မွနေအောင် ထောင်းကာ၊ လတ်ဆက်သော ငရုတ်သီးစိမ်း၊ ကြက်သွန်နီ၊ ကြက်သွန်ဖြူ နှင့် အချိုးကျ ရောနှယ်ကာ အရည်ရွှမ်းသော သံပုရာရည် ဖြူး၍ တည်ခင်း ပေးသော ချို၊ ချဥ်၊ ငံ၊ စပ် စုံလျှင်လှသည့် ဟင်းပွဲ တစ်ပွဲပင်ဖြစ်သည်။ အဖျော်ယမကာ များနှင့် လွန်စွာလိုက်ဖက်၍ ခံတွင်းပျက်နေသူ မိဘပြည် သူများအတွက်လဲ green tea လေးသောက်၍ စားသုံး နိုင်ပါသည်",
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
