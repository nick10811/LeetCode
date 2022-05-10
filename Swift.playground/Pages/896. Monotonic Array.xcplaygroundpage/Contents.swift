import Foundation

class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var isIncreasing: Bool? = nil
        var preNum = 0
        
        for i in 0..<nums.count {
            let num = nums[i]
            
            if i == 0 {
                preNum = num
                continue
            }
            
            if let isIncreasing = isIncreasing {
                if isIncreasing {
                    if num < preNum {
                        return false
                    }
                } else {
                    if num > preNum {
                        return false
                    }
                }
            } else if i > 0 {
                switch num {
                case _ where num > preNum: isIncreasing = true
                case _ where num < preNum: isIncreasing = false
                default: isIncreasing = nil
                }
            }
            
            preNum = num
        }
        
        return true
    }
}

let sol = Solution()
print(sol.isMonotonic([1,2,2,3])) // ascending
print(sol.isMonotonic([6,5,4,4])) // descending
print(sol.isMonotonic([1,3,2]))
print(sol.isMonotonic([1,1,2])) // ascending
print(sol.isMonotonic([2,2,1])) // descending
