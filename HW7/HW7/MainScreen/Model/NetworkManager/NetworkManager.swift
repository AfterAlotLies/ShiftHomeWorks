//
//  NetworkManager.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit
import Foundation

protocol INetworkManager {
    func makeRequest(url: String, completion: @escaping (Result<Data,Error>) -> Void)
    func getImageFromUrl(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkManager: NSObject, INetworkManager, URLSessionDelegate, URLSessionDataDelegate {
    static let shared = NetworkManager()
    var backgroundSession: URLSession!
    var completionHandlers: [String: (Result<Data, Error>) -> Void] = [:]
    var receivedData: [String: Data] = [:]

    override init() {
        super.init()
        let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "1")
        backgroundConfig.isDiscretionary = true
        backgroundConfig.sessionSendsLaunchEvents = true
        backgroundSession = URLSession(configuration: backgroundConfig, delegate: self, delegateQueue: nil)
    }
    
    func makeRequest(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            print("Incorrect URL")
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
            print("Incorrect URL")
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
         if let error = error {
             if let completionHandler = completionHandlers[task.taskDescription ?? ""] {
                 completionHandler(.failure(error))
                 completionHandlers.removeValue(forKey: task.taskDescription ?? "")
             }
         } else if let taskDescription = task.taskDescription,
                   let data = receivedData[taskDescription] {
             if let completionHandler = completionHandlers[taskDescription] {
                 completionHandler(.success(data))
                 completionHandlers.removeValue(forKey: taskDescription)
                 receivedData.removeValue(forKey: taskDescription)
             }
         }
     }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let taskDescription = dataTask.taskDescription ?? ""
        if receivedData[taskDescription] == nil {
            receivedData[taskDescription] = Data()
        }
        receivedData[taskDescription]?.append(data)
    }
    
    func setCompletionHandler(for task: URLSessionTask, handler: @escaping (Result<Data, Error>) -> Void) {
        completionHandlers[task.taskDescription ?? ""] = handler
    }
    
}
