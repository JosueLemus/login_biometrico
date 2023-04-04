import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final Color backgroundColor;
  final Color tintColor;
  final String text;
  final IconData icon;
  final Function onTap;
  const CustomButton({
    super.key,
    required this.context,
    required this.backgroundColor,
    required this.tintColor,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: tintColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(icon, color: tintColor)
          ],
        ),
      ),
    );
  }
}
