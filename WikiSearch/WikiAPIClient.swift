//
//  WikiAPIClient.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation
import UIKit

class WikiAPIClient {
  
  class func getPages(text: String, with completion: @escaping ([String: Any]) -> ()) {
    
    let urlString = "https://en.wikipedia.org/w/api.php?action=query&prop=pageimages&format=json&piprop=thumbnail&pithumbsize=96&pilimit=50&generator=prefixsearch&gpssearch=" + text + "&gpslimit=50"
    

    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
      if let returnJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
        if let returnJson = returnJson {
          // return JSON back to Data Singleton
          completion(returnJson)
        }
      }
    }
    task.resume()
  }
}






















