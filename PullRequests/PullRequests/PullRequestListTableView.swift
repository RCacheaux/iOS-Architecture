import UIKit

class PullRequestListTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var viewModel: PullRequestListViewModel? {
    didSet {
      self.dataSource = self
      self.delegate = self
      viewModel?.onRefreshPullRequests = { titles in
        self.pullRequestTitles = titles
        self.reloadData()
      }
    }
  }

  var pullRequestTitles: [String] = []

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pullRequestTitles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let pullRequestTitle = pullRequestTitles[indexPath.row]
    cell.textLabel!.text = pullRequestTitle
    return cell
  }

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      pullRequestTitles.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }
}

extension PullRequestListTableView {
  func insertNewObject(_ sender: AnyObject) {
    pullRequestTitles.insert("#0 New PR", at: 0)
    let indexPath = IndexPath(row: 0, section: 0)
    insertRows(at: [indexPath], with: .automatic)
  }
}


