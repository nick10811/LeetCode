import Foundation

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var stack = [Int]()
        // count length of array
        var current = head
        while current != nil {
            stack.append(current!.val)
            current = current?.next
        }
        
        guard stack.count > 1 else { return head }

        // make circular link list & break it
        var root: ListNode? = nil
        var originalFirstNode: ListNode? = nil
        var pre: ListNode? = nil
        for i in 0..<stack.count {
            let node = ListNode(stack[i])
            if i == 0 {
                originalFirstNode = node
            }

            let newIndex = (i + k) % stack.count
            if newIndex == 0 {
                root = node
            }

            if pre != nil && newIndex != 0 {
                // break circular link list again
                pre?.next = node
            }

            let lastIndex = stack.count - 1
            if i == lastIndex {
                // make a circular link list
                node.next = originalFirstNode
            }
            
            if newIndex == lastIndex {
                // break circular link list
                node.next = nil
            }

            pre = node
        }
        return root
    }
}

// Notes.
// 1, 2, 3, 4, 5
// 5, 1, 2, 3, 4; k = 1
// 4, 5, 1, 2, 3; k = 2

let sol = Solution()
let linklist = LinkList()

var head = linklist.build([1,2,3,4,5])
var result = sol.rotateRight(head, 2)
print(linklist.convertToArray(result))

head = linklist.build([1])
result = sol.rotateRight(head, 2)
print(linklist.convertToArray(result))

head = linklist.build([1,2])
result = sol.rotateRight(head, 0)
print(linklist.convertToArray(result))
