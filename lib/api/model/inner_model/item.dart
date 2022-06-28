import 'license.dart';
import 'owner.dart';

class Item {
  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final Owner? owner;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  final String? issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
  final String? deploymentsUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final int? forksCount;
  final dynamic mirrorUrl;
  final bool? archived;
  final bool? disabled;
  final int? openIssuesCount;
  final License? license;
  final bool? allowForking;
  final bool? isTemplate;
  final List<String?>? topics;
  final String? visibility;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final String? defaultBranch;
  final int? score;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: json["owner"] != null ? Owner.fromMap(json["owner"]) : null,
    htmlUrl: json["html_url"],
    description: json["description"],
    fork: json["fork"],
    url: json["url"],
    forksUrl: json["forks_url"],
    keysUrl: json["keys_url"],
    collaboratorsUrl: json["collaborators_url"],
    teamsUrl: json["teams_url"],
    hooksUrl: json["hooks_url"],
    issueEventsUrl: json["issue_events_url"],
    eventsUrl: json["events_url"],
    assigneesUrl: json["assignees_url"],
    branchesUrl: json["branches_url"],
    tagsUrl: json["tags_url"],
    blobsUrl: json["blobs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"],
    treesUrl: json["trees_url"],
    statusesUrl: json["statuses_url"],
    languagesUrl: json["languages_url"],
    stargazersUrl: json["stargazers_url"],
    contributorsUrl: json["contributors_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    commitsUrl: json["commits_url"],
    gitCommitsUrl: json["git_commits_url"],
    commentsUrl: json["comments_url"],
    issueCommentUrl: json["issue_comment_url"],
    contentsUrl: json["contents_url"],
    compareUrl: json["compare_url"],
    mergesUrl: json["merges_url"],
    archiveUrl: json["archive_url"],
    downloadsUrl: json["downloads_url"],
    issuesUrl: json["issues_url"],
    pullsUrl: json["pulls_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    labelsUrl: json["labels_url"],
    releasesUrl: json["releases_url"],
    deploymentsUrl: json["deployments_url"],
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
    pushedAt: json["pushed_at"] != null ? DateTime.parse(json["pushed_at"]) : null,
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"],
    size: json["size"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    language: json["language"],
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasDownloads: json["has_downloads"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    forksCount: json["forks_count"],
    mirrorUrl: json["mirror_url"],
    archived: json["archived"],
    disabled: json["disabled"],
    openIssuesCount: json["open_issues_count"],
    license: json["license"] == null ? null : License.fromMap(json["license"]),
    allowForking: json["allow_forking"],
    isTemplate: json["is_template"],
    topics: json["topics"] != null ? List<String>.from(json["topics"].map((x) => x)) : null,
    visibility: json["visibility"],
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
    defaultBranch: json["default_branch"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner != null ? owner!.toMap() : null,
    "html_url": htmlUrl,
    "description": description,
    "fork": fork,
    "url": url,
    "forks_url": forksUrl,
    "keys_url": keysUrl,
    "collaborators_url": collaboratorsUrl,
    "teams_url": teamsUrl,
    "hooks_url": hooksUrl,
    "issue_events_url": issueEventsUrl,
    "events_url": eventsUrl,
    "assignees_url": assigneesUrl,
    "branches_url": branchesUrl,
    "tags_url": tagsUrl,
    "blobs_url": blobsUrl,
    "git_tags_url": gitTagsUrl,
    "git_refs_url": gitRefsUrl,
    "trees_url": treesUrl,
    "statuses_url": statusesUrl,
    "languages_url": languagesUrl,
    "stargazers_url": stargazersUrl,
    "contributors_url": contributorsUrl,
    "subscribers_url": subscribersUrl,
    "subscription_url": subscriptionUrl,
    "commits_url": commitsUrl,
    "git_commits_url": gitCommitsUrl,
    "comments_url": commentsUrl,
    "issue_comment_url": issueCommentUrl,
    "contents_url": contentsUrl,
    "compare_url": compareUrl,
    "merges_url": mergesUrl,
    "archive_url": archiveUrl,
    "downloads_url": downloadsUrl,
    "issues_url": issuesUrl,
    "pulls_url": pullsUrl,
    "milestones_url": milestonesUrl,
    "notifications_url": notificationsUrl,
    "labels_url": labelsUrl,
    "releases_url": releasesUrl,
    "deployments_url": deploymentsUrl,
    "created_at": createdAt != null ? createdAt!.toIso8601String() : null,
    "updated_at": updatedAt != null ? updatedAt!.toIso8601String() : null,
    "pushed_at": pushedAt != null ? pushedAt!.toIso8601String() : null,
    "git_url": gitUrl,
    "ssh_url": sshUrl,
    "clone_url": cloneUrl,
    "svn_url": svnUrl,
    "homepage": homepage,
    "size": size,
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
    "language": language,
    "has_issues": hasIssues,
    "has_projects": hasProjects,
    "has_downloads": hasDownloads,
    "has_wiki": hasWiki,
    "has_pages": hasPages,
    "forks_count": forksCount,
    "mirror_url": mirrorUrl,
    "archived": archived,
    "disabled": disabled,
    "open_issues_count": openIssuesCount,
    "license": license == null ? null : license!.toMap(),
    "allow_forking": allowForking,
    "is_template": isTemplate,
    "topics": topics != null ? List<dynamic>.from(topics!.map((x) => x)) : null,
    "visibility": visibility,
    "forks": forks,
    "open_issues": openIssues,
    "watchers": watchers,
    "default_branch": defaultBranch,
    "score": score,
  };
}