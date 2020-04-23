func validate(data: [[Int]]) -> String {
    
    var map = [Int:(Set<Int>,Set<Int>,Set<Int>)]()
    
    for input in data {
        
        let row = input[0]
        let col = input[1]
        let value = input[2]
        let group = determineGroup(row: row, col: col)
        
        if var (rowSet,colSet,groupSet) = map[value] {
            if rowSet.contains(row) || colSet.contains(col) || groupSet.contains(group){
                return "WRONG INPUT"
            }else{
                rowSet.insert(row)
                colSet.insert(col)
                groupSet.insert(group)
                map[value] = (rowSet,colSet,groupSet)
            }
        }else{
            let rowSet: Set<Int> = [row]
            let colSet: Set<Int> = [col]
            let groupSet: Set<Int> = [group]
            map[value] = (rowSet,colSet,groupSet)
        }
    }
    return "OK"
}

func determineGroup(row:Int, col:Int) -> Int {

    switch (row,col) {
    case (1...3,1...3):
        return 1
    case (1...3,4...6):
        return 2
    case (1...3,7...9):
        return 3
    case (4...6,1...3):
        return 4
    case (4...6,4...6):
        return 5
    case (4...6,7...9):
        return 6
    case (7...9,1...3):
        return 7
    case (7...9,4...6):
        return 8
    case (7...9,7...9):
        return 9
    default:
        return 0
    }
}

var arr1 = [[3,1,3],[2,8,3,],[1,4,3],[7,2,3],[6,3,3,],[5,5,3],[4,7,3],[8,6,3],[9,9,3]]
var input = [[2,2,5],[2,5,1],[5,2,3],[2,8,5]]

validate(data: arr1)  //"OK"
validate(data: input) //"WRONG INPUT"
