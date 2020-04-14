//Approach 1
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    let right = invertTree(root.right)
    let left = invertTree(root.left)
    root.left = right
    root.right = left
    return root
}

//Approach 2, only 1 temp
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else{ return nil }
    let left = root.left
    root.left = invertTree(root.right)
    root.right = invertTree(left)
    return root
}

