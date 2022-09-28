//
//  ViewController.swift
//  trial
//
//  Created by Capgemini-DA164 on 9/21/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var mobileTxt: UITextField!
    
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
        if let emailId = emailTxt.text, !emailId.isEmpty{
            print("not empty")
        } else {
            print("empty")
        }
      /*  if entityExists(email: emailTxt.text!) {
            print("alrealy exist")
        } else {
            saveCoreData()
           nav()
        } */
    }
    
    func nav(){
     //   let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let vc = UITabBarController()
        let item1 = item1ViewController()
        vc.setViewControllers([item1], animated: false)
     //  self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func saveCoreData() {
        
        
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
       let context = appDe.persistentContainer.viewContext
      
       // call entity
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        //we add data
        newUser.setValue(nameTxt.text, forKey: "name")
        newUser.setValue(emailTxt.text, forKey: "email")
        newUser.setValue(mobileTxt.text, forKey: "number")
        newUser.setValue(passwordTxt.text, forKey: "password")
        
        //now save the data
        
        do {
            try context.save()
            print("save")
          
            
        } catch  let error {
            print("error: \(error)")
        }

        
    }
    
    //Function to check Email Id Exist in coreData or not
       func entityExists( email: String) -> Bool {
               guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
              
               let managedContext = appDelegate.persistentContainer.viewContext
              let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserData")
              fetchRequest.predicate = NSPredicate(format: "email = %@", email)
              var result: [NSManagedObject] = []
              do {
                  result = try managedContext.fetch(fetchRequest)
              } catch (let error){
                  print(error.localizedDescription)
              }
              return result.count > 0
          }
    
    
    
    @IBAction func goToTabBar(_ sender: Any) {
     
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBar")
    mainTabBarController.modalPresentationStyle = .fullScreen
    
    self.present(mainTabBarController, animated: true, completion: nil)
    }
}

