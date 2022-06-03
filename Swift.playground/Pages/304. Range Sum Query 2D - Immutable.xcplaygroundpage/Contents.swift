import Foundation

class NumMatrix {
    private var sumMatrix = [[Int]]()
    private var originMatrix = [[Int]]()

    // Time Limit Exceeded
//    init(_ matrix: [[Int]]) {
//        self.matrix = matrix
//    }
//
//    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
//        var sum = 0
//        for i in row1...row2 {
//            for j in col1...col2 {
//                sum += matrix[i][j]
//            }
//        }
//        return sum
//    }

    init(_ matrix: [[Int]]) {
        self.originMatrix = matrix
        guard matrix.count > 0 else { return }
        let rowCount = matrix.count
        let columnCount = matrix[0].count

        self.sumMatrix = Array(repeating: Array(repeating: 0, count: columnCount), count: rowCount)

        // sum of each row
        for i in 0..<rowCount {
            for j in 0..<columnCount {
                if j-1 < 0 {
                    // column 0
                    self.sumMatrix[i][j] = matrix[i][j]
                } else {
                    self.sumMatrix[i][j] = matrix[i][j] + self.sumMatrix[i][j-1]
                }
//                print("(\(i), \(j)):\(self.sumMatrix[i][j])")
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        //[origin] 3, 0, 1, 4, 2
        //
        //[sum]    3, 3, 4, 8, 10
        //////////
        //[origin] 1, 2, 0, 1, 5
        //
        //[sum]    1, 3, 3, 4, 9

        var sum = 0
        for i in row1...row2 {
            sum += sumMatrix[i][col2] - sumMatrix[i][col1] + originMatrix[i][col1]
        }
        return sum
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */

let matrix = [[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]
let obj = NumMatrix(matrix)
print(obj.sumRegion(2, 1, 2, 3)) // 3
print(obj.sumRegion(2, 1, 4, 3)) // 8
print(obj.sumRegion(1, 1, 2, 2)) // 11
print(obj.sumRegion(1, 2, 2, 4)) // 12
