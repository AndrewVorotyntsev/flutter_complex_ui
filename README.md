# complex_ui

A new Flutter project.

## Image Bottom Sheet

https://github.com/user-attachments/assets/93f851ec-0b39-40d6-9e2b-cf9ae98a2b8a

## CustomSingleChildLayout

CustomSingleChildLayout можно использовать чтобы задавать любые размеры и позиционирования для виджета.

Для его использования необходимо создать реализацию SingleChildLayoutDelegate.
В ней нужно определить три метода
- `BoxConstraints getConstraintsForChild(BoxConstraints constraints)` который принимает внешние ограничения и позволяет их переопределить.

- `Offset getPositionForChild(Size size, Size childSize)` который принимает внешний размер и размер самого виджета для того, чтобы задать позицию виджета.

- `bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate)` - нужно ли перерисовывать при изменении параметров.

Для примера был создан виджет, который позволяет увеличивать свой размер при двойном тапе и уменьшать при долгом тапе. Также есть стрелки для позиционирования виджета.

https://github.com/user-attachments/assets/9ae01306-fd84-48a5-ac5d-4c5aada128ed

