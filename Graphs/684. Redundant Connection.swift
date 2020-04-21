//Readable Solution

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var sets = Array(repeating: 0, count: edges.count + 1)
    
    for i in 1...(edges.count) {
        sets[i] = i  //index is used as vertex (source), it stores the destination vertex as a value
    }
    
    for edge in edges {
        //find
        let u : Int = find(sets: sets, vertex: edge[0])
        let v : Int = find(sets: sets, vertex: edge[1])

        if (u == v) { return edge }
        sets[u] = v  //Union
    }
    return [Int]()
}

func find(sets: [Int], vertex: Int) -> Int {
    //base case
    if sets[vertex] == vertex { return vertex }
    
    //recursive case
    return find(sets: sets, vertex: sets[vertex])
}

var inputL: [[Int]] = [[1,2],[1,3],[2,3]]

findRedundantConnection(inputL)


//Neater approach of the above solution

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    
    var sets: [Int] = Array(repeating: 0, count: edges.count + 1)
    
    for edge in edges {
        let u : Int = find(sets: sets, v: edge[0])
        let v : Int = find(sets: sets, v: edge[1])
        
        if (u == v) {
            return edge
        }
        sets[u] = v
    }
    
    return [Int]()
}

func find(sets: [Int], v: Int) -> Int {
    return sets[v] == 0 ? v : find(sets: sets, v: sets[v])
}

