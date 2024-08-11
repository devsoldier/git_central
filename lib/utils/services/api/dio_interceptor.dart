import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:git_central/utils/custom_widgets/global_messenger.dart';

class DioInterceptor extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    checkError(err.response, err);
    super.onError(err, handler);
  }

  checkError(Response? response, [DioException? err]) {
    if (err?.type == DioExceptionType.connectionError) {
      GetIt.I<GlobalMessenger>().messenger.sink.add(NoNetwork());
    }
  }
}
