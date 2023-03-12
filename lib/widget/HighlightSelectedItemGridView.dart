import 'package:flutter/material.dart';

// highlight grid item when pressing item
// inspired by navigation bar
// 22/10/07 edited by Charlie

class HighlightSelectedItemGridView extends StatefulWidget {
  const HighlightSelectedItemGridView({Key? key, required this.itemList}) : super(key: key);

  final List<String> itemList;

  @override
  State<HighlightSelectedItemGridView> createState() => _HighlightSelectedItemGridViewState();
}

class _HighlightSelectedItemGridViewState extends State<HighlightSelectedItemGridView> {
  int selectedIndex = -1;
  final List<bool> clicked = List<bool>.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1),
        itemCount: widget.itemList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: BorderSide(
                  color: selectedIndex == index
                      ? Colors.amber
                      : Colors.transparent,
                  width: 3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: RoundedCornerImage(path: widget.itemList[index])));
  }
}

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8), child: Image.asset(path));
  }
}
