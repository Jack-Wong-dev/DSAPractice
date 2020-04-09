func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let beforeHead: ListNode? = ListNode(0)
    var before: ListNode? = beforeHead
    let afterHead: ListNode? = ListNode(0)
    var after: ListNode? = afterHead
    var head = head
    
    while head != nil {
        if head!.val < x {
            before?.next = head
            before = before?.next
        }else{
            after?.next = head
            after = after?.next
        }
        head = head?.next
    }
    after?.next = nil
    before?.next = afterHead?.next
    
    return beforeHead?.next
}
