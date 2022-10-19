import 'package:flutter/material.dart';

class ListItemSelector extends StatefulWidget {
  const ListItemSelector({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.radius,
  });

  final VoidCallback onTap;
  final double? radius;
  final bool isSelected;

  @override
  State<ListItemSelector> createState() => _ListItemSelectorState();
}

class _ListItemSelectorState extends State<ListItemSelector> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;
    final radius_ = widget.radius ?? 10.0;
    final boxBorder = BorderSide(color: Colors.grey, width: radius_ * 0.05);

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: radius_,
        width: radius_,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.grey : Colors.black54,
          border: Border(
            top: boxBorder,
            bottom: boxBorder,
            left: boxBorder,
            right: boxBorder,
          ),
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
