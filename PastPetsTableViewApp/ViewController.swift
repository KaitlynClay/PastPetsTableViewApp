//
//  ViewController.swift
//  PastPetsTableViewApp
//
//  Created by student on 3/14/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pastPets: UITableView!
    
    
    let petArray = [["CATS", "Badge", "Roger", "Bolt", "Mystery", "Tiger", "Patch", "Alaska", "Drake", "Sir Francis", "Chess", "Checkers", "Gem", "Ned", "Gerald"], ["COWS", "Midnight", "Swift Fawn", "MooShine", "Romam", "Archer", "Blazing Soldier", "Tiny"], ["DOGS", "Nala", "Shantih", "Cody", "Copper"], ["FISH", "Comet", "Spartan", "Athena", "Shimmering Arrow", "Houdini", "Marsh", "Mello", "Mars", "Angel", "Fury", "Storm Cloud", "Sand Storm", "White Cloud", "Linder", "Talon", "Indigo", "Dwarf"], ["HORSES", "Cruiser", "Phoenix", "Chance", "Jasmine", "Chevy", "Snap", "Cole"]]
    
    let indexArray = ["Cat", "Cow", "Dog", "Fish", "Horse"]
    
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        pastPets.dataSource = self
        pastPets.delegate = self
        pastPets.sectionIndexColor = UIColor.white
        pastPets.sectionIndexBackgroundColor = UIColor.black
        pastPets.sectionIndexTrackingBackgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cellID == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in})
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }


}



