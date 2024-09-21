import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';
import 'header_text.dart';

class RtiCardInfoView extends StatelessWidget {
  final Map<String, String> data;
  final bool? isTitleVisible;
  final String? headerText;

  const RtiCardInfoView({super.key, required this.data, this.isTitleVisible = true, this.headerText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SizedBox(
          height: size.height * 0.50,
          width: size.width * 0.82,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ( headerText != null)?Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   HeaderText(
                     headerText: headerText??'',
                   ),
                 ],
               ):Container(),
                ...data.entries.map(
                  (entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (isTitleVisible == true)
                              ? Text(
                                  entry.key,
                                  style: TextStyles(context).googlePoppinsFontsForText(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                )
                              : Container(),
                          Row(
                            mainAxisAlignment: (isTitleVisible == false)? MainAxisAlignment.center:MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (isTitleVisible == false)
                                  ? Text(
                                      "${entry.key}.",
                                      style: TextStyles(context).googlePoppinsFontsForText(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 0.8),
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                width: size.width * 0.72, // Ensures the text takes the full width available
                                child: Text(
                                  entry.value,
                                  softWrap: true,
                                  overflow: TextOverflow.visible, // Show the text without truncating
                                  style: TextStyles(context).googlePoppinsFontsForText(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
