import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

import 'navigation_context.dart';

class CustomRouterWeb {
  /// Go To name page and Replace Current Page
  ///
  ///
  void goToNameAndOff(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    String url = name;

    if (queryParameters.isNotEmpty) {
      url =
          Uri.parse(name).replace(queryParameters: queryParameters).toString();
    }

    if (pathParameters.isNotEmpty) {
      String temp = url;

      List<String> keyList = pathParameters.keys.toList();
      List<String> valueList = pathParameters.values.toList();
      url = Uri.parse(temp.replaceAll(
              "/:${keyList.join("/:")}", "/${valueList.join("/")}"))
          .toString();
    }
    Router.neglect(CurrentContext().context, () {
      CurrentContext().context.goNamed(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra);
      // JSHelper().change_url(path: url);
    });
  }

  /// open the Page in same tab
  ///
  ///
  void openPageSameTab(
    String name, {
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) {
    String url = name;

    if (queryParameters != null && queryParameters.isNotEmpty) {
      url =
          Uri.parse(name).replace(queryParameters: queryParameters).toString();
    }

    if (pathParameters != null && pathParameters.isNotEmpty) {
      String temp = url;

      List<String> keyList = pathParameters.keys.toList();
      List<String> valueList = pathParameters.values.toList();
      url = Uri.parse(temp.replaceAll(
              "/:${keyList.join("/:")}", "/${valueList.join("/")}"))
          .toString();
    }

    html.window.open(url, "_self");
  }

  void reDirect(String url) {
    html.window.location.href = url;
  }

  /// Pop and remove the state from stack
  ///
  ///
  void popAndOff([dynamic result]) {
    Router.neglect(CurrentContext().context, () {
      CurrentContext().context.pop(result);
    });
  }

  /// Html Back
  ///
  ///
  void back() {
    html.window.history.go(-1);
  }

  /// Html Back
  ///
  ///
  void secBack() {
    html.window.history.go(-2);
  }

/*  MaterialPageRoute getRoute({required String name, dynamic arguments}) {
    switch (name) {
      case RouteNameWeb.rayZorPayViewScreen:
        return MaterialPageRoute(builder: (_) {
          if (arguments is Map) {
            return RayZorPayViewScreen(rayzorPayDetails: arguments);
          }
          return _errorRoute();
        });
      case RouteNameWeb.paytmSDKViewRoute:
        return MaterialPageRoute(builder: (_) {
          if (arguments is Map) {
            return PaytmWebView(pgData: arguments);
          }
          return _errorRoute();
        });
      case RouteNameWeb.phonePeViewScreen:
        return MaterialPageRoute(builder: (_) {
          if (arguments is Map) {
            return PhonePeWebViewScreen(phonePeDetails: arguments);
          }
          return _errorRoute();
        });
      case RouteNameWeb.ePayLaterViewScreen:
        return MaterialPageRoute(builder: (_) {
          if (arguments is EPayLaterPaYResponse) {
            return EPayLaterViewWeb(
              ePayLaterPaYResponse: arguments,
            );
          }
          return _errorRoute();
        });
      case RouteNameWeb.testPage:
        return MaterialPageRoute(builder: (_) => const TestPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              body: Center(child: customOnlyText("No route found")));
        });
    }
  }*/

/*  Future pushNamed({required String name, dynamic arguments}) {
    return Navigator.push(
        CurrentContext().context, getRoute(name: name, arguments: arguments));
  }*/

/*  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: customOnlyText('Error'),
      ),
      body: Center(
        child: customOnlyText('ERROR'),
      ),
    );
  }*/
}
