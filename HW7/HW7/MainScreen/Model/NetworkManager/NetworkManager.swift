//
//  NetworkManager.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit
import Foundation

protocol INetworkManager {
    func makeRequest(keyWord: String, completion: @escaping (Result<Data,Error>) -> Void)
    func getImageFromUrl(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkManager: NSObject, INetworkManager, URLSessionDelegate, URLSessionDataDelegate {
    
    lazy var backgroundSession: URLSession = {
        let backgroundConfig = URLSessionConfiguration.background(withIdentifier: UUID().uuidString)
        backgroundConfig.isDiscretionary = true
        backgroundConfig.sessionSendsLaunchEvents = true
        return URLSession(configuration: backgroundConfig, delegate: self, delegateQueue: nil)
    }()
    
    private var completionHandlers: [String: (Result<Data, Error>) -> Void] = [:]
    private var receivedData: [String: Data] = [:]
    
    func makeRequest(keyWord: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://dog.ceo/api/breed/\(keyWord)/images/random"
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = backgroundSession.dataTask(with: url)
        task.taskDescription = UUID().uuidString
        setCompletionHandler(for: task, handler: completion)
        task.resume()
    }
    
    func getImageFromUrl(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: imageUrl) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = backgroundSession.dataTask(with: url)
        task.taskDescription = UUID().uuidString
        setCompletionHandler(for: task, handler: completion)
        
        task.resume()
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            if let completionHandler = (UIApplication.shared.delegate as? AppDelegate)?.backgroundSessionCompletionHandler {
                completionHandler()
            }
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let taskDescription = task.taskDescription else { return }
        
        if let error = error {
            handleRequestCompletion(taskDescription: taskDescription, result: .failure(error))
        } else if let data = receivedData[taskDescription] {
            handleRequestCompletion(taskDescription: taskDescription, result: .success(data))
        }
    }

    func handleRequestCompletion(taskDescription: String, result: Result<Data, Error>) {
        if let completionHandler = completionHandlers[taskDescription] {
            completionHandler(result)
            completionHandlers.removeValue(forKey: taskDescription)
            switch result {
            case .success(_):
                receivedData.removeValue(forKey: taskDescription)
            case .failure(_):
                print("error")
            }
        }
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        if let taskDescription = dataTask.taskDescription {
            if receivedData[taskDescription] == nil {
                receivedData[taskDescription] = Data()
            }
            receivedData[taskDescription]?.append(data)
        }
       
    }
    
    func setCompletionHandler(for task: URLSessionTask, handler: @escaping (Result<Data, Error>) -> Void) {
        if let taskDescription = task.taskDescription {
            completionHandlers[taskDescription] = handler
        }
    }
    
}
