    import XCTest
    @testable import Queue

    final class QueueTests: XCTestCase {
        func testExample() {
            var queue: Queue = Queue<Int>()
            
            queue.enqueue(1)
            queue.enqueue(2)
            
            queue[0] = 11
            queue[1] = 12
            
            queue.enqueue(3)
            queue.enqueue(4)
            queue.enqueue(5)
            queue.enqueue(7)
            queue.enqueue(8)
            queue.enqueue(9)
            
            if let element = queue.dequeue() {
                print("出队元素：\(element)")
            }
            
            if let element = queue.dequeue() {
                print("出队元素：\(element)")
            }
            
            if let element = queue.dequeue() {
                print("出队元素：\(element)")
            }
            
            queue.enqueue(13)
            queue.enqueue(14)
            
            
            // 迭代
            for element in queue {
                print("元素：\(element)")
            }
            
            if queue.isEmpty() {
                print("空队列")
            }
            if queue.isFull() {
                print("队列满了")
            }
            
            print("下标为0的元素：\(queue[0])")
            print("下标为1的元素：\(queue[1])")
            
            print("描述：\(queue.description)")
            print("debug描述：\(queue.debugDescription)")
            
            print("队列容量：\(queue.capacity)")
            print("队列数量：\(queue.count)")
        }
    }