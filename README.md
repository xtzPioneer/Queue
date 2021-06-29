# Queue
Swift 队列
### 功能简介
* 支持泛型
* 支持入队
* 支持出队
* 支持清除队列
* 支持下标设置及获取
* 支持迭代及遍历
* 支持获取相关状态
### 优点
简单高效不臃肿。
### 缺点
复杂环境难扩展。
### SPM安装
```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/xtzPioneer/Queue.git", from: "0.1.0"),
    ]
)
```
### 使用姿势
```swift
import Queue
```
#### 创建队列
```swift
var queue: Queue = Queue<Int>()
```
#### 入队
```swift
queue.enqueue(1)
```
#### 出队
```swift
queue.dequeue()
```
#### 清除队列
```swift
queue.clear()
```
#### 迭代
```swift
for element in queue {
	print("元素：\(element)")
}
```
#### 下标Set
```swift
queue[0] = 11
queue[1] = 12
```
#### 下标Get
```swift
print("下标为0的元素：\(queue[0])")
print("下标为1的元素：\(queue[1])")
```
### 反馈
> QQ：1754748325 <br> 
> E-mail：xtz_pioneer@icloud.com <br> 
> 开发中遇到bug，希望大神们能够及时指出并QQ或E-mail都可以联系到我啦！<br> 
### 开发环境&支持版本
> 开发使用最新版本Xcode，理论上支持iOS8及以上版本，如有版本适配问题，请及时反馈！多谢合作！<br> 
### 版本&更新
> 版本：0.1.3 <br>
> 更新内容：优化代码 <br>
> 更新时间：2021.6.29 <br>
> <br>
> 版本：0.1.2 <br>
> 更新内容：遵循Hashable协议 <br>
> 更新时间：2021.6.29 <br>
> <br>
> 版本：0.1.1 <br>
> 更新内容：新增初始化方法 <br>
> 更新时间：2021.6.29 <br>
> <br>
> 版本：0.1.0 <br>
> 更新内容：实现了入队、出队、清除队列等功能 <br>
> 更新时间：2021.6.29 <br>
