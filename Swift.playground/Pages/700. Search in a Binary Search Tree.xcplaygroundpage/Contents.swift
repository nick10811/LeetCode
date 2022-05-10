import Foundation

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > val {
            return searchBST(root.left, val)
        } else if root.val < val {
            return searchBST(root.right, val)
        }
        return root
    }
}

let sol = Solution()
let tree = Tree()

var root = tree.build([4,2,7,1,3])
var result = sol.searchBST(root, 2)
print(tree.traversal(result, type: .preorder))
