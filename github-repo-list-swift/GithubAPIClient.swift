//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit



class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String: Any]]) -> Void) {
        let urlString = "https://api.github.com/repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)"
        // URL object
        let url = URL(string: urlString)
        
        // Start URL Session
        if let url = url {
            let session = URLSession.shared
            
            // DataTask object
            let task = session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                        
                
                        completion(responseJSON)
                    } catch {
                        print("Something didn't work")
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
}
    


