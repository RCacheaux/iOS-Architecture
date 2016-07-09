import Foundation

@objc
protocol PullRequestListViewModel {
  var pullRequestTitles: [String] { get }
  var indexPathForSelectedRow: NSIndexPath? { get set }

  var onRefreshPullRequests: (([String])->Void)? { get set }
}
