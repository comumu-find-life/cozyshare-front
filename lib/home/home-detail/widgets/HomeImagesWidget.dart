
import 'package:flutter/cupertino.dart';

class HomeImagesWidget extends StatelessWidget {
  const HomeImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: PageView(
        children: [
          Image.asset(
            "assets/images/test/home.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/test/home1.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/test/home2.png",
            fit: BoxFit.cover,
          ),

          // 여러 개의 이미지를 추가할 수 있습니다.
        ],
      ),
    );
  }
}
