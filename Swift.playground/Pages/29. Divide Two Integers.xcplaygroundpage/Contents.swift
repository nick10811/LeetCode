import Foundation

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let max: Int = Int(pow(Double(2), Double(31))) - 1
        let min: Int = Int(pow(Double(-2), Double(31)))
        if dividend > max {
            return max
        } else if dividend < min {
            return min
        }
        // positive (10, 3)
        // 10 - 3 = 7
        //  7 - 3 = 4
        //  4 - 3 = 1
        // negative (7, -3)
        //  7 - 3 = 4
        //  4 - 3 = 1
        let positiveSign: Bool = (dividend >= 0 && divisor >= 0) || (dividend < 0 && divisor < 0)
        var count = 0
        var num = abs(dividend)
        while num - abs(divisor) >= 0 {
            num -= abs(divisor)
            count += 1
        }
        return positiveSign ? count : -count
    }
}

let sol = Solution()
print(sol.divide(10, 3)) // 3
print(sol.divide(7, -3)) // -2
print(sol.divide(1, 1)) // 1
print(sol.divide(-1, 1)) // -1
print(sol.divide(-2147483648, -1)) // 2147483647
