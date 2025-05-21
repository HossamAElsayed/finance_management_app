import 'package:finance_management_app/core/theme/app_theme.dart';
import 'package:finance_management_app/models/card.dart';
import 'package:flutter/material.dart';

class BankCard extends StatefulWidget {
  final CardModel card;

  const BankCard(this.card, {super.key});

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  @override
  Widget build(BuildContext context) {
    final premiumTheme = Theme.of(context).extension<PremiumTheme>()!;
    return AspectRatio(
      aspectRatio: 3.1 / 2,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            gradient: premiumTheme.mainGradient,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: premiumTheme.accent.withValues(alpha: 0.10),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(
              color: premiumTheme.card.withValues(alpha: 0.18),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: premiumTheme.accent.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-15, 0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: premiumTheme.accent.withValues(
                                alpha: 0.10,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.card.available.toString(),
                          style: TextStyle(
                            color: premiumTheme.accent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " ${widget.card.currency}",
                          style: TextStyle(
                            color: premiumTheme.accent.withValues(alpha: 0.7),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.card.name,
                      style: TextStyle(
                        color: premiumTheme.accent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        widget.card.number,
                        style: TextStyle(
                          color: premiumTheme.accent.withValues(alpha: 0.9),
                          fontSize: 20,
                          letterSpacing: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
