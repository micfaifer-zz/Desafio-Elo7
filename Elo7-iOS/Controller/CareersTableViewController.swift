//
//  CareersTableViewController.swift
//  Elo7-iOS
//
//  Created by lugia on 18/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class CareersTableViewController: UITableViewController {
    let service = Service()

    let chooseDepCellIdentifier = "chooseDep"
    let depsCellIdentifier = "deps"

    var departments: DepartmentsInfos? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 200.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        getCareerPage()
    }

    func getCareerPage() {
        service.fetchCareerHome { (result) in
            switch(result) {
            case Result.failure(let error):
                print(error.localizedDescription)
            case Result.success(let result):
                self.departments = result.departmentsInfos
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: chooseDepCellIdentifier) as! ChooseDepTableViewCell
            if let departments = departments?.departments {
                cell.departments = departments
            }

            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: depsCellIdentifier) as! DepsTableViewCell

            cell.updateHeightDelegate = self
            cell.indexPath = indexPath

            if let departments = departments?.departments {
                cell.departments = departments
            }
            return cell
        }
    }
}

extension CareersTableViewController: UpdateCellTableHeightDelegate {
    func updateHeight(with height: CGFloat, at indexPath: IndexPath) {
        self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
}
