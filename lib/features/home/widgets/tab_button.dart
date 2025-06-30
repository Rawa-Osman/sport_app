import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final int index;
  final Function(
    int selectedIndex,
  ) onPressed;

  const TabButton({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(index);
        },
        child: Container(
         
          height: MediaQuery.of(context).size.height * 0.05,
        
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF86F14D), Color(0xFFE6FF48)],
            ),
            border: const Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
