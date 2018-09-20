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
    let depCellIdentifier = "depCell"

    var departments: DepartmentsInfos? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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

            cell.setUIPickerViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)

            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: depsCellIdentifier) as! DepsTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)

            cell.updateHeightDelegate = self
            return cell
        }
    }
}

extension CareersTableViewController: UpdateCellTableHeightDelegate {
    func updateHeight(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}

// MARK: - Collection view data source e delegates
extension CareersTableViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return departments?.departments.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: depCellIdentifier, for: indexPath) as! DepartmentCollectionViewCell

        cell.depIconImageView.image = UIImage(named: departments?.departments[indexPath.row].iconName ?? "")
        cell.titleLabel.text = departments?.departments[indexPath.row].name
        cell.layoutIfNeeded()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2.0 - 10
        return CGSize(width: width, height: width)
    }
}

// MARK: - Picker view data source e delegates
extension CareersTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departments?.departments.count ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departments?.departments[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: pickerView.tag, section: 0)) as? ChooseDepTableViewCell {
            cell.updateDepsTextField(with: departments?.departments[row].name)
        }
    }
}
