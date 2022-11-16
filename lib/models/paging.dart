
class Paging {
  Paging({
    required this.total,
    required this.primaryResults,
    required this.offset,
    required this.limit,
  });

  int total;
  int primaryResults;
  int offset;
  int limit;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    total: json["total"],
    primaryResults: json["primary_results"],
    offset: json["offset"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "primary_results": primaryResults,
    "offset": offset,
    "limit": limit,
  };
}
