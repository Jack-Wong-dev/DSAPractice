func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    
    guard headA != nil || headB != nil else {
        return nil
    }

    var nodeA: ListNode? = headA
    var nodeB: ListNode? = headB
    
    while nodeA !== nodeB {
        nodeA = nodeA == nil ? headB : nodeA?.next
        nodeB = nodeB == nil ? headA : nodeB?.next
    }
    
    return nodeA
}
