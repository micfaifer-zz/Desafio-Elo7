//
//  ChooseDepTableViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 19/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class ChooseDepTableViewCell: UITableViewCell {

    @IBOutlet weak var depsTextField: DesignableUITextField!

    let departments = [String](arrayLiteral: "Engenharia", "Comunicação")

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDepartmentTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupDepartmentTextField() {
        let dataPicker = UIPickerView()
        dataPicker.delegate = self
        dataPicker.dataSource = self
        depsTextField.inputView = dataPicker
    }
}

extension ChooseDepTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
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
        self.depsTextField.text = self.departments[row]
    }
}
