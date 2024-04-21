//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Lala on 07.04.24.
//

import Foundation

class ListViewModel {
    
    var listArray = [List]()
    
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
        listArray = coreDataHelper.fetchData() ?? [List]()
    }
    
    func saveData(title: String) {
        coreDataHelper.saveData(title: title)
    }
    
    func deleteData(index: Int) {
        coreDataHelper.deleteData(index: index)
    }
}
