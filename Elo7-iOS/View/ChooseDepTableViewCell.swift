//
//  ChooseDepTableViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 19/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class ChooseDepTableViewCell: UITableViewCell {

    @IBOutlet private weak var depsTextField: DesignableUITextField!

    private let dataPicker = UIPickerView()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDepartmentTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupDepartmentTextField() {
        let toolbar = UIToolbar()

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))

        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolbar.sizeToFit()
        depsTextField.inputAccessoryView = toolbar
        depsTextField.inputView = dataPicker
    }

    func updateDepsTextField(with title: String?) {
        DispatchQueue.main.async {
            self.depsTextField.text = title
        }
    }

    @objc func doneClick() {
        depsTextField.resignFirstResponder()
    }

    @objc func cancelClick() {
        depsTextField.resignFirstResponder()
    }

    func setUIPickerViewDataSourceDelegate
        <D: UIPickerViewDelegate & UIPickerViewDataSource>
        (dataSourceDelegate: D, forRow row: Int) {

        dataPicker.delegate = dataSourceDelegate
        dataPicker.dataSource = dataSourceDelegate
        dataPicker.tag = row
        dataPicker.reloadAllComponents()
    }
}
