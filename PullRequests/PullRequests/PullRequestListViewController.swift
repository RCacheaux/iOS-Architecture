import UIKit

// Pull Request List View Model.
class PullRequestListViewController: UIViewController, PullRequestListViewModel {
  // Data
  let pullRequestRepository = PullRequestRepository() // Injected.
  var pullRequests: [PullRequestSummary] = []
  var pullRequestTitles: [String] = []
  var indexPathForSelectedRow: NSIndexPath?

  var onRefreshPullRequests: (([String])->Void)?

  // UI
  var pullRequestViewController: PullRequestViewController? = nil
}

extension PullRequestListViewController {
  func refreshPullRequests(pullRequests: [PullRequestSummary]) {
    self.pullRequests = pullRequests
    self.pullRequestTitles = pullRequests.map { "#\($0.number) \($0.title)" }
    onRefreshPullRequests?(self.pullRequestTitles)
  }
}

extension PullRequestListViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem()

    // TODO: Re-enable.
//    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//    self.navigationItem.rightBarButtonItem = addButton
    if let split = self.splitViewController {
      let controllers = split.viewControllers
      self.pullRequestViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? PullRequestViewController
    }


    pullRequestRepository.getPullRequestList { pullRequests in
      self.refreshPullRequests(pullRequests: pullRequests)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    // TODO: Re-enable.
//    self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = indexPathForSelectedRow {
        let pullRequest = pullRequests[indexPath.row]
        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! PullRequestViewController
        controller.pullRequest = pullRequest
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }

}



