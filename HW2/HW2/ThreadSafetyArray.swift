//
//  ThreadSafetyArray.swift
//  HW2
//
//  Created by Vyacheslav on 19.04.2024.
//

import Foundation

protocol IThreadSafetyArray {
    associatedtype T: Equatable
    var count: Int { get }
    var isEmpty: Bool { get }
    func append(_ item: T)
    func remove(at index: Int)
    func `subscript`(index: Int) -> T?
    func contains(_ element: T) -> Bool
}

class ThreadSafetyArray<T: Equatable>: IThreadSafetyArray {
    
    private var array: [T]
    private let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 1)
    
    init (array: [T]) {
        self.array = array
    }
    
    public var count: Int {
        self.array.count
    }
    
    public var isEmpty: Bool {
        self.array.isEmpty
    }
    
    public func append(_ item: T) {
        semaphoreActivity {
            self.array.append(item)
        }
    }
    
    public func remove(at index: Int) {
        semaphoreActivity {
            if !array.isEmpty && index >= 0 && index < array.count {
                self.array.remove(at: index)
            }
        }
    }
    
    public func `subscript`(index: Int) -> T? {
        var result: T?
        
        semaphoreActivity {
            guard index >= 0 && index < array.count else {
                print("Index out of range")
                return
            }
            result = array[index]
        }
        return result
    }
    
    public func contains(_ element: T) -> Bool {
        var isContains = false
        semaphoreActivity {
            isContains = self.array.contains { $0 == element }
        }
        return isContains
    }
}

extension ThreadSafetyArray {
    
    private func semaphoreActivity(completion: () -> Void) {
        semaphore.wait()
        completion()
        semaphore.signal()
    }
}

extension ThreadSafetyArray {
    public func getData() -> [T] {
        concurrentQueue.sync {
            return array
        }
    }
}
