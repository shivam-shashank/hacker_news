import 'package:fluttertoast/fluttertoast.dart';

flutterToast(String toastText) {
  return Fluttertoast.showToast(
    msg: toastText,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
