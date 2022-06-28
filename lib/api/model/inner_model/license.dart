class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  factory License.fromMap(Map<String, dynamic> json) => License(
    key: json["key"],
    name: json["name"],
    spdxId: json["spdx_id"],
    url: json["url"],
    nodeId: json["node_id"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "name": name,
    "spdx_id": spdxId,
    "url": url,
    "node_id": nodeId,
  };
}