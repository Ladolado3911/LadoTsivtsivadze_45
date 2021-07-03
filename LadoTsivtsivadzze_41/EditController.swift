//
//  EditController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class EditController: BaseViewController {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var categoryName2: String?
    var content: String?
    
    private var fileManager = FilesManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let categoryName3 = categoryName2 else { return }
        categoryName.text = categoryName3
    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "Cell3", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "Cell3")
    }
}

extension EditController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = categoryName2 else { return 0 }
        return fileManager.getFilesofDirectory(dirname: category)!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = categoryName2 else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as? Cell3
        cell!.title2 = fileManager.getFilesofDirectory(dirname: category)![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let categoryName2 = categoryName2 else { return }
        guard let filename = fileManager.getFilesofDirectory(dirname: categoryName2) else { return }
        let file = filename[indexPath.row]
        let contentTxt = fileManager.getContentofFileofDirectory(dirname: categoryName2, filename: file)
        coordinator?.goToContent(dirname: categoryName2, contentTxt: contentTxt!, filename: file)
    }
}
