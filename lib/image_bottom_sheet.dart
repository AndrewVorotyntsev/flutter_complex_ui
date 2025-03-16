import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showFlexibleBottomSheet<void>(
                  minHeight: 0.5,
                  initHeight: 0.5,
                  maxHeight: 1,
                  anchors: [0.1, 0.5, 1],
                  context: context,
                  bottomSheetBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  bottomSheetColor: Colors.white,
                  builder: (context, controller, offset) {
                    return ImageBottomSheet(scrollController: controller, bottomSheetOffset: offset);
                  },
                );
              },
              child: const Text('Flexible Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const ImageBottomSheet({super.key, required this.scrollController, required this.bottomSheetOffset});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          pinned: true, // позволяет закрепить заголовок
          expandedHeight: (231 * (2 * bottomSheetOffset - 1)), // начальная высота
          collapsedHeight: 60 + (bottomSheetOffset == 1 ? 20 : 0),
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (bottomSheetOffset > 0.5)
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    height: 231 * (2 * bottomSheetOffset - 1),
                    width: double.infinity,
                    // height: bottomSheetOffset * 100,
                    child: Image.network(
                      'https://i.pinimg.com/originals/6c/96/fc/6c96fc182de7cf0f94da2b7ec111c6ab.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(width: 30, height: 2, color: Colors.grey),
                    SizedBox(height: 10),
                    Text('Heading', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return ListTile(title: Text('Элемент списка #$index'));
          }, childCount: 30),
        ),
      ],
    );
  }
}
