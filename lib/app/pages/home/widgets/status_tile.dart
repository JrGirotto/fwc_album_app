// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StatusTile extends StatelessWidget {
  final Image icon;
  final String label;
  final int value;

  const StatusTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .70,
      child: ListTile(
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            radius: 46,
            child: icon,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        title: Text(
          label,
          style: context.textStyles.textPrimaryFontRegular
              .copyWith(color: Colors.white),
        ),
        trailing: Text(
          '$value',
          style: context.textStyles.textPrimaryFontMedium
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
