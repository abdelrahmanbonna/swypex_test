
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final String date;
  final String price;
  final String convertionCurr,base;

  const ExchangeCard({
    Key? key,
    required this.date,
    required this.price,
    required this.convertionCurr,
    required this.base,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.primaryColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                date,
                style: theme.textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'home.currency'.tr(),
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'home.price'.tr(),
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Center(
                  child: Text(
                    base,
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "$price $convertionCurr",
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
