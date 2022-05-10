import Foundation

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var stack = [ListNode]()
        var current = head
        while current != nil {
            // HINT: triple equal sign -> compare the memory address
            if stack.contains(where: { $0 === current }) {
                return true
            }
            stack.append(current!)
            current = current?.next
        }
        return false
    }
}

let sol = Solution()
let linklist = LinkList()

var root = linklist.buildCycle([3,2,0,-4], pos: 1)
print(sol.hasCycle(root))

root = linklist.buildCycle([1,2], pos: 0)
print(sol.hasCycle(root))

root = linklist.buildCycle([1], pos: -1)
print(sol.hasCycle(root))

root = linklist.buildCycle([-21,10,17,8,4,26,5,35,33,-7,-16,27,-12,6,29,-12,5,9,20,14,14,2,13,-24,21,23,-21,5], pos: -1)
print(sol.hasCycle(root))
