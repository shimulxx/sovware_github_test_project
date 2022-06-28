import 'dart:convert';

import 'inner_model/item.dart';

GithubListResponse githubListResponseFromMap(String str) => GithubListResponse.fromMap(json.decode(str));

String githubListResponseToMap(GithubListResponse data) => json.encode(data.toMap());

class GithubListResponse {
  GithubListResponse({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  final int? totalCount;
  final bool? incompleteResults;
  final List<Item>? items;

  factory GithubListResponse.fromMap(Map<String, dynamic> json) => GithubListResponse(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] != null ? List<Item>.from(json["items"].map((x) => Item.fromMap(x))) : null,
  );

  Map<String, dynamic> toMap() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items != null ? List<dynamic>.from(items!.map((x) => x.toMap())) : null,
  };
}






