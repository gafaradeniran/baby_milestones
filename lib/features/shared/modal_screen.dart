import 'package:baby_milestones/features/shared/media_query.dart';
import 'package:flutter/material.dart';

openModalScreen(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
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
