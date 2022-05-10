import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

public class LinkList {
    public init() { }
    
    public func build(_ arr: [Int]) -> ListNode? {
        var root: ListNode? = nil
        var preNode: ListNode? = nil
        for i in 0..<arr.count {
            let node = ListNode(arr[i])
            if root == nil {
                root = node
            } else {
                preNode?.next = node
            }
            preNode = node
        }
        return root
    }
    
    public func buildCycle(_ arr: [Int], pos: Int = -1) -> ListNode? {
        var root: ListNode? = nil
        var stack = [ListNode]()
        for i in 0..<arr.count {
            let node = ListNode(arr[i])
            if root == nil {
                root = node
            } else if let preNode = stack.last {
                preNode.next = node
            }
            stack.append(node)
        }
        
        if pos >= 0 && pos < arr.count {
            let last = stack.last
            last?.next = stack[pos]
        }
        return root
    }
    
    public func convertToArray(_ root: ListNode?) -> [Int] {
        var arr = [Int]()
        var pre = root
        while pre != nil {
            arr.append(pre?.val ?? 0)
            pre = pre?.next
        }
        return arr
    }
}
