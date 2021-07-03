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
    var reminderController: ReminderController?
    var editController: EditController?
    let filesManager = FilesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSetReminder(_ sender: UIButton) {
        guard let answer = answer else { return }

        
        
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.filesManager.createDirectory(name: answer)
            if let reminderController = self.reminderController {
                reminderController.tblView.reloadData()
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
