import 'package:flutter/material.dart';
import 'cache_helper.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int zekrIndex = 0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'سبح اسم ربك الأعلى',
  ];

  @override
  void initState() {
    super.initState();
    counter = CacheHelper.getInt('sebhaCounter');
    zekrIndex = CacheHelper.getInt('zekrIndex');
  }

  void onTasbeeh() {
    setState(() {
      counter++;

      if (counter == 30) {
        counter = 0;
        zekrIndex++;

        if (zekrIndex == azkar.length) {
          zekrIndex = 0;
        }
      }

      CacheHelper.saveInt('sebhaCounter', counter);
      CacheHelper.saveInt('zekrIndex', zekrIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Background.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.55),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                azkar[zekrIndex],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: onTasbeeh,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Sebha.png',
                      width: 200,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        counter.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
