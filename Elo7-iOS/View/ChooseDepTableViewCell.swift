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
        let toolbar = UIToolbar()
        dataPicker.delegate = self
        dataPicker.dataSource = self

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))

        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolbar.sizeToFit()
        depsTextField.inputAccessoryView = toolbar
        depsTextField.inputView = dataPicker
    }

    @objc func doneClick() {
        depsTextField.resignFirstResponder()
    }
    @objc func cancelClick() {
        depsTextField.resignFirstResponder()
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
