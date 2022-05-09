import Foundation

class MinStack {
    var node: Node?

    init() {
    }
    
    func push(_ val: Int) {
        if let node = node {
            self.node = Node(val: val, parent: node, min: min(val, node.min))
        } else {
            self.node = Node(val: val, parent: nil, min: val)
        }
    }
    
    func pop() {
        node = node?.parent
    }
    
    func top() -> Int {
        return node?.val ?? 0
    }
    
    func getMin() -> Int {
        return node?.min ?? 0
    }
    
    class Node {
        var val: Int
        var parent: Node?
        var min: Int
        
        init(val: Int, parent: Node?, min: Int) {
            self.val = val
            self.parent = parent
            self.min = min
        }
    }
}

let minStack = MinStack()
minStack.push(-2)
minStack.push(0)
minStack.push(-1)
minStack.getMin() // return -2
minStack.top()
minStack.pop()
minStack.getMin() // return -2
