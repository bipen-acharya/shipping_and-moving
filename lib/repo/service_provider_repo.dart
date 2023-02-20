import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/service_provider.dart';
import '../utils/apis.dart';

class ServiceProviderRepo {
  static Future<void> getServiceProvider(
      {required Function(List<ServiceProviders>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(Api.serviceProvider);
      http.Response response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body);
      log("all material");
      log(data["data"].toString());
      if (data['status']) {
        log("on sucess ma aayo");
        // log("-->"data['data']["serviceProviders"].toString());
        onSuccess(serviceProviderFromJson(data['data']["serviceProviders"]));
        // print(data.toString());
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
