import Foundation

struct PullRequestDetail {
  let summary: PullRequestSummary
  let author: String
  let reviewers: [String]
  let status: String
  let description: String
}
