func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    depthFirstSearch(graph, 0, [0], &result)
    return result
}

private func depthFirstSearch(_ graph: [[Int]],
                 _ index: Int,
                 _ path: [Int],
                 _ result: inout [[Int]]) {
    if index == graph.count - 1 {
        result.append(path)
        return
    }
    
    for node in graph[index] {
        var path = path
        path.append(node)
        depthFirstSearch(graph, node, path, &result)
    }
}

var input = [[1,2], [3], [3], []]

allPathsSourceTarget(input)
