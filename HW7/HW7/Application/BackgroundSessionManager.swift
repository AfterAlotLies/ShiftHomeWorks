//
//  BackgroundSessionManager.swift
//  HW7
//
//  Created by Vyacheslav on 05.06.2024.
//

import Foundation

class BackgroundSessionManager: NSObject, URLSessionDelegate {
    static let shared = BackgroundSessionManager()
    var backgroundCompletionHandler: (() -> Void)?
    
    lazy var backgroundSession: URLSession = {
        let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "com.yourapp.backgroundsession")
        backgroundConfig.isDiscretionary = true
        backgroundConfig.sessionSendsLaunchEvents = true
        return URLSession(configuration: backgroundConfig, delegate: self, delegateQueue: nil)
    }()
    
    private var completionHandlers: [Int: (Result<Data, Error>) -> Void] = [:]
    private var receivedData: [Int: Data] = [:]
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            self.backgroundCompletionHandler?()
            self.backgroundCompletionHandler = nil
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let handler = completionHandlers[task.taskIdentifier] {
            let data = receivedData[task.taskIdentifier] ?? Data()
            if let error = error {
                handler(.failure(error))
            } else {
                handler(.success(data))
            }
            completionHandlers.removeValue(forKey: task.taskIdentifier)
            receivedData.removeValue(forKey: task.taskIdentifier)
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        if receivedData[dataTask.taskIdentifier] == nil {
            receivedData[dataTask.taskIdentifier] = Data()
        }
        receivedData[dataTask.taskIdentifier]?.append(data)
    }
    
    func addCompletionHandler(handler: @escaping (Result<Data, Error>) -> Void, forTaskIdentifier identifier: Int) {
        completionHandlers[identifier] = handler
    }
}

