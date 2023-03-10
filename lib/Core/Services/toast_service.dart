import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Used to show a message on the screen
class ToastService {
  static void showUnExpectedErrorToast() {
    EasyLoading.showError(
      'global.unexpected_error'.tr(),
    );
  }

  static void showNoInternetConnectionErrorToast() {
    EasyLoading.showError(
      'global.no_internet_connection'.tr(),
    );
  }

  static void showErrorToast(String msg) {
    EasyLoading.showError(
      msg,
    );
  }

  static void showSuccessToast(String msg) {
    EasyLoading.showSuccess(
      msg,
    );
  }
}
