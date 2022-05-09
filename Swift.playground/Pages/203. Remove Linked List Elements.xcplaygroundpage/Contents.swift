import Foundation

class Solution {
//    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//        // step1. find new root (avoid the first is removable)
//        var root = head
//        var current = root
//        while current != nil {
//            if current?.val == val {
//                current = current?.next
//            } else {
//                break
//            }
//        }
//        root = current
//
//        // step2. remove rest item that needs to remove
//        var round2 = root
//        while round2?.next != nil {
//            let next = round2?.next
//            if next?.val == val {
//                round2?.next = next?.next
//                continue
//            }
//            round2 = next
//        }
//        return root
//    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var root = head
        var pre: ListNode? = nil
        var current = root
        while current != nil {
            if current?.val == val {
                if pre == nil {
                    root = current?.next
                } else {
                    pre?.next = current?.next
                }
            } else {
                // non-removed
                pre = current
            }
            current = current?.next
        }
        return root
    }
}

let sol = Solution()
let linkList = LinkList()
var root = linkList.build([1,2,6,3,4,5,6])
var result = sol.removeElements(root, 6)
print(linkList.convertToArray(result))

root = linkList.build([6,2,6,3,4,5,6])
result = sol.removeElements(root, 6)
print(linkList.convertToArray(result))

root = linkList.build([1,2,2,1])
result = sol.removeElements(root, 2)
print(linkList.convertToArray(result))
