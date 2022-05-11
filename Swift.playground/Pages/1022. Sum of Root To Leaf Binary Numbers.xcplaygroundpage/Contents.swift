import Foundation

class Solution {
    var sum = 0
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var stack = [Int]()
        preoderTraversal(root, stack: &stack)
        return sum
    }
    
    func preoderTraversal(_ root: TreeNode?, stack: inout [Int]) {
        guard let root = root else { return }
        
        stack.append(root.val)
        if root.left == nil && root.right == nil {
            sum += calculate(stack: &stack)
            stack.popLast()
            return
        }

        preoderTraversal(root.left, stack: &stack)
        preoderTraversal(root.right, stack: &stack)
        stack.popLast()
    }
    
    func calculate(stack: inout [Int]) -> Int {
        var sum = 0
        var i = 0
        for j in (0..<stack.count).reversed() {
            let num = stack[j]
            sum += Int(pow(Double(2), Double(i))) * num
            i += 1
        }
//        print("\(stack), sum: \(sum)")
        return sum
    }
}

// Notes
// step1. preorder traversal (Depth-First Search, DFS)
// step2. stack

let sol = Solution()
let tree = Tree()

//Input: root = [1,0,1,0,1,0,1]
//Output: 22
//Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
var root = tree.build([1,0,1,0,1,0,1], skipNil: false)
print(sol.sumRootToLeaf(root))
