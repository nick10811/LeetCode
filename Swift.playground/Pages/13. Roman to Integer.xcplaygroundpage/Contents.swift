import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        // make a map table
        let romanMapTable = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        var sum = 0
        var preNum = 0
        s.reversed().map { c in
            let num = romanMapTable[c.uppercased()] ?? 0
            if preNum > num {
                sum -= num
            } else {
                sum += num
            }
            preNum = num
        }
        
        return sum
    }
}

let sol = Solution()
print(sol.romanToInt("III"))
print(sol.romanToInt("IV"))
print(sol.romanToInt("LVIII"))
print(sol.romanToInt("MCMXCIV"))
