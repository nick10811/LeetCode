import Foundation

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode? ) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Tree {
    
    public enum TreeType {
        case binary, general
    }
    
    public enum Traversal {
        case inorder, preorder, postorder
    }
    
    public init() { }
    
    public func build(_ array: [Int?], type: TreeType = .binary) -> TreeNode? {
        return buildBinaryTree(array)
    }
    
    /*
     *             1
     *           2  3
     *         4  0 6  7
     */
    private func buildBinaryTree(_ array: [Int?], offset: Int = 0) -> TreeNode? {
        guard array.count > 0 else { return nil }
        guard offset < array.count else { return nil }
        
        let node = TreeNode(array[offset] ?? 0)
        node.left = buildBinaryTree(array, offset: 2*offset+1)
        node.right = buildBinaryTree(array, offset: 2*offset+2)
        return node
    }
    
    public func traversal(_ root: TreeNode?, type: Traversal = .preorder) {
        switch type {
        case .preorder : preorderTraversal(root)
        case .inorder  : inorderTraversal(root)
        case .postorder: postorderTraversal(root)
        }
    }
    
    private func preorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        
        print(root.val)
        preorderTraversal(root.left)
        preorderTraversal(root.right)
    }
    
    private func inorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }

        inorderTraversal(root.left)
        print(root.val)
        inorderTraversal(root.right)
    }

    private func postorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }

        postorderTraversal(root.left)
        postorderTraversal(root.right)
        print(root.val)
    }
}
