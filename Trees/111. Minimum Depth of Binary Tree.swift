//Recursive Approach

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else{
        return 0
    }
    let leftDepth = minDepth(root.left)
    let rightDepth = minDepth(root.right)
    return 1 + ((leftDepth==0 || rightDepth==0) ? max(leftDepth, rightDepth) : min(leftDepth, rightDepth))
}


