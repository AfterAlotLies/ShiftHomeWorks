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
    for number in 0...10 {
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
print("Number of elements in array before removing: \(array.count)")
print(array.getData())
array.remove(at: -1)
array.remove(at: 0)
array.remove(at: -1)
print("Number of elements in array after removing: \(array.count)")
print(array.getData())
print(array.subscript(index: 104))
print(array.subscript(index: 2))
