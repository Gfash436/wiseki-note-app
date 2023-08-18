// import 'dart:js';

import 'dart:async';

import 'package:flutter/cupertino.dart';

class PageNavigator {
  PageNavigator({required this.ctx});
  BuildContext ctx;

  //Navigator to next page
  Future nextPage({Widget? page}) {
    return Navigator.push(
        ctx, CupertinoPageRoute(builder: ((context) => page!)));
  }

  Future nextPageOnly({Widget? page}) {
    return Navigator.pushAndRemoveUntil(
        ctx,
        CupertinoPageRoute(builder: (context) => page!),
        (Route<dynamic> route) => false);
  }

  Future nextPageRep({Widget? page}) {
    return Navigator.pushReplacement(
        ctx, CupertinoPageRoute(builder: (context) => page!));
  }
}
