import Foundation

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftCount = minDepth(root?.left)
        let rightCount = minDepth(root?.right)
        if root?.left == nil {
            return rightCount + 1
        } else if root?.right == nil {
            return leftCount  + 1
        } else {
            return min(leftCount, rightCount) + 1
        }
    }
}

let sol = Solution()
let tree = Tree()
var root = tree.build([3,9,20,nil,nil,15,7])
print(sol.minDepth(root))

root = tree.build([3])
print(sol.minDepth(root))

root = tree.build([2,nil,3,nil,4,nil,5,nil,6])
print(sol.minDepth(root))
