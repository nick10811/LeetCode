import Foundation

class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        // step1. loxicographically
        let sorted = products.sorted()
//        print(sorted)
        
        var searchResult = Array(repeating: [String](), count: searchWord.count)
        // step2. searching by first word, first two words, first three words.
        for i in 1...searchWord.count {
            let prefixWord = searchWord.prefix(i)
//            print(prefixWord)
            
            var result = [String]()
            
            // search word
            for j in 0..<sorted.count {
                let found = sorted[j].prefix(i)
                if found == prefixWord {
                    result.append(sorted[j])
                }
                
                if result.count == 3 {
                    break
                }
            }
            
            searchResult[i-1] = result
        }
        return searchResult
        
    }
}

let sol = Solution()
print(sol.suggestedProducts(["mobile","mouse","moneypot","monitor","mousepad"], "mouse"))
