//
//  APICaller.swift
//  News
//
//  Created by Nikolay Zhukov on 02.08.2023.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlineURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=eda6154a62744b7bbad849130a7f7b6f")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.topHeadlineURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    print(result.articles.count)
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

//Models
struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let sourse: Sourse
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Sourse: Codable {
    let name: String
}
