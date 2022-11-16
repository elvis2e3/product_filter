class Address {
  Address({
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
  });

  String stateId;
  String stateName;
  String cityId;
  String cityName;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    stateId: json["state_id"],
    stateName: json["state_name"],
    cityId: json["city_id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_name": stateName,
    "city_id": cityId,
    "city_name": cityName,
  };
}