import Foundation

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var result = num
        var step = 0
        while result > 0 {
            step += 1
            if result%2 == 0 {
                // even
                result /= 2
            } else {
                // odd
                result -= 1
            }
        }
        return step
    }
}

// READ AROUND: Collatz conjecture
// https://en.wikipedia.org/wiki/Collatz_conjecture

let sol = Solution()
print(sol.numberOfSteps(14))
print(sol.numberOfSteps(8))
