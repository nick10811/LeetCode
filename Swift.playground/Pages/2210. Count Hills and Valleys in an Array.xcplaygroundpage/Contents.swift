import Foundation

class Solution {
    func countHillValley(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        
        var count = 0
        var leftClosest = nums[0]
        for i in 1..<nums.count-1 {
            if nums[i] > leftClosest && nums[i] > nums[i+1] {
                // hill
                count += 1
            } else if nums[i] < leftClosest && nums[i] < nums[i+1] {
                // valley
                count += 1
            }
            
            if nums[i] != nums[i+1] {
                leftClosest = nums[i]
            }
        }
        return count
    }
}

let sol = Solution()
print(sol.countHillValley([2,4,1,1,6,5]))
print(sol.countHillValley([6,6,5,5,4,1]))
print(sol.countHillValley([1,6,6,6,5,1]))
print(sol.countHillValley([6,1,1,1,5,1]))
