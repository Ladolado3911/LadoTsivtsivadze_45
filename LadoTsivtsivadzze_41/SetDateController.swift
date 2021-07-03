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
                let chosenDate = self.datePicker.date

                let value = Int(Date().distance(to: chosenDate))
                //print(value)

                let nextTriggerDate = Calendar.current.date(byAdding: .second, value: value, to: Date())!
                let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: nextTriggerDate)

                let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
                print("this is date")
                print(trigger.nextTriggerDate())
            }
        }
    }
    
    func registerNotification(title ttl: String, body bd: String) {
        let content = UNMutableNotificationContent()
        content.title = ttl
        content.body = bd
        content.sound = .default
    }
}
