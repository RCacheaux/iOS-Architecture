import Foundation

class PullRequestRepository {

  let pullRequestService = PullRequestService()

  func getPullRequestList(onComplete: ([PullRequestSummary])->()) {
    pullRequestService.getPullRequestList { pullRequests in
      DispatchQueue.main.async {
        onComplete(pullRequests)
      }
    }
  }

  func getPullRequestDetail(number: Int, onComplete: (PullRequestDetail)->()) {
    pullRequestService.getPullRequestDetail(number: number) { detail in
      DispatchQueue.main.async {
        onComplete(detail)
      }
    }
  }
}
