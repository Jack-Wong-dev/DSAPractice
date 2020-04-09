func hasCycle(_ head: ListNode?) -> Bool {
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if fast === slow {
            return true
        }
    }
    return false
}
