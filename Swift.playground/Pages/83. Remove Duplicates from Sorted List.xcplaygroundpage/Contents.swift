import Foundation

class Solution {
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        var stack = Set<Int>()
//        var current = head
//        var pre: ListNode? = nil
//        while current != nil {
//            if stack.contains(where: { $0 == current?.val }) {
//                pre?.next = current?.next
//            } else {
//                pre = current
//            }
//            stack.insert(current?.val ?? 0)
//            current = current?.next
//        }
//        return head
//    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // condition: a sorted linked list
        if head == nil || head?.next == nil {
            return head
        }

        let nextHead = deleteDuplicates(head?.next)
        if head?.val == nextHead?.val {
            return nextHead
        } else {
            head?.next = nextHead
            return head
        }
    }
}

let sol = Solution()
let linklist = LinkList()

var root = linklist.build([1,1,2])
var result = sol.deleteDuplicates(root)
print(linklist.convertToArray(result))

root = linklist.build([1,1,2,3,3])
result = sol.deleteDuplicates(root)
print(linklist.convertToArray(result))

root = linklist.build([1,1,1])
result = sol.deleteDuplicates(root)
print(linklist.convertToArray(result))

root = linklist.build([1,2,2,2])
result = sol.deleteDuplicates(root)
print(linklist.convertToArray(result))
