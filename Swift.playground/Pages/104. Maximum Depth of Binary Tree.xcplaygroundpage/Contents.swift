import Foundation

class Solution {
    // not working on LeetCode
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else { return 0 }
//
//        var stack = [TreeNode]()
//        var count = 0
//        stack.append(root)
//        while stack.count > 0 {
//            let node = stack.first
//            stack.remove(at: 0)
//            count += 1
//            if let left = node?.left {
//                stack.append(left)
//            } else if let right = node?.right {
//                stack.append(right)
//            }
//
//        }
//        return count
//    }
    
    // recursive
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)
        return max(left, right) + 1
    }
    
}

let tree = Tree()
let sol = Solution()
print(sol.maxDepth(tree.build([1,2,3,nil,4])))
print(sol.maxDepth(tree.build([3,9,20,nil,nil,15,7])))
print(sol.maxDepth(tree.build([1,nil,2])))
