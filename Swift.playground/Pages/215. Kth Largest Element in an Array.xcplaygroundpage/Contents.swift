import Foundation

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedSet = nums.sorted { $0 > $1 }
//        print(sortedSet)
        return sortedSet[k-1]
    }
}

let sol = Solution()
print(sol.findKthLargest([3,2,1,5,6,4], 2)) // 5
print(sol.findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4

