// ignore_for_file: unnecessary_this

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_response.g.dart';

@JsonSerializable()
class GithubResponse extends Equatable {
  final int? id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final bool? private;
  final RepoOwner? owner;
  final String? description;
  @JsonKey(name: 'stargazers_count')
  final int? stars;
  @JsonKey(name: 'watchers_count')
  final int? watchers;
  @JsonKey(name: 'forks_count')
  final int? forks;
  final String? language;

  const GithubResponse({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.description,
    this.stars,
    this.watchers,
    this.forks,
    this.language,
  });

  factory GithubResponse.fromJson(Map<String, dynamic> json) =>
      _$GithubResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubResponseToJson(this);

  @override
  String toString() {
    return 'GithubResponse(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, private: $private, owner: $owner)';
  }

  @override
  List<Object?> get props => [
        id,
        nodeId,
        name,
        fullName,
        private,
        owner,
        description,
        stars,
        watchers,
        forks,
        language,
      ];
}

@JsonSerializable()
class RepoOwner extends Equatable {
  final String? login;
  final int? id;
   @JsonKey(name:'node_id')
  final String? nodeId;
   @JsonKey(name:'avatar_url')
  final String? avatarUrl;
  final String? url;
  @JsonKey(name:'html_url')
  final String? htmlUrl;

  const RepoOwner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
  });

  factory RepoOwner.fromJson(Map<String, dynamic> json) =>
      _$RepoOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$RepoOwnerToJson(this);

  @override
  String toString() {
    return 'RepoOwner(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, url: $url, htmlUrl: $htmlUrl)';
  }

  @override
  List<Object?> get props => [
        login,
        id,
        nodeId,
        avatarUrl,
        url,
        htmlUrl,
      ];
}
