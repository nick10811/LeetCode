import Foundation
import CoreGraphics

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count >= k else { return false }
            
        var stringSet: Set<String> = [] // Set: make sure every elements are unique
        for i in 0...s.count-k {
            let start = s.index(s.startIndex, offsetBy: i)
            let end = s.index(start, offsetBy: k)
            let subString = s[start..<end]
            stringSet.insert(String(subString))
        }
        
        return stringSet.count == Int(pow(Double(2), Double(k)))
    }
}

// Notes.
// Input: s = "00110110", k = 2
// Output: true
// Explanation: The binary codes of length 2 are "00", "01", "10" and "11". They can be all found as substrings at indices 0, 1, 3 and 2 respectively.
// count is 2^k: 0 -> 00, 1 -> 01, 2 -> 10, 3 -> 11

let sol = Solution()
print(sol.hasAllCodes("00110110", 2)) // true
print(sol.hasAllCodes("0110", 1)) // true
print(sol.hasAllCodes("0110", 2)) // false
