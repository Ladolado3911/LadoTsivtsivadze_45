//
//  SetDateController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 7/3/21.
//

import UIKit

class SetDateController: BaseViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    var answer: String?
    var dirName: String?
    var reminderController: ReminderController?
    var editController: EditController?
    var rootCell: ReminderCell?
    let filesManager = FilesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSetReminder(_ sender: UIButton) {
        guard let answer = answer else { return }
        guard let dirName = dirName else { return }

        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            if let reminderController = self.reminderController {
                self.filesManager.createReminderTxt(name: answer, dirName: dirName)
                reminderController.tblView.reloadData()
                self.rootCell!.tblView.reloadData()
            }
            else if let editController = self.editController {
                editController.tblView.reloadData()
            }
            else {
                return
            }
        }
    }
}
