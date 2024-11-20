import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String selectedItem;
  final Map<String, int> items;
  final ValueChanged<String?> onSelected;

  const Dropdown({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedItem,
      items: items.keys.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onSelected,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
