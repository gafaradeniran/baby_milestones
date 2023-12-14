import 'package:baby_milestones/app_config/shared/media_query.dart';
import 'package:flutter/material.dart';

void openModalScreen(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Set to true for a scrollable modal bottom sheet
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          height: context.height * 0.65,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: widget,
        ),
      );
    },
  );
}
