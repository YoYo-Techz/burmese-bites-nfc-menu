import 'package:bbmenu/custom_banner_image.dart';
import 'package:flutter/material.dart';

String _imageUrl =
    "https://cdn.i-scmp.com/sites/default/files/d8/images/methode/2019/09/04/80e5a9ca-ce2f-11e9-9cec-db56b3c139e7_image_hires_182307.JPG";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    List<String> tabList = ['Meal', 'Beverage', 'Special', 'Snack'];
    List<String> data = [
      'မုန့်ဟင်းခါး',
      'ဘိန်းမုန့်',
      'ဝက်သားနပ်',
      'ဝက်သား ပုန်းရည်ကြီး',
      'ပုဇွန်ဆီပြန်ချက်',
      'ပြည်ကြိးငါးချက်',
      'ဆိတ်လက်ဖတ်ထောင်း',
      'ပဲပြုတ်ထမင်းသုတ်'
    ];
    List<String> bannerList = [
      'ဆိတ်သားခြောက်ထောင်း',
      'Beverage',
      'Special',
      'Snack'
    ];
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo/logo.png'),
          actions: [
            const SizedBox(width: 10),
            Image.asset('assets/logo/logo.png'),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Search"), Icon(Icons.search)],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Today Special Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        bannerList.map((text) => _banner(title: text)).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: tabList.map((text) => _tab(text: text)).toList(),
                ),
                GridView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(_imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0.9,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("100 BHT",
                                      style: TextStyle(
                                          color: Color(0xff4CAF50),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          top: 4,
                                          bottom: 4,
                                          left: 10,
                                          right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff4CAF50)),
                                      child: const Text(
                                        "Details",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tab({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff4CAF50),
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _banner({required String title}) {
    return Card(
      child: SizedBox(
          height: 120,
          child: AspectRatio(
              aspectRatio: 289 / 120,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 173,
                      child: CustomPaintWithImage(
                        imageUrl: _imageUrl,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 9,
                    top: 10,
                    bottom: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            "လတ်ဆတ်သော ဆိတ်သားခြောက်ကို secret ingredient ဖြင့် သန့်ရှင်းစွာ ပြု့လုပ်ထားသည်",
                            style: TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Text(
                          "500 Bhat",
                          style: TextStyle(
                              fontSize: 6, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "11/03/2024",
                          style: TextStyle(
                              fontSize: 6, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
