import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('CustomSingleChildLayout Example')), body: CustomLayoutExample()),
    );
  }
}

class CustomLayoutExample extends StatefulWidget {
  const CustomLayoutExample({super.key});

  @override
  State<CustomLayoutExample> createState() => _CustomLayoutExampleState();
}

class _CustomLayoutExampleState extends State<CustomLayoutExample> {
  double sizeFactor = 1;
  double xShift = 0;
  double yShift = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                sizeFactor += 1;
              });
            },
            onLongPress: () {
              setState(() {
                sizeFactor -= 1;
              });
            },
            child: CustomSingleChildLayout(
              delegate: MyCustomLayoutDelegate(sizeFactor: sizeFactor, xShift: xShift, yShift: yShift),
              child: FlutterLogo(),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Верхняя стрелка
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {
                    print('Вверх');
                    yShift -= 1;
                    setState(() {});
                  },
                ),
              ],
            ),
            // Стрелки влево и вправо
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    print('Влево');
                    xShift -= 1;
                    setState(() {});
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    print('Вправо');
                    xShift += 1;
                    setState(() {});
                  },
                ),
              ],
            ),
            // Нижняя стрелка
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {
                    print('Вниз');
                    yShift += 1;
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class MyCustomLayoutDelegate extends SingleChildLayoutDelegate {
  final double sizeFactor;
  final double xShift;
  final double yShift;

  MyCustomLayoutDelegate({required this.sizeFactor, this.xShift = 0, this.yShift = 0});

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: 100 * sizeFactor, height: 100 * sizeFactor);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(100 * sizeFactor * xShift, 100 * sizeFactor * yShift);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => true;
}
