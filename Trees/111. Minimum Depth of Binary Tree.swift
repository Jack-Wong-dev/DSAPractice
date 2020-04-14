//Recursive Approach

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else{
        return 0
    }
    let depL = minDepth(root.left)
    let depR = minDepth(root.right)
    return 1 + ((depL==0 || depR==0) ? max(depL, depR) : min(depL, depR))
}


