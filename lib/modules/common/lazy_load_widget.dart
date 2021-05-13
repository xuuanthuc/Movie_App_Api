import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LazyLoadWidget extends StatelessWidget {
  final bool isLoading;

  LazyLoadWidget(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: lazyLoad(),
    );
  }

  Stack lazyLoad() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }
}