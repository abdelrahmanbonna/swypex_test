import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swypex_test/Core/Extentions/extensions.dart';
import 'package:swypex_test/Features/CurrencyExchange/Presentation/Providers/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.padding.top + 20,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    ).then((value) => ref
                                        .read(homeProvider)
                                        .setStartDate(value ?? DateTime.now()));
                                  },
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(homeProvider).startDate.year}-${ref.watch(homeProvider).startDate.month}-${ref.watch(homeProvider).startDate.day}",
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'home.to'.tr(),
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    ).then((value) => ref
                                        .read(homeProvider)
                                        .setEndDate(value ?? DateTime.now()));
                                  },
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(homeProvider).endDate.year}-${ref.watch(homeProvider).endDate.month}-${ref.watch(homeProvider).endDate.day}",
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showCurrencyPicker(
                                      context: context,
                                      showFlag: true,
                                      showCurrencyName: true,
                                      showCurrencyCode: true,
                                      onSelect: (Currency currency) {
                                        ref
                                            .read(homeProvider)
                                            .setBase(currency);
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(homeProvider).base?.symbol ?? '--'} ${ref.watch(homeProvider).base?.code ?? '--'}",
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'home.to'.tr(),
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showCurrencyPicker(
                                      context: context,
                                      showFlag: true,
                                      showCurrencyName: true,
                                      showCurrencyCode: true,
                                      onSelect: (Currency currency) {
                                        ref
                                            .read(homeProvider)
                                            .setSymbols(currency);
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "${ref.watch(homeProvider).symbols?.symbol ?? '--'} ${ref.watch(homeProvider).symbols?.code ?? '--'}",
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(5, 5),
                          )
                        ]),
                    child: InkWell(
                      onTap: () {
                        ref.read(homeProvider).getExchangeRates();
                      },
                      child: Center(
                        child: Text(
                          'home.submit'.tr(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ).setHorizontalAndVerticalPadding(context, 0.01, 0.0),
                ),
              ],
            ).setOnlyPadding(context, 0, 0.02, 0, 0),
          ),
          Expanded(
            flex: 6,
            child: ListView.separated(
              itemCount: ref.watch(homeProvider).rates.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: mediaQuery.size.height * 0.02,
                bottom: mediaQuery.size.height * 0.2,
              ),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
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
                            ref.watch(homeProvider).rates[index].date,
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
                                'Currency',
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
                                'Price',
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
                                ref
                                    .watch(homeProvider)
                                    .rates[index]
                                    .covertionCurr,
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
                                ref.watch(homeProvider).rates[index].price,
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
              },
            ),
          ),
        ],
      ).setHorizontalPadding(context, 0.0467),
    );
  }
}