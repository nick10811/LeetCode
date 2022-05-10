import Foundation

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return BST(nums, start: 0, end: nums.count - 1)
    }
    
    // start index, end index
    func BST(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        
        let mid = (start + end) / 2 // find root
        let root = TreeNode(nums[mid])
        root.left = BST(nums, start: start, end: mid - 1)
        root.right = BST(nums, start: mid + 1, end: end)
        return root
    }
}

let tree = Tree()
let sol = Solution()
var root = sol.sortedArrayToBST([1,2,3])
print(tree.traversal(root, type: .preorder))

root = sol.sortedArrayToBST([-10,-3,0,5,9])
print(tree.traversal(root, type: .preorder))

root = sol.sortedArrayToBST([1,3])
print(tree.traversal(root, type: .preorder))
