import 'dart:developer';
import 'package:get/get.dart';
import 'package:osar_pasar/screens/service_providers.dart';

import '../models/service_provider.dart';
import '../repo/service_provider_repo.dart';

class ServiceProviderController extends GetxController {
  RxList<ServiceProviders> serviceProviders = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllServiceProviders();
    super.onInit();
  }

  getAllServiceProviders() async {
    loading.value = true;
    await ServiceProviderRepo.getServiceProvider(
      onSuccess: (serviceProvider) {
        loading.value = false;

        log("controlling classmate  ");
        serviceProviders.addAll(serviceProvider);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
