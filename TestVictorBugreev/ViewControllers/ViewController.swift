//
//  ViewController.swift
//  TestVictorBugreev
//
//  Created by 17760021 on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var kids = [Kids]()
    
    @IBOutlet weak var tabel: UITableView!
    @IBOutlet weak var addKid: UIBarButtonItem!
    
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surname.delegate = self
        name.delegate = self
        middleName.delegate = self
        age.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func AddKid(_ sender: UIBarButtonItem) {
        alertAddKid()
        print(kids)
    }
    
    @IBAction func delitKid(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tabel)
        guard let indexPath = tabel.indexPathForRow(at: point) else {return}
        kids.remove(at: indexPath.row)
        tabel.beginUpdates()
        tabel.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        tabel.endUpdates()
    }
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if kids.count == 5 {
            addKid.isEnabled = false
        } else {
            addKid.isEnabled = true
        }
        return kids.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! KidTableViewCell
        let kid = kids[indexPath.row]
        cell.FullnameKid.text = kid.fullName
        cell.AgeKid.text = "Возраст: \(kid.age)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            kids.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let elementToMove = kids[fromIndexPath.row]
        kids.remove(at: fromIndexPath.row)
        kids.insert(elementToMove, at: to.row)
    }
}


extension ViewController {
    func alertAddKid() {
        
        
        let alertController = UIAlertController(title: "Добавить", message: "введите информацию о ребенке", preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        let alertOkAction = UIAlertAction(title: "Добавить", style: .default) {
            _ in
            let textFieldName = alertController.textFields?[0].text
            let textFieldSurname = alertController.textFields?[1].text
            let textFieldMiddleName = alertController.textFields?[2].text
            let textFieldAge = alertController.textFields?[3].text
            let newKid = Kids.init(name: textFieldName!, surname: textFieldSurname! , middleName: textFieldMiddleName!, age: Int(textFieldAge!)!)
            self.kids.append(newKid)
            self.tabel.reloadData()
        }
        
        alertController.addTextField(configurationHandler: kidName)
        alertController.addTextField(configurationHandler: kidSurname)
        alertController.addTextField(configurationHandler: kidMiddleName)
        alertController.addTextField(configurationHandler: kidAge)
        
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancel)
        
        self.present(alertController, animated: true)
        
    }
    
    func kidName(textField: UITextField!) {
        textField.placeholder = "Имя ребенка"
    }
    
    func kidSurname(textField: UITextField!) {
        textField.placeholder = "Фамилия ребенка"
    }
    
    func kidMiddleName(textField: UITextField!) {
        textField.placeholder = "Отчество ребенка"
    }
    
    func kidAge(textField: UITextField!) {
        textField.placeholder = "Возраст ребенка"
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
}
