//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    static let sharedInstance = ReposDataStore()
    private init() {}
    
    var repositories = [GithubRepository]()
    
    
    
    func getRepositoriesFromAPI(with completion: @escaping () -> ()) {
        GithubAPIClient.getRepositories { (data) in
            for i in 0...data.count - 1 {
                
                self.repositories.append(GithubRepository(dictionary: data[i]))
            }
        }
        completion()
    }
    
}
