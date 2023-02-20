import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/screens/item.dart';

import '../controller/service_provider_controller.dart';
import '../models/service_provider.dart';

class ServiceProviderScreen extends StatelessWidget {
  ServiceProviderScreen({super.key});

  final c = Get.put(ServiceProviderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Service Providers",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: Get.height - 140,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: c.serviceProviders.length,

                      itemBuilder: (context, index) {
                        ServiceProviders serviceProvider =
                            c.serviceProviders[index];
                        // if (index == 0) {
                        //   return const Padding(
                        //     padding: EdgeInsets.only(
                        //       top: 33,
                        //       bottom: 3,
                        //       left: 15,
                        //       right: 20,
                        //     ),
                        //     child: CustomTextField(
                        //       hint: "Search ",
                        //       prefixIcon: Icon(Icons.search, size: 30),
                        //       readOnly: true,
                        //     ),
                        //   );
                        // }
                        return MaterialListCard(
                          // textTheme: textTheme,
                          imgUrl: 'https://picsum.photos/100/100',
                          readingTitle: serviceProvider.name!.toString(),
                          readingMaterial: serviceProvider.email!.toString(),
                          phoneNumber: "",
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class MaterialListCard extends StatelessWidget {
  const MaterialListCard({
    Key? key,
    required this.readingTitle,
    required this.readingMaterial,
    required this.phoneNumber,
    required this.imgUrl,
  }) : super(key: key);

  final String readingTitle;
  final String readingMaterial;
  final String phoneNumber;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: InkWell(
        onTap: (() => Get.to(ItemAddScreen())),
        child: Container(
          // height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 9,
                color: const Color(0xFF494949).withOpacity(0.06),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() => Get.to(() => ItemAddScreen())),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(imgUrl, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        readingTitle,
                        // style: textTheme.titleSmall!.copyWith(
                        //   fontSize: 14,
                        // ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        readingMaterial,
                        // style: textTheme.bodyMedium!.copyWith(
                        //   fontSize: 12,
                        //   // color: AppColors.textGreyColor,
                        // ),
                      ),
                      Text(phoneNumber),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
