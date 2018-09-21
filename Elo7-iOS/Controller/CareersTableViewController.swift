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

    //table view identifiers
    let chooseDepCellIdentifier = "chooseDep"
    let depsCellIdentifier = "deps"
    let cultureCellIdentifier = "cultureCell"
    let socialCellIdentifier = "socialCell"

    //collection view indentifiers
    let depCellIdentifier = "depCell"
    let cultureItemCellIdentifier = "cultureItemCell"
    let socialMediaItemCellIdentifier = "socialItemCell"

    var careerPage: CareerPageResult? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCareerPage()
    }

    func getCareerPage() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        service.fetchCareerHome { (result) in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            switch(result) {
            case Result.failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            case Result.success(let result):
                DispatchQueue.main.async {
                    self.careerPage = result
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // escolha departamento
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: chooseDepCellIdentifier) as! ChooseDepTableViewCell
            cell.setUIPickerViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.layoutIfNeeded()
            return cell

        // cultura
        } else if indexPath.row == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cultureCellIdentifier) as! CultureTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            return cell

        // departamentos
        } else if indexPath.row == 2 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: depsCellIdentifier) as! DepsTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            return cell

        // social
        } else if indexPath.row == 3 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: socialCellIdentifier) as! SocialTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            return cell
        }

        return UITableViewCell()
    }
}

// MARK: - Collection view data source e delegates
extension CareersTableViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // departamentos
        if collectionView.tag == 1 {
            return careerPage?.cultureInfos.cultureItems.count ?? 0
        // cultura
        } else if collectionView.tag == 2 {
            return careerPage?.departmentsInfos.departments.count ?? 0
        // social
        } else if collectionView.tag == 3 {
            return careerPage?.socialInfos.socialItems.count ?? 0
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cultura
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cultureItemCellIdentifier, for: indexPath) as! CultureCollectionViewCell

            cell.iconImageView.image = UIImage(named: careerPage?.cultureInfos.cultureItems[indexPath.row].iconName ?? "")
            cell.tittleLabel.text = careerPage?.cultureInfos.cultureItems[indexPath.row].name
            cell.descriptionLabel.text = careerPage?.cultureInfos.cultureItems[indexPath.row].description
            return cell

        // departamentos
        } else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: depCellIdentifier, for: indexPath) as! DepartmentCollectionViewCell

            cell.depIconImageView.image = UIImage(named: careerPage?.departmentsInfos.departments[indexPath.row].iconName ?? "")
            cell.titleLabel.text = careerPage?.departmentsInfos.departments[indexPath.row].name
            return cell

        // social
        } else if collectionView.tag == 3 {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: socialMediaItemCellIdentifier, for: indexPath) as! SocialMediaCollectionViewCell
            cell.iconImage.image =  UIImage(named: careerPage?.socialInfos.socialItems[indexPath.row].iconName ?? "")
            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // cultura
        if collectionView.tag == 1 {
            let width = collectionView.bounds.width * 0.9
            return CGSize(width: width, height: width)

        // departamentos
        } else if collectionView.tag == 2 {
            let width = (collectionView.bounds.width/2.0) - 10
            return CGSize(width: width, height: width)

        // social
        } else if collectionView.tag == 3 {
            let width = (collectionView.bounds.width/CGFloat(careerPage?.socialInfos.socialItems.count ?? 1))
            return CGSize(width: width, height: width)
        }
        return CGSize.zero
    }
}

// MARK: - Picker view data source e delegates
extension CareersTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return careerPage?.departmentsInfos.departments.count ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return careerPage?.departmentsInfos.departments[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: pickerView.tag, section: 0)) as? ChooseDepTableViewCell {
            cell.updateDepsTextField(with: careerPage?.departmentsInfos.departments[row].name)
        }
    }
}
