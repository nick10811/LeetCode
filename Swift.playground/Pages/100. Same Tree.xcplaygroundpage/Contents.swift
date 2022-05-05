import Foundation

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false
    }
}

let tree = Tree()
let sol = Solution()
print(sol.isSameTree(tree.build([1,2,3]), tree.build([1,2,3])))
print(sol.isSameTree(tree.build([1,2]), tree.build([1,nil,2])))
print(sol.isSameTree(tree.build([1,2,1]), tree.build([1,1,2])))
