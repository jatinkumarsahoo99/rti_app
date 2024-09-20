import 'package:flutter/material.dart';

import 'normal_text.dart';

class FileImageWidget extends StatelessWidget {
  const FileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 6.0),
      child: Row(
        children: [
          Icon(Icons.picture_as_pdf,color: Colors.red,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: NormalText(normalString: 'add.pdf(PDF)',fontWeight: FontWeight.w500,fontSize: 8,),
          )
        ],
      ),
    );
  }
}
