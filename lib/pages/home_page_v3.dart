import 'package:flutter/material.dart';
import 'package:password_generator_mobile/components/card_widget.dart';

class HomePageV3 extends StatelessWidget {
  const HomePageV3({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeigth = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenHeigth >= 600;
    final minRows = isLargeScreen ? 2 : 1;
    final List<String> titles = [
      'Basic Password',
      'Choose Length',
      'Customize password',
      'Exact password',
      'Iphone password'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select type of password'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: isLargeScreen ? const NeverScrollableScrollPhysics() : null,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: screenWidth / (screenHeigth*0.5),
              mainAxisExtent: screenHeigth * 0.5 / minRows
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/basic');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/length');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/custom');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/exact');
                      break;
                    case 4:
                      Navigator.pushNamed(context, '/iphone');
                      break;
                  }
                },
                child: CardWidget(title: titles[index]),
              );
            }
        );
      }
    ),
    );
  }
}