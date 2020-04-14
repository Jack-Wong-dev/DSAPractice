func increasingBST(_ root: TreeNode?) -> TreeNode? {
    var output: TreeNode?
    var prev: TreeNode?
    
    inOrderTraverse(node: root, output: &output, prev: &prev)
    return output
}

func inOrderTraverse(node: TreeNode?, output: inout TreeNode?, prev: inout TreeNode?) {
    if node == nil {
        return
    }
    
    if let node = node {
        inOrderTraverse(node: node.left, output: &output, prev: &prev)
        if let _ = output {
            prev?.right = node
        } else {
            output = node
        }
        prev = node
        node.left = nil
        inOrderTraverse(node: node.right, output: &output, prev: &prev)
    }
}
