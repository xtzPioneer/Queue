//
//  Queue.swift
//
//
//  Created by 张雄 on 2021/6/29.
//

import Foundation

/// 队列协议
public protocol QueueProtocol {
    
    /// 元素
    associatedtype Element
    
    /// 入队
    ///
    /// 将元素添加到队列的末尾
    /// - Parameter element: 元素
    mutating func enqueue(_ element: Element)
    
    /// 出队
    ///
    /// 删除并返回队列中的第一个元素
    /// - Returns: 如果队列不为空，则返回第一个的元素，如果队列为空则返回nil。
    mutating func dequeue() -> Element?
    
    /// 获取队列中的第一个元素
    ///
    /// 不删除队列中的第一个元素
    /// - Returns: 如果队列不为空，则返回第一个的元素，如果队列为空则返回nil。
    mutating func peek() -> Element?
    
    /// 清除队列
    mutating func clear()
    
    /// 元素的个数
    var count: Int { get }
    
    /// 队列的存储容量
    var capacity: Int { get set }
    
    /// 检查队列是否已满
    /// - Returns: 如果队列已满，则返回true，否则返回false。
    mutating func isFull() -> Bool
    
    /// 检查队列是否为空
    /// - Returns: 如果队列为空，则返回true，否则返回false。
    mutating func isEmpty() -> Bool
    
}

/// 队列
public struct Queue<Element: Hashable>: Hashable, QueueProtocol {
   
    private var elements: Array<Element>
    
    public mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    public mutating func dequeue() -> Element? {
        elements.removeFirst()
    }
    
    public mutating func peek() -> Element? {
        elements.first
    }
    
    public mutating func clear() {
        elements.removeAll()
    }
    
    public var count: Int {
        elements.count
    }
    
    public var capacity: Int {
        get {
            return elements.capacity
        }
        set {
            elements.reserveCapacity(newValue)
        }
    }
    
    public mutating func isFull() -> Bool {
        count == elements.capacity
    }
    
    public mutating func isEmpty() -> Bool {
        elements.isEmpty
    }
    
    public typealias Element = Element
    
    /// 初始化
    public init() {
        elements = Array<Element>()
    }
    
}

extension Queue {
    
    /// 通过指定的下标值来获取/设置队列中的元素
    public subscript(index: Int) -> Element {
        get {
            return elements[checkIndex(index)]
        }
        set(newValue) {
            elements[checkIndex(index)] = newValue
        }
    }
    
    /// 校验索引
    ///
    /// 校验规则：索引小于0则返回0，索引大于count则返回count - 1。
    /// - Returns: 返回合法索引
    private func checkIndex(_ index: Int) -> Int {
        let startIndex = 0
        let endIndex = count - 1
        if index < 0 {
            return startIndex
        }else if index > endIndex {
            return endIndex
        }else {
            return index
        }
    }
    
}

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    /// 在打印队列及其元素时，输出简洁漂亮的格式
    ///
    /// 返回队列及其元素的文本表示
    public var description: String {
        elements.description
    }
    
    /// 打印时输出简洁漂亮的格式，主要用于调试
    ///
    /// 返回队列及其元素的文本表示，适用于调试
    public var debugDescription: String {
        elements.debugDescription
    }
    
}

extension Queue: Sequence {
    
    public func makeIterator() -> AnyIterator<Element> {
        AnyIterator(IndexingIterator(_elements: elements.lazy))
    }
    
}

extension Queue {
    
    /// 初始化
    /// - Parameter elements: 元素集合
    public init<T: Sequence>(_ elements: T) where T.Iterator.Element == Element {
        self.init()
        self.elements.append(contentsOf: elements)
    }
    
}

extension Queue: ExpressibleByArrayLiteral {
    
    /// 初始化
    /// - Parameter elements: 元素集合
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    public typealias ArrayLiteralElement = Element
    
}
