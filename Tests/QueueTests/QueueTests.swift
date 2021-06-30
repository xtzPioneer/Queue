    import XCTest
    @testable import Queue

    final class QueueTests: XCTestCase {
                
        func testExample() {
            // 初始化方法1
            var queue1: Queue = Queue<Int>()
            
            // 入队
            queue1.enqueue(1)
            queue1.enqueue(2)
            
            // 下标Set
            queue1[0] = 11
            queue1[1] = 12
            
            // 入队
            queue1.enqueue(3)
            queue1.enqueue(4)
            queue1.enqueue(5)
            queue1.enqueue(7)
            queue1.enqueue(8)
            queue1.enqueue(9)
            
            // 出队
            for _ in 1...20 {
                if let element = queue1.dequeue() {
                    print("出队元素：\(element)")
                }
            }
            
            // 入队
            queue1.enqueue(13)
            queue1.enqueue(14)
            
            // 迭代
            for element in queue1 {
                print("元素：\(element)")
            }
            
            if queue1.isEmpty() {
                print("空队列")
            }
            if queue1.isFull() {
                print("队列满了")
            }
            
            // 下标Get
            print("下标为0的元素：\(queue1[0])")
            print("下标为1的元素：\(queue1[1])")
            
            // 容量/数量
            print("队列容量：\(queue1.capacity)")
            print("队列数量：\(queue1.count)")
            
            // 描述
            print("描述1：\(queue1.description)")
            
            // 初始化方法2
            var queue2: Queue = Queue(queue1)
            // 下标Set
            queue2[0] = 15
            queue2[1] = 16
            // 描述
            print("描述2：\(queue2.description)")
            
            // 对比
            if queue1 == queue2 {
                print("相等")
            }else {
                print("不相等")
            }
            
        }
    }
