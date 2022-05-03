import Foundation

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        var max = 0
        for i in 0..<sorted.count {
            if i % 2 == 0 {
                max += sorted[i]
            }
        }
        return max
    }
}

let sol = Solution()
print(sol.arrayPairSum([1,4,3,2]))
print(sol.arrayPairSum([6,2,6,5,1,2]))
