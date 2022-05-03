import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        var temp = x
        var reversed = 0
        while temp != 0 {
            reversed = temp % 10 + reversed * 10
            temp /= 10
        }
        return x == reversed
    }
}

let sol = Solution()
print(sol.isPalindrome(121))
print(sol.isPalindrome(123))
print(sol.isPalindrome(-121))
print(sol.isPalindrome(10))
