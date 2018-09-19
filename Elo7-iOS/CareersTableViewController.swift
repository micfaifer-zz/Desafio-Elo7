//
//  CareersTableViewController.swift
//  Elo7-iOS
//
//  Created by lugia on 18/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class CareersTableViewController: UITableViewController {
    let departments = [String](arrayLiteral: "Engenharia", "Comunicação")

    @IBOutlet weak var departmentTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDepartmentTextField()
    }

    func setupDepartmentTextField() {
        let dataPicker = UIPickerView()
        dataPicker.delegate = self
        dataPicker.dataSource = self
        departmentTextField.inputView = dataPicker
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

// MARK: - picker view data source and delegate
extension CareersTableViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departments.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departments[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.departmentTextField.text = self.departments[row]
    }
}
