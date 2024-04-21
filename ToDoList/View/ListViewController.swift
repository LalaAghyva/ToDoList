//
//  ListViewController.swift
//  ToDoList
//
//  Created by Lala on 07.04.24.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func updateTableView() {
        viewModel.fetchData()
        table.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        alertWithTextField(with: "AddItem",
                           "",
                           "Add",
                           "Cancel",
                           "Enter here") { text in
            if !text.isEmpty {
                self.viewModel.saveData(title: text)
                self.updateTableView()
            }
        }
    }
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }
    }
}
