
import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/shared/loading_widget.dart';

class FunctionWidgets {
  showLoading(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => true,
        child: const Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}