func detectCycle(_ head: ListNode?) -> ListNode? {
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if fast === slow {
            fast = head
            while !(slow === fast){
                slow = slow?.next
                fast = fast?.next
            }
            return fast
        }
    }
    return nil
}
