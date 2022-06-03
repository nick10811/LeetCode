import Foundation

class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        
        var transpose: [[Int]] = Array(repeating: Array(repeating: 0, count: rowCount), count: columnCount)
        for i in 0..<columnCount {
            for j in 0..<rowCount {
//                print("i:\(i), j:\(j)")
                transpose[i][j] = matrix[j][i]
            }
        }
        return transpose
        return [[]]
    }
}

// 1, 2, 3
// 4, 5, 6
// 7, 8, 9

// 1, 4, 7
// 2, 5, 8
// 3, 6, 9

//////////

// 1, 2, 3
// 4, 5, 6

// 1, 4
// 2, 5
// 3, 6

//////////

// 1, 2, 3
// 1
// 2
// 3

let sol = Solution()
//let matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
//print(sol.transpose(matrix1))
let matrix2 = [[1,2,3],[4,5,6]]
print(sol.transpose(matrix2))
//let matrix3 = [[1,2,3]]
//print(sol.transpose(matrix3))
