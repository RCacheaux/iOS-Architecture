import UIKit

// Pull Request View Model.
class PullRequestViewController: UITableViewController {

  func configureView() {
    // Update the user interface for the detail item.
    if let pullRequest = self.pullRequest {

    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  var pullRequest: PullRequestSummary? {
    didSet {
        // Update the view.
        self.configureView()
    }
  }


}

