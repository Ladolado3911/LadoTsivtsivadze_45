//
//  ViewController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

typealias Table = UITableViewDataSource & UITableViewDelegate

class ReminderController: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!
    private var fileManager = FilesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        //FilesManager().createDirectory(name: "good")
        //FilesManager().getDirUrl(dirName: "good")
        //print(FilesManager().directories)
        //print(FilesManager().getContentsofDirectory(dirname: "good"))
        //print(FilesManager().getContentsofDirectory(dirname: "something"))
        //FilesManager().createReminderTxt(name: "text2", dirName: "good")
        //print(FilesManager().appUrl)
    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "ReminderCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "ReminderCell")
    }
    
    @IBAction func onAddButton(_ sender: Any) {
        
        let ac = UIAlertController(title: "Category",
                                   message: "Enter Category Name",
                                   preferredStyle: .alert)
        
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Add",
                                         style: .cancel) { [weak self] action in
            guard let self = self else { return }
            let catName = ac.textFields![0].text
            self.fileManager.createDirectory(name: catName!)
            self.tblView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive) { action in
            
        }
        ac.addAction(submitAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
        
    }
}

extension ReminderController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fileManager.directories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as? ReminderCell
        //cell!.configCell(categoryName: fileManager.directories[indexPath.row])
        cell!.category = fileManager.directories[indexPath.row]
        cell!.rootController = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = fileManager.directories[indexPath.row]
        coordinator?.goToEdit(categoryName: name)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
}

