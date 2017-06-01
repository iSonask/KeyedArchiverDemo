//
//  ViewController.swift
//  KeydArchiverDemo
//
//  Created by FARHAN IT SOLUTION on 28/04/17.
//
//

import UIKit

class ViewController: UIViewController {
    
    var filePath : String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        return url.appendingPathComponent("objectsArray")!.path
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting a value for a key
        let chandler = Person(name: "Chandler Bing", age: 10)
        let joe = Person(name: "Joe Tribiiyani", age: 12)
        let rachel = Person(name: "Rachel", age: 14)
        let ross = Person(name: "Ross", age: 13)
        let monica = Person(name: "Monica", age: 15)
        let pheobe = Person(name: "pheobe", age: 19)
        var people = [Person]()
        people += [chandler,joe,rachel,ross,monica,pheobe]
        
//        people.append(chandler)
//        people.append(joe)
//        people.append(rachel)
//        people.append(ross)
//        people.append(monica)
//        people.append(pheobe)
        ////use to store class object
        
//        let encodedData = NSKeyedArchiver.archivedData(withRootObject: people)
//        UserDefaults.standard.set(encodedData, forKey: "people")
//        
//        // retrieving a value for a key
//        if let data = UserDefaults.standard.data(forKey: "people"),
//            let myPeopleList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Person] {
//            myPeopleList.forEach({print( $0.name, $0.age)})  // Joe 10
//        } else {
//            print("There is an issue")
//        }
        
        NSKeyedArchiver.archiveRootObject(people, toFile: filePath)
        
        if let array = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Person] {
            array.forEach({print($0.name,$0.age)})
        }
        
    }


}

