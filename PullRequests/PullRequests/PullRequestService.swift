import Foundation

class PullRequestService {

  func getPullRequestList(onComplete: ([PullRequestSummary])->()) {
    DispatchQueue.global(attributes: .qosBackground).async {
      sleep(2)
      onComplete([PullRequestSummary(title: "Message List", number: 1),
                  PullRequestSummary(title: "Login", number: 12),
                  PullRequestSummary(title: "Add Room", number: 7)])
    }
  }

  func getPullRequestDetail(number: Int, onComplete: (PullRequestDetail)->()) {
    DispatchQueue.global(attributes: .qosBackground).async {

    }
  }

}
