import Foundation

//class Solution {
//    // HINT: Time Limit Exceeded
//    var stack = [TreeNode]()
//
//    func increasingBST(_ root: TreeNode?) -> TreeNode? {
//        self.inorderTraversal(root)
//        if stack.count < 2 {
//            return stack.first
//        }
//        for i in 1..<stack.count {
//            let pre = stack[i-1]
//            pre.left = nil
//            pre.right = stack[i]
//        }
//        return stack.first
//    }
//
//    func inorderTraversal(_ root: TreeNode?) {
//        guard let root = root else { return }
//
//        inorderTraversal(root.left)
//        stack.append(root)
//        inorderTraversal(root.right)
//    }
//}

class Solution {
    var stack = [Int]() // store integer and create a new TreeNode in the loop
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        inorderTraversal(root)
        guard let first = stack.first else { return nil }
        let root = TreeNode(first)
        if stack.count < 2 {
            return root
        }
        
        var pre = root
        for i in 1..<stack.count {
            let node = TreeNode(stack[i])
            pre.right = node
            pre = node
        }
        return root
    }
    
    func inorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        
        inorderTraversal(root.left)
        stack.append(root.val)
        inorderTraversal(root.right)
    }
}

// Notes.
// step1. inorder traversal
// step2. stack
// step3. iterating in stack

let sol = Solution()
var tree = Tree()

var root = tree.build([5,3,6,2,4,nil,8,1,nil,nil,nil,7,9])
var result = sol.increasingBST(root)
tree.traversal(result, type: .preorder)
print("----------")

root = tree.build([5,1,7])
result = sol.increasingBST(root)
tree.traversal(result, type: .preorder)
print("----------")

root = tree.build([2,1,4,nil,nil,3])
result = sol.increasingBST(root)
tree.traversal(result, type: .preorder)
print("----------")
