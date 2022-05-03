import Foundation

class Solution {
    func canBeIncreasing(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            var temp = nums
            temp.remove(at: i)
            if isSorted(temp) {
                return true
            }
            
        }
        return false
    }
    
    func isSorted(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        for i in 1..<nums.count {
            if nums[i] <= nums[i-1] {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.canBeIncreasing([1,2,10,5,7]))
print(sol.canBeIncreasing([2,3,1,2]))
print(sol.canBeIncreasing([1,1]))
print(sol.canBeIncreasing([1,1,1]))
