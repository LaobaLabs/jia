//
//  JIAGroupPeopleListViewController.swift
//  Jia
//
//  Created by Will Chilcutt on 5/20/18.
//  Copyright © 2018 Laoba Labs. All rights reserved.
//

import UIKit

private let kJIAGroupPeopleListViewControllerAddPersonAlertTitle                            = "Add a Person"
private let kJIAGroupPeopleListViewControllerAddPersonAlertMessage                          = "What is the person's name?"
private let kJIAGroupPeopleListViewControllerAddPersonAlertNameTextFieldPlaceholderText     = "New Person's Name"

class JIAGroupPeopleListViewController: UIViewController
{
    //MARK: - Variables
    
    private let group : JIAGroup
    
    private var addPersonAlertAction : UIAlertAction?
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var tableView    : UITableView!
    
    //MARK: - Functions
    
    init(withGroup givenGroup : JIAGroup)
    {
        group = givenGroup
        
        super.init(nibName: String(describing: JIAGroupPeopleListViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = self.group.name
        
        self.setUpNavigationBar()
    }
    
    private func setUpNavigationBar()
    {
        let addPersonBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                     target: self,
                                                     action: #selector(handleUserWantsToAddAPerson))
        
        self.navigationItem.rightBarButtonItem = addPersonBarButtonItem
    }
}

//MARK: - Add a Person

extension JIAGroupPeopleListViewController
{
    @objc private func handleUserWantsToAddAPerson()
    {
        let alertView = UIAlertController(title: kJIAGroupPeopleListViewControllerAddPersonAlertTitle,
                                          message: kJIAGroupPeopleListViewControllerAddPersonAlertMessage,
                                          preferredStyle: .alert)
        
        var newPersonNameTextField : UITextField?
        
        alertView.addTextField
        { (textField) in
            newPersonNameTextField = textField
            
            textField.placeholder   = kJIAGroupPeopleListViewControllerAddPersonAlertNameTextFieldPlaceholderText
            textField.addTarget(self,
                                action: #selector(self.handleNewPersonNameTextFieldTextDidChange(_:)),
                                for: .editingChanged)
        }
        
        let addAction = UIAlertAction(title: "Add",
                                      style: .default,
                                      handler:
        { (action) in
            
            guard let textField = newPersonNameTextField, let name = textField.text else { return }
            let newPerson = JIAPerson(withName: name)
            self.group.people.append(newPerson)
            
            self.tableView.reloadData()
            
            self.addPersonAlertAction = nil
        })
        
        addAction.isEnabled = false
        
        self.addPersonAlertAction = addAction
        
        alertView.addAction(addAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        alertView.addAction(cancelAction)
        
        self.present(alertView,
                     animated: true,
                     completion: nil)
    }
    
    @objc private func handleNewPersonNameTextFieldTextDidChange(_ textField : UITextField)
    {
        if  let textFieldText = textField.text,
            textFieldText.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        {
            self.addPersonAlertAction?.isEnabled = true
        }
        else
        {
            self.addPersonAlertAction?.isEnabled = false
        }
    }
}

//MARK: - UITableViewDataSource

extension JIAGroupPeopleListViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.group.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let person = self.group.people[indexPath.row]
        
        cell?.textLabel?.text = person.name
        
        return cell!
    }
}

//MARK: - UITableViewDelegate

extension JIAGroupPeopleListViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}
