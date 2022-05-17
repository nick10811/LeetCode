import Foundation

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        for i in 0..<s.count {
            var chArr = Array(s)
            for j in 0..<s.count {
                let origin = Array(s)
                chArr[(j+i)%s.count] = origin[j]
            }
//            print(String(chArr))
            if String(chArr) == goal {
                return true
            }
        }
        return false
    }
}

let sol = Solution()
print(sol.rotateString("abcde", "bcdea"))
print(sol.rotateString("abcde", "abced"))
