// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:ft_chetak_books/components/buttons.dart';
import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/data/pref/app_preferences.dart';
import 'package:ft_chetak_books/models/base_response.dart';
import 'package:ft_chetak_books/utils/app_loader.dart';
import 'package:ft_chetak_books/utils/app_toast.dart';
import 'package:ft_chetak_books/utils/enum.dart';
import 'package:ft_chetak_books/utils/extension/extensions.dart';
import 'package:retrofit/retrofit.dart';

import '../../package/config_packages.dart';

part 'api_client.g.dart';

bool isInternetAvailable = true;

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  //region USER AUTHENTICATION
  @POST("login")
  Future<RootResponse?> login(@Body() Map<String, dynamic> map);
}

Future<T?> callApi<T>(Future<T> request, [bool doShowLoader = true]) async {
  if (!isInternetAvailable) {
    showErrorToast('Internet not available');
    return null;
  }
  try {
    if (doShowLoader) showLoader(isCancelable: false);
    var response = await request;
    if (doShowLoader) dismissLoader();
    return response;
  } on DioError catch (dioError) {
    if (doShowLoader) dismissLoader();
    onResponseError(dioError);
  } catch (error) {
    if (doShowLoader) dismissLoader();
    debugPrint("callApi :: Error -> $error");
  }
  return null;
}

onResponseError(onError) {
   if (onError is DioError) {
    switch (onError.response?.statusCode) {
      case 400:
      case 401:
        if (AppPref().token.isNotEmpty) {
          var languageCode = AppPref().languageCode;
          var isDark = AppPref().isDark;
          Get.deleteAll();

          AppPref().isDark = isDark;
          AppPref().languageCode = languageCode;

          // Navigator.pushAndRemoveUntil(
          //   Get.context!,
          //   MaterialPageRoute(builder: (context) => LoginScreen()),
          //   (route) => false,
          // );
          AppPref().clear();
        } else {
          showAppToast('UNAUTHORIZED');
        }

        break;
      case 403:
      case 404:
        break;
      case 406:
        var json = onError.response?.data;
        if (kDebugMode) {
          print(json.toString().replaceAll('[', '').replaceAll(']', ''));
        }
        throw onError;
      case 408:
      case 409:
      case 422:
      case 423:
      case 426:
        break;
      case 500:
        showAppToast('Internal Server Error');
        break;
      default:
        break;
    }
  }
}

/// to show error
void showErrorSheet(String errorText,
    {Function()? onTap, String? buttonTitle}) {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    builder: (context) => Container(
      color: context.theme.scaffoldBackgroundColor,
      padding: EdgeInsetsDirectional.only(
          start: 24,
          end: 24,
          top: 18,
          bottom: context.bottomPaddingIfNeeded(18)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("Error")),
          const Gap(16),
          for (var data in errorText.split(',')) ...{
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: CircleAvatar(
                        backgroundColor: context.textTheme.titleLarge?.color,
                        radius: 5),
                  ),
                  const Gap(8),
                  Expanded(child: Text(data.trim().capitalizeFirst ?? "")),
                ],
              ),
            ),
          },
          const Gap(16),
          CommonAppButton(
              text: "Ok",
              buttonType: ButtonType.enable,
              onTap: () {
                hideKeyboard();
                Navigator.pop(context);
              })
        ],
      ),
    ),
  );
}
