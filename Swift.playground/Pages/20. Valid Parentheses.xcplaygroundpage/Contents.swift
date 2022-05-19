import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        let dictionarys = ["(" : ")", "{" : "}", "[" : "]"]
        let charArray = Array(s)
        var stack = [String]()
        for i in 0..<charArray.count {
            let c = charArray[i]
            if let last = stack.popLast() {
                if let dic = dictionarys.first{ $0.key == last }, // find key
                   dic.value == String(c) { // check value
                       continue
                   } else {
                       stack.append(last)
                   }
            }
            stack.append(String(c))
        }
        return stack.count == 0
    }
}

// Notes.
// make a stack to store parenthese
// if matched, then popup

let sol = Solution()
print(sol.isValid("[]"))
print(sol.isValid("[]["))
print(sol.isValid("[][}"))
print(sol.isValid("()[]{}"))
print(sol.isValid(")[]{}"))
