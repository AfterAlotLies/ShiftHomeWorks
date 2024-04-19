//
//  main.swift
//  HW2
//
//  Created by Vyacheslav on 19.04.2024.
//

import Foundation

var array = ThreadSafetyArray<Int>(array: [])
let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
let group = DispatchGroup()

private func appendElementInArray() {
    for number in 0...100 {
        array.append(number)
    }
}

private func main() {
    group.enter()
    concurrentQueue.async {
        appendElementInArray()
        group.leave()
    }
    
    group.enter()
    concurrentQueue.async {
        appendElementInArray()
        group.leave()
    }
}

main()

group.wait()
print("Number of elements in array: \(array.count)")

