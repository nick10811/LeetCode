import Foundation

class Solution {
    func findWords(_ words: [String]) -> [String] {
        let row1 = "qwertyuiop"
        let row2 = "asdfghjkl"
        let row3 = "zxcvbnm"
        
        var result = [String]()
        
        words.forEach {
            var count1 = 0
            var count2 = 0
            var count3 = 0
            
            let word = Array($0) // String -> char array
            for i in 0..<word.count {
                let ch = word[i]
                if row1.contains { $0 == ch } {
                    count1 += 1
                }
                
                if row2.contains { $0 == ch } {
                    count2 += 1
                }
                
                if row3.contains { $0 == ch } {
                    count3 += 1
                }
                
            }
            
            if (count1 == 0 && count2 == 0) ||
               (count1 == 0 && count3 == 0) ||
               (count2 == 0 && count3 == 0) {
                result.append($0)
            }
        }
        
        return result
    }
}

let sol = Solution()
print(sol.findWords(["Hello","Alaska","Dad","Peace"]))
print(sol.findWords(["omk"]))
print(sol.findWords(["adsdf","sfd"]))
print(sol.findWords([""]))
print(sol.findWords([]))
