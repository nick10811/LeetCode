import Foundation

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return root == nil || isMirror(left: root?.left, right: root?.right)
    }
    
    func isMirror(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        } else if left == nil || right == nil {
            return false
        } else {
            return left?.val == right?.val && isMirror(left: left?.left, right: right?.right) && isMirror(left: left?.right, right: right?.left)
        }
    }
}

let tree = Tree()
let sol = Solution()
print(sol.isSymmetric(tree.build([1,2,2,3,4,4,3])))
print(sol.isSymmetric(tree.build([1,2,2,nil,3,nil,3])))
print(sol.isSymmetric(tree.build([2,3,3,4,5,nil,4])))
