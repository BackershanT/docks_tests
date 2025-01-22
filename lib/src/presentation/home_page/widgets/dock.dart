import 'package:flutter/material.dart';
import 'package:animate_on_hover/animate_on_hover.dart';

class Dock extends StatefulWidget {
  const Dock(
      {super.key,
        required this.items,
        required Tooltip Function(dynamic e) builder});
  final List<IconData> items;
  @override
  State<Dock> createState() => _DockState();
}

class _DockState extends State<Dock> {
  late List<IconData> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items.toList();
  }

  @override
  Widget build(BuildContext context) {
    // Dock Design Mentioning color,design,children_list
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _items
            .asMap()
            .entries
            .map((entry) => _buildDraggableItem(entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _buildDraggableItem(int index, IconData icon) {
    return DragTarget<int>(
      onAcceptWithDetails: (details) {
        setState(() {
          final fromIndex = details.data;
          final movedIcon = _items.removeAt(fromIndex);
          _items.insert(index, movedIcon);
        });
      },
      builder: (context, candidateData, rejectData) {
        return Draggable<int>(
          data: index,
          feedback: _animatedDockItem(
            context,
            icon,
            isDragging: true,
          ),
          childWhenDragging: const SizedBox.shrink(),
          child: _animatedDockItem(context, icon),
        );
      },
    );
  }

  Widget _animatedDockItem(BuildContext context, IconData icon,
      {bool isDragging = false}) {
    //Drag Builder class mentioning animation,increasesizeonhover,animatedContainer property
    return GestureDetector(
        onTap: () {},
        child: AnimatedScale(
            scale: isDragging ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Padding(
                padding: EdgeInsets.all(15),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    constraints:
                    const BoxConstraints(minWidth: 64, minHeight: 64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors
                          .primaries[icon.hashCode % Colors.primaries.length],
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: Icon(icon, color: Colors.white, size: 32),
                        ))))).increaseSizeOnHover(1.25));
  }
}
