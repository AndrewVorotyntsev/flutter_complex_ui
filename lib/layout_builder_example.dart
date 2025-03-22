import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ResponsiveLayoutExample()));

class ResponsiveLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Layout with LayoutBuilder')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Определяем, сколько элементов показывать в зависимости от ширины экрана
          int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 20, // Количество элементов в сетке
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blueAccent,
                child: Center(child: Text('Item $index', style: TextStyle(color: Colors.white, fontSize: 16))),
              );
            },
          );
        },
      ),
    );
  }
}
