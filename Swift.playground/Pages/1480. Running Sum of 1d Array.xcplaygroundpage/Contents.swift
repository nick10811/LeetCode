import Foundation

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var stack: [Int] = []
        nums.forEach {
            if let last = stack.last {
                stack.append($0+last)
            } else {
                stack.append($0)
            }
        }
        return stack
    }
}

let sol = Solution()
print(sol.runningSum([1,2,3,4]))
print(sol.runningSum([1,1,1,1,1]))
print(sol.runningSum([3,1,2,10,1]))
