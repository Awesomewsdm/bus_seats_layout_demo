import 'package:flutter/material.dart';

class SeatStatus extends StatelessWidget {
  const SeatStatus({
    Key? key,
    required this.boxColor,
    required this.iconLabel,
    this.icon,
    this.border,
  }) : super(key: key);
  final Color boxColor;
  final String iconLabel;
  final Widget? icon;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            border: border,
            shape: BoxShape.rectangle,
            color: boxColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
          ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          iconLabel,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
