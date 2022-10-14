//
//  Service.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import Foundation

protocol ISearchService {
    func fetchSearch(url: URL, onSuccess: @escaping ([Search]) -> Void, onFail: @escaping (Error) -> Void
    )
}

class SearchService: ISearchService {
    func fetchSearch(url: URL, onSuccess: @escaping ([Search]) -> Void, onFail: @escaping (Error) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data,respone,error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let searchObject = try JSONDecoder().decode(SearchResult.self, from: data!)
                guard let searchObjectData = searchObject.results else { return }
                onSuccess(searchObjectData)
            } catch {
                onFail(error)
            }
        }.resume()
    }
}
