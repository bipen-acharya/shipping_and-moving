class ServiceProvider {
  List<ServiceProviders>? serviceProviders;

  ServiceProvider({this.serviceProviders});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    if (json['serviceProviders'] != null) {
      serviceProviders = <ServiceProviders>[];
      json['serviceProviders'].forEach((v) {
        serviceProviders!.add(ServiceProviders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (serviceProviders != null) {
      data['serviceProviders'] =
          serviceProviders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<ServiceProviders> serviceProviderFromJson(
        List<dynamic> serviceProvidersJson) =>
    List<ServiceProviders>.from(serviceProvidersJson.map(
        (serviceProviderJson) =>
            ServiceProviders.fromJson(serviceProviderJson)));

class ServiceProviders {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? isAdmin;
  String? createdAt;
  String? updatedAt;

  ServiceProviders(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.isAdmin,
      this.createdAt,
      this.updatedAt});

  ServiceProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
