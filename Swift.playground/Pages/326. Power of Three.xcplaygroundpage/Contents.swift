import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var i = 1
        while i<n {
            i *= 3
        }
        return i == n
    }
}

let sol = Solution()
print(sol.isPowerOfThree(27))
print(sol.isPowerOfThree(0))
print(sol.isPowerOfThree(-1))
