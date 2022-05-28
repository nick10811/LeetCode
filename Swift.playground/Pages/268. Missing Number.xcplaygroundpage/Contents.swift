import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sorted = nums.sorted { $0 < $1 }
        for i in 0..<sorted.count {
            let num = sorted[i]
            if num != i {
                return i
            }
        }
        return sorted.count
    }
}

let sol = Solution()
print(sol.missingNumber([3,0,1]))
print(sol.missingNumber([0,1]))
