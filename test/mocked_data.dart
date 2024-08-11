import 'package:git_central/features/trending_repo/repository/data_classes/github_response.dart';
import 'package:git_central/features/trending_repo/repository/data_classes/pagination.dart';
import 'package:git_central/utils/helpers/result.dart';

const mockedGithubResponse = {
  "total_count": 3254951,
  "incomplete_results": false,
  "items": [
    {
      "id": 835452752,
      "node_id": "R_kgDOMcv_UA",
      "name": "segment-anything-2",
      "full_name": "facebookresearch/segment-anything-2",
      "private": false,
      "owner": {
        "login": "facebookresearch",
        "id": 16943930,
        "node_id": "MDEyOk9yZ2FuaXphdGlvbjE2OTQzOTMw",
        "avatar_url": "https://avatars.githubusercontent.com/u/16943930?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/facebookresearch",
        "html_url": "https://github.com/facebookresearch",
        "followers_url":
            "https://api.github.com/users/facebookresearch/followers",
        "following_url":
            "https://api.github.com/users/facebookresearch/following{/other_user}",
        "gists_url":
            "https://api.github.com/users/facebookresearch/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/facebookresearch/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/facebookresearch/subscriptions",
        "organizations_url":
            "https://api.github.com/users/facebookresearch/orgs",
        "repos_url": "https://api.github.com/users/facebookresearch/repos",
        "events_url":
            "https://api.github.com/users/facebookresearch/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/facebookresearch/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "html_url": "https://github.com/facebookresearch/segment-anything-2",
      "description":
          "The repository provides code for running inference with the Meta Segment Anything Model 2 (SAM 2), links for downloading the trained model checkpoints, and example notebooks that show how to use the model.",
      "fork": false,
      "url": "https://api.github.com/repos/facebookresearch/segment-anything-2",
      "forks_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/forks",
      "keys_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/keys{/key_id}",
      "collaborators_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/collaborators{/collaborator}",
      "teams_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/teams",
      "hooks_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/hooks",
      "issue_events_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/issues/events{/number}",
      "events_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/events",
      "assignees_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/assignees{/user}",
      "branches_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/branches{/branch}",
      "tags_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/tags",
      "blobs_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/git/blobs{/sha}",
      "git_tags_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/git/tags{/sha}",
      "git_refs_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/git/refs{/sha}",
      "trees_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/git/trees{/sha}",
      "statuses_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/statuses/{sha}",
      "languages_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/languages",
      "stargazers_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/stargazers",
      "contributors_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/contributors",
      "subscribers_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/subscribers",
      "subscription_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/subscription",
      "commits_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/commits{/sha}",
      "git_commits_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/git/commits{/sha}",
      "comments_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/comments{/number}",
      "issue_comment_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/issues/comments{/number}",
      "contents_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/contents/{+path}",
      "compare_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/compare/{base}...{head}",
      "merges_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/merges",
      "archive_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/{archive_format}{/ref}",
      "downloads_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/downloads",
      "issues_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/issues{/number}",
      "pulls_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/pulls{/number}",
      "milestones_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/milestones{/number}",
      "notifications_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/notifications{?since,all,participating}",
      "labels_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/labels{/name}",
      "releases_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/releases{/id}",
      "deployments_url":
          "https://api.github.com/repos/facebookresearch/segment-anything-2/deployments",
      "created_at": "2024-07-29T21:48:23Z",
      "updated_at": "2024-08-09T02:53:25Z",
      "pushed_at": "2024-08-08T20:50:12Z",
      "git_url": "git://github.com/facebookresearch/segment-anything-2.git",
      "ssh_url": "git@github.com:facebookresearch/segment-anything-2.git",
      "clone_url": "https://github.com/facebookresearch/segment-anything-2.git",
      "svn_url": "https://github.com/facebookresearch/segment-anything-2",
      "homepage": "",
      "size": 47158,
      "stargazers_count": 8936,
      "watchers_count": 8936,
      "language": "Jupyter Notebook",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": false,
      "has_pages": false,
      "has_discussions": false,
      "forks_count": 555,
      "mirror_url": null,
      "archived": false,
      "disabled": false,
      "open_issues_count": 106,
      "license": {
        "key": "apache-2.0",
        "name": "Apache License 2.0",
        "spdx_id": "Apache-2.0",
        "url": "https://api.github.com/licenses/apache-2.0",
        "node_id": "MDc6TGljZW5zZTI="
      },
      "allow_forking": true,
      "is_template": false,
      "web_commit_signoff_required": false,
      "topics": [],
      "visibility": "public",
      "forks": 555,
      "open_issues": 106,
      "watchers": 8936,
      "default_branch": "main",
      "score": 1.0
    }
  ]
};

final expectedGithubResponse = Result.success(
  const Pagination(
    totalInt: 3254951,
    incompleteResults: false,
    items: <GithubResponse>[
      GithubResponse(
          id: 835452752,
          fullName: 'facebookresearch/segment-anything-2',
          language: 'Jupyter Notebook',
          name: 'segment-anything-2',
          nodeId: 'R_kgDOMcv_UA',
          owner: RepoOwner(
            avatarUrl: 'https://avatars.githubusercontent.com/u/16943930?v=4',
            htmlUrl: 'https://github.com/facebookresearch',
            id: 16943930,
            login: 'facebookresearch',
            nodeId: 'MDEyOk9yZ2FuaXphdGlvbjE2OTQzOTMw',
            url: 'https://api.github.com/users/facebookresearch',
          ),
          private: false,
          stars: 8936,
          watchers: 8936,
          forks: 555,
          description:
              'The repository provides code for running inference with the Meta Segment Anything Model 2 (SAM 2), links for downloading the trained model checkpoints, and example notebooks that show how to use the model.')
    ],
  ),
);

final mockedpage2GithubResponse = {
  "total_count": 3254951,
  "incomplete_results": false,
  "items": [
    {
      "id": 838508060,
      "node_id": "R_kgDOMfqeHA",
      "name": "yournextstore",
      "full_name": "yournextstore/yournextstore",
      "private": false,
      "owner": {
        "login": "yournextstore",
        "id": 159799280,
        "node_id": "O_kgDOCYZX8A",
        "avatar_url": "https://avatars.githubusercontent.com/u/159799280?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/yournextstore",
        "html_url": "https://github.com/yournextstore",
        "followers_url": "https://api.github.com/users/yournextstore/followers",
        "following_url":
            "https://api.github.com/users/yournextstore/following{/other_user}",
        "gists_url":
            "https://api.github.com/users/yournextstore/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/yournextstore/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/yournextstore/subscriptions",
        "organizations_url": "https://api.github.com/users/yournextstore/orgs",
        "repos_url": "https://api.github.com/users/yournextstore/repos",
        "events_url":
            "https://api.github.com/users/yournextstore/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/yournextstore/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "html_url": "https://github.com/yournextstore/yournextstore",
      "description": "Modern Commerce with Next.js and Stripe as the backend.",
      "fork": false,
      "url": "https://api.github.com/repos/yournextstore/yournextstore",
      "forks_url":
          "https://api.github.com/repos/yournextstore/yournextstore/forks",
      "keys_url":
          "https://api.github.com/repos/yournextstore/yournextstore/keys{/key_id}",
      "collaborators_url":
          "https://api.github.com/repos/yournextstore/yournextstore/collaborators{/collaborator}",
      "teams_url":
          "https://api.github.com/repos/yournextstore/yournextstore/teams",
      "hooks_url":
          "https://api.github.com/repos/yournextstore/yournextstore/hooks",
      "issue_events_url":
          "https://api.github.com/repos/yournextstore/yournextstore/issues/events{/number}",
      "events_url":
          "https://api.github.com/repos/yournextstore/yournextstore/events",
      "assignees_url":
          "https://api.github.com/repos/yournextstore/yournextstore/assignees{/user}",
      "branches_url":
          "https://api.github.com/repos/yournextstore/yournextstore/branches{/branch}",
      "tags_url":
          "https://api.github.com/repos/yournextstore/yournextstore/tags",
      "blobs_url":
          "https://api.github.com/repos/yournextstore/yournextstore/git/blobs{/sha}",
      "git_tags_url":
          "https://api.github.com/repos/yournextstore/yournextstore/git/tags{/sha}",
      "git_refs_url":
          "https://api.github.com/repos/yournextstore/yournextstore/git/refs{/sha}",
      "trees_url":
          "https://api.github.com/repos/yournextstore/yournextstore/git/trees{/sha}",
      "statuses_url":
          "https://api.github.com/repos/yournextstore/yournextstore/statuses/{sha}",
      "languages_url":
          "https://api.github.com/repos/yournextstore/yournextstore/languages",
      "stargazers_url":
          "https://api.github.com/repos/yournextstore/yournextstore/stargazers",
      "contributors_url":
          "https://api.github.com/repos/yournextstore/yournextstore/contributors",
      "subscribers_url":
          "https://api.github.com/repos/yournextstore/yournextstore/subscribers",
      "subscription_url":
          "https://api.github.com/repos/yournextstore/yournextstore/subscription",
      "commits_url":
          "https://api.github.com/repos/yournextstore/yournextstore/commits{/sha}",
      "git_commits_url":
          "https://api.github.com/repos/yournextstore/yournextstore/git/commits{/sha}",
      "comments_url":
          "https://api.github.com/repos/yournextstore/yournextstore/comments{/number}",
      "issue_comment_url":
          "https://api.github.com/repos/yournextstore/yournextstore/issues/comments{/number}",
      "contents_url":
          "https://api.github.com/repos/yournextstore/yournextstore/contents/{+path}",
      "compare_url":
          "https://api.github.com/repos/yournextstore/yournextstore/compare/{base}...{head}",
      "merges_url":
          "https://api.github.com/repos/yournextstore/yournextstore/merges",
      "archive_url":
          "https://api.github.com/repos/yournextstore/yournextstore/{archive_format}{/ref}",
      "downloads_url":
          "https://api.github.com/repos/yournextstore/yournextstore/downloads",
      "issues_url":
          "https://api.github.com/repos/yournextstore/yournextstore/issues{/number}",
      "pulls_url":
          "https://api.github.com/repos/yournextstore/yournextstore/pulls{/number}",
      "milestones_url":
          "https://api.github.com/repos/yournextstore/yournextstore/milestones{/number}",
      "notifications_url":
          "https://api.github.com/repos/yournextstore/yournextstore/notifications{?since,all,participating}",
      "labels_url":
          "https://api.github.com/repos/yournextstore/yournextstore/labels{/name}",
      "releases_url":
          "https://api.github.com/repos/yournextstore/yournextstore/releases{/id}",
      "deployments_url":
          "https://api.github.com/repos/yournextstore/yournextstore/deployments",
      "created_at": "2024-08-05T19:31:52Z",
      "updated_at": "2024-08-11T17:56:54Z",
      "pushed_at": "2024-08-11T00:34:44Z",
      "git_url": "git://github.com/yournextstore/yournextstore.git",
      "ssh_url": "git@github.com:yournextstore/yournextstore.git",
      "clone_url": "https://github.com/yournextstore/yournextstore.git",
      "svn_url": "https://github.com/yournextstore/yournextstore",
      "homepage": "https://demo.yournextstore.com",
      "size": 1031,
      "stargazers_count": 1758,
      "watchers_count": 1758,
      "language": "TypeScript",
      "has_issues": true,
      "has_projects": false,
      "has_downloads": true,
      "has_wiki": false,
      "has_pages": false,
      "has_discussions": false,
      "forks_count": 162,
      "mirror_url": null,
      "archived": false,
      "disabled": false,
      "open_issues_count": 9,
      "license": {
        "key": "agpl-3.0",
        "name": "GNU Affero General Public License v3.0",
        "spdx_id": "AGPL-3.0",
        "url": "https://api.github.com/licenses/agpl-3.0",
        "node_id": "MDc6TGljZW5zZTE="
      },
      "allow_forking": true,
      "is_template": false,
      "web_commit_signoff_required": false,
      "topics": ["commerce", "nextjs", "reactjs", "stripe", "typescript"],
      "visibility": "public",
      "forks": 162,
      "open_issues": 9,
      "watchers": 1758,
      "default_branch": "main",
      "score": 1.0
    }
  ]
};

final expectedPage2GithubResponse = Result.success(
  const Pagination(
    totalInt: 3254951,
    incompleteResults: false,
    items: <GithubResponse>[
      GithubResponse(
          id: 835452752,
          fullName: 'facebookresearch/segment-anything-2',
          language: 'Jupyter Notebook',
          name: 'segment-anything-2',
          nodeId: 'R_kgDOMcv_UA',
          owner: RepoOwner(
            avatarUrl: 'https://avatars.githubusercontent.com/u/16943930?v=4',
            htmlUrl: 'https://github.com/facebookresearch',
            id: 16943930,
            login: 'facebookresearch',
            nodeId: 'MDEyOk9yZ2FuaXphdGlvbjE2OTQzOTMw',
            url: 'https://api.github.com/users/facebookresearch',
          ),
          private: false,
          stars: 8936,
          watchers: 8936,
          forks: 555,
          description:
              'The repository provides code for running inference with the Meta Segment Anything Model 2 (SAM 2), links for downloading the trained model checkpoints, and example notebooks that show how to use the model.'),
      GithubResponse(
          id: 838508060,
          fullName: 'yournextstore/yournextstore',
          language: 'TypeScript',
          name: 'yournextstore',
          nodeId: 'R_kgDOMfqeHA',
          owner: RepoOwner(
            avatarUrl: 'https://avatars.githubusercontent.com/u/159799280?v=4',
            htmlUrl: 'https://github.com/yournextstore',
            id: 159799280,
            login: 'yournextstore',
            nodeId: 'O_kgDOCYZX8A',
            url: 'https://api.github.com/users/yournextstore',
          ),
          private: false,
          stars: 1758,
          watchers: 1758,
          forks: 162,
          description:
              'Modern Commerce with Next.js and Stripe as the backend.')
    ],
  ),
);

final expectedFailGithubResponse = Result.failure(
  const Pagination<GithubResponse>(
    incompleteResults: null,
    items: null,
    totalInt: null,
  ),
);
