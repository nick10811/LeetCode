import Foundation

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let root: ListNode? = ListNode()
        var current = root
        var currentL1 = list1
        var currentL2 = list2
        
        while currentL1 != nil && currentL2 != nil {
            let value1 = currentL1?.val ?? 0
            let value2 = currentL2?.val ?? 0
            if value1 < value2 {
                current?.next = currentL1
                current = current?.next
                currentL1 = currentL1?.next
            } else {
                current?.next = currentL2
                current = current?.next
                currentL2 = currentL2?.next
            }
        }
        
        if currentL1 == nil {
            current?.next = currentL2
        } else if currentL2 == nil {
            current?.next = currentL1
        }
        
        return root?.next
    }
}

let sol = Solution()
let linkList = LinkList()

// case 1
var list1 = linkList.build([1,2,4])
var list2 = linkList.build([1,3,4])
var result = sol.mergeTwoLists(list1, list2)
print(linkList.convertToArray(result))

// case 2
list1 = linkList.build([])
list2 = linkList.build([])
result = sol.mergeTwoLists(list1, list2)
print(linkList.convertToArray(result))

// case 3
list1 = linkList.build([])
list2 = linkList.build([0])
result = sol.mergeTwoLists(list1, list2)
print(linkList.convertToArray(result))
