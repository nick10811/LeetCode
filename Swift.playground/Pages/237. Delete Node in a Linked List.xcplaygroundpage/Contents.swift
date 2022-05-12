import Foundation

class Solution {
    func deleteNode(_ node: ListNode?) {
        // node: be deleting
        guard let next = node?.next else { return }
        
        // set next value as current
        node?.val = next.val
        node?.next = next.next
    }
}

// Write a function to delete a node in a singly-linked list.
// You will not be given access to the head of the list,
// instead you will be given access to the node to be deleted directly.
// [Constraint] This problem guaranteed that the node to be deleted is not a tail node in the list.

// Notes.
// set next pointer to next.next poniter
