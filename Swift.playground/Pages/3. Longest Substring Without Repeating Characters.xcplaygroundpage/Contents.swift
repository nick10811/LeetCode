import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let charArray = Array(s)
        var stack = [Character]()
        var max = 0
        
        charArray.forEach { ch in
            if let index = stack.firstIndex(of: ch) {
                stack.removeSubrange(0...index)
                stack.append(ch)
                
            } else {
                stack.append(ch)
            }
            
            if stack.count > max {
                max = stack.count
            }
//            print("ch:\(ch), stack:\(stack)")
        }
        
        if max == 0 && stack.count > 0 {
            max  = stack.count
        }
        
        return max
    }
}

let sol = Solution()
print(sol.lengthOfLongestSubstring("aab")) // 2
print(sol.lengthOfLongestSubstring("aabbccd")) // 2
print(sol.lengthOfLongestSubstring("pwwkew")) // 3
print(sol.lengthOfLongestSubstring("dvdf")) // 3
print(sol.lengthOfLongestSubstring("abcdb")) // 3
