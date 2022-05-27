import Foundation

class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        var steps = 0
        var tmp1 = num1
        var tmp2 = num2
        while tmp1 > 0 && tmp2 > 0 {
            steps += 1
            if tmp1 >= tmp2 {
                tmp1 -= tmp2
            } else {
                tmp2 -= tmp1
            }
        }
        return steps
    }
}

let sol = Solution()
print(sol.countOperations(2, 3))
print(sol.countOperations(10, 10))
