import 'package:flutter/material.dart';
import 'package:kpr_todo_app/constants/theme.dart';

class CompletedCard extends StatelessWidget {
  const CompletedCard({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      decoration: const BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.clip),
              ),
              Text(
                subTitle,
                softWrap: true,
                style: const TextStyle(
                    color: kSubTitleColor,
                    fontSize: 11,
                    overflow: TextOverflow.clip),
              )
            ],
          ),
          Image.asset("assets/icons/CompletedCheckCircle.png"),
        ],
      ),
    );
  }
}
