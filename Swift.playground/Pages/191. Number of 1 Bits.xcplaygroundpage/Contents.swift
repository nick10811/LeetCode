import Foundation

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var num = n
        while num > 0 {
            if num&1 == 1 {
                count += 1
            }
            num >>= 1
        }
        return count
    }
}

let sol = Solution()
print(sol.hammingWeight(1011))
print(sol.hammingWeight(00000000000000000000000000001011))
print(sol.hammingWeight(00000000000000000000000010000000))
print(sol.hammingWeight(11111111111111111111111111111101))
