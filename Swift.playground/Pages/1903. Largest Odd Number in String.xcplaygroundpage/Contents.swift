import Foundation

class Solution {
    func largestOddNumber(_ num: String) -> String {
        
        var max: Int = -1
        for i in 0..<num.count {
            let subString = num.prefix(num.count-i)
            let subNum: Int = Int(subString) ?? 0
            if isOdd(subNum) {
                if subNum > max {
                    max = subNum
                }
            }
        }
        return max == -1 ? "" : String(max)
    }
    
    func isOdd(_ num: Int) -> Bool {
        return num % 2 != 0
    }
}


// A substring is a contiguous sequence of characters within a string.

// Notes.
// ABCDE
// prefix(2) AB
// subfix(2) DE

let sol = Solution()
// The only non-empty substrings are "5", "2", and "52". "5" is the only odd number.
print(sol.largestOddNumber("52")) // "5"
print(sol.largestOddNumber("4206")) // ""
print(sol.largestOddNumber("35427")) // "35427"

// Failed
print(sol.largestOddNumber("239537672423884969653287101")) // "239537672423884969653287101"
