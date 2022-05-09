import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var reversedHead: ListNode? = nil
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = reversedHead // step2
            reversedHead = current // step3
            current = next // step1
        }
        return reversedHead
    }
}

let sol = Solution()
let linkList = LinkList()
var root = linkList.build([1,2,3,4,5])
let reversed = sol.reverseList(root)
print(linkList.convertToArray(reversed))

// Notes.
// step1. traversal all node by current (one loop)
// step2. change point of current to reversedHead
// step3. assign current to reversedHead
