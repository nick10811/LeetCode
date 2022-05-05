import Foundation

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [Int]()
        traversal(root, stack: &stack)
        return stack
    }
    
    func traversal(_ root: TreeNode?, stack: inout [Int]) {
        guard let root = root else { return }
        traversal(root.left, stack: &stack)
        stack.append(root.val)
        traversal(root.right, stack: &stack)
    }
}

let tree = Tree()
let sol = Solution()
print(sol.inorderTraversal(tree.build([1,nil,2,3])))
print(sol.inorderTraversal(tree.build([])))
print(sol.inorderTraversal(tree.build([1])))
