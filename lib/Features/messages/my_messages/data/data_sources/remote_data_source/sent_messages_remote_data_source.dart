import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:HrmsVersions/Features/messages/my_messages/data/models/sent_messages_model/datum.dart';
import 'package:HrmsVersions/Features/messages/my_messages/data/models/sent_messages_model/sent_messages_model.dart';
import 'package:HrmsVersions/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef SentMessagesResponse = Either<String, SentMessagesList>;

abstract class SentMessagesRemoteDataSource {
  Future<SentMessagesResponse> fetchSentMessages(String userId);
}

class SentMessagesRemoteDataSourceImpl extends SentMessagesRemoteDataSource {
  @override
  Future<SentMessagesResponse> fetchSentMessages(String userId) async {
    SentMessagesResponse sentMessagesResponse = left("");
    var body = {
      "page": "1",
      "per_page": "100",
      "user_id": userId,
    };
    await getIt<NetworkRequest>().requestFutureData<SentMessagesModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSentMessageApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          sentMessagesResponse = right(data.data!);
        } else {
          sentMessagesResponse = left(data.toString());
        }
      },
      onError: (code, msg) {
        sentMessagesResponse = left(code.toString());
      },
    );
    return sentMessagesResponse;
  }
}
