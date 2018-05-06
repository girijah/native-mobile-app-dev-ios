//
//  ViewController.swift
//  FilmList
//
//  Created by Girijah Nagarajah on 3/30/18.
//  Copyright © 2018 Core Sparker. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var films: [String] = []
    
    var films: [NSManagedObject] = []
    var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Film List"
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myFilmCell")
        
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Film")
        managedContext = appDelegate.persistentContainer.viewContext

        //3
        do {
            films = try managedContext.fetch(fetchRequest)
            
            
//            do {
//            try managedContext.save()
//            }
//            catch let error as NSError {
//                print("error")
//            }
//            tableView.reloadData()
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "New Film", message: "Add a film",
                                      preferredStyle: .alert)
//        let saveAction = UIAlertAction(title: "Save", style: .default) {
//            [unowned self] action in
//            guard let textField = alert.textFields?.first,
//                let nameToSave = textField.text else {
//                    return
//            }
//            self.films.append(nameToSave)
//            self.tableView.reloadData()
//
//        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            
            let nameTextField = alertController.textFields![0] as UITextField
            let rateTextField = alertController.textFields![1] as UITextField
           
            
            self.save(name: nameTextField.text!, rating: Int16(rateTextField.text!)!)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addTextField()
        alertController.addTextField()
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

    func save(name: String, rating: Int16) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //
        let managedContext = appDelegate.persistentContainer.viewContext
        // 2
        let film:Film = Film(context: managedContext) // 3
        film.name = name
        film.rating = rating
        // 4
        
        do {
             films.append(film)
            
            try managedContext.save()
            tableView.reloadData()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "myFilmCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        let film = films[indexPath.row]
        cell?.textLabel?.text = film.value(forKeyPath: "name") as? String
        let rate = film.value(forKeyPath: "rating") as! Int16
        cell?.detailTextLabel?.text = "Rating: \(rate)"
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            managedContext.delete(films[indexPath.row])
            films.remove(at: indexPath.row)
            
            do {
                try managedContext.save()
            }
            catch {
                print ("error!")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

    


