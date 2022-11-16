import 'package:product_filter/models/paging.dart';
import 'package:product_filter/models/product.dart';

class FilteredData {
  FilteredData({
    required this.siteId,
    required this.countryDefaultTimeZone,
    required this.query,
    required this.paging,
    required this.results,
  });

  String siteId;
  String countryDefaultTimeZone;
  String query;
  Paging paging;
  List<Product> results;

  factory FilteredData.fromJson(Map<String, dynamic> json) => FilteredData(
    siteId: json["site_id"],
    countryDefaultTimeZone: json["country_default_time_zone"],
    query: json["query"],
    paging: Paging.fromJson(json["paging"]),
    results: List<Product>.from(json["results"].map((x) => Product.fromJson(x))),
  );

}
