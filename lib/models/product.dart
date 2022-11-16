import 'dart:convert';

import 'package:product_filter/models/address.dart';

List<Product> productFromJson(List data) => List<Product>.from(data.map((x) => Product.fromJson(x)));

class Product {
  Product({
    required this.id,
    required this.siteId,
    required this.title,
    required this.price,
    required this.currencyId,
    required this.availableQuantity,
    required this.soldQuantity,
    required this.stopTime,
    required this.condition,
    required this.permalink,
    required this.thumbnail,
    required this.thumbnailId,
    required this.acceptsMercadopago,
    required this.address,
    required this.originalPrice,
    required this.categoryId,
    required this.officialStoreId,
    required this.domainId,
    required this.catalogProductId,
    required this.tags,
    required this.catalogListing,
    required this.useThumbnailId,
    required this.orderBackend,
    required this.like,
  });

  String id;
  String siteId;
  String title;
  double price;
  String currencyId;
  int availableQuantity;
  int soldQuantity;
  DateTime stopTime;
  String condition;
  String permalink;
  String thumbnail;
  String thumbnailId;
  bool acceptsMercadopago;
  Address address;
  double originalPrice;
  String categoryId;
  int officialStoreId;
  String domainId;
  String catalogProductId;
  List tags;
  bool catalogListing;
  bool useThumbnailId;
  int orderBackend;
  bool like = false;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      siteId: json["site_id"],
      title: json["title"],
      price: json["price"].toDouble(),
      currencyId: json["currency_id"],
      availableQuantity: json["available_quantity"],
      soldQuantity: json["sold_quantity"],
      stopTime: DateTime.parse(json["stop_time"]),
      condition: json["condition"],
      permalink: json["permalink"],
      thumbnail: json["thumbnail"],
      thumbnailId: json["thumbnail_id"],
      acceptsMercadopago: json["accepts_mercadopago"],
      address: Address.fromJson(json["address"]),
      originalPrice: json["original_price"] == null ? 0.0 : json["original_price"].toDouble(),
      categoryId: json["category_id"],
      officialStoreId: json["official_store_id"] == null ? 0 : json["official_store_id"],
      domainId: json["domain_id"],
      catalogProductId: json["catalog_product_id"] == null ? "" : json["catalog_product_id"],
      tags: json["tags"],
      catalogListing: json["catalog_listing"] == null ? true : json["catalog_listing"],
      useThumbnailId: json["use_thumbnail_id"],
      orderBackend: json["order_backend"],
      like: json["like"]==null?false:json["like"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "site_id": siteId,
    "title": title,
    "price": price,
    "currency_id": currencyId,
    "available_quantity": availableQuantity,
    "sold_quantity": soldQuantity,
    "stop_time": stopTime.toIso8601String(),
    "condition": condition,
    "permalink": permalink,
    "thumbnail": thumbnail,
    "thumbnail_id": thumbnailId,
    "accepts_mercadopago": acceptsMercadopago,
    "address": address.toJson(),
    "original_price": originalPrice,
    "category_id": categoryId,
    "official_store_id": officialStoreId,
    "domain_id": domainId,
    "catalog_product_id": catalogProductId,
    "tags": tags,
    "catalog_listing": catalogListing,
    "use_thumbnail_id": useThumbnailId,
    "order_backend": orderBackend,
    "like": like,
  };

}
