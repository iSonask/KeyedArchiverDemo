//
//  Person.swift
//  KeydArchiverDemo
//
//  Created by FARHAN IT SOLUTION on 28/04/17.
//
//

import Foundation

class Person: NSObject, NSCoding {
    
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.age = decoder.decodeInteger(forKey: "age")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
    
}
