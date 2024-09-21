import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class RtiCardInfoView extends StatelessWidget {
  final Map<String, String> data;

  const RtiCardInfoView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SizedBox(
          height: size.height * 0.50,
          width: size.width * 0.82,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.entries.map(
                (entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: TextStyles(context).googlePoppinsFontsForText(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        const SizedBox(height: 6),
                        if (entry.key == 'Application Status')
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(243, 239, 202, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              entry.value,
                              style:
                                  TextStyles(context).googlePoppinsFontsForText(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            ),
                          )
                        else
                          Text(
                            entry.value,
                            style:
                                TextStyles(context).googlePoppinsFontsForText(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 0.8),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
