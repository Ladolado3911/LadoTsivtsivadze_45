//
//  ContentController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class ContentController: UIViewController {
    
    @IBOutlet weak var contentView: UITextView!
    var contentTxt: String?
    var dirName: String?
    var fileName: String?
    private var fileManager = FilesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let contentTxt = contentTxt else { return }
        contentView.text = contentTxt
    }
    
    
    @IBAction func onEdit(_ sender: Any) {
        let text = contentView.text
        guard let dirName = dirName else { return }
        guard let fileName = fileName else { return }
        fileManager.updateFile(using: text!, dirname: dirName, filename: fileName)
    }
}
