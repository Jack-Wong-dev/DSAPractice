import Foundation

class Heap<T: Comparable> {
    
    //MARK: - Properties
    private var arrayHeap = [T]()
    
    
    //MARK: - Fetch Indicies
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    //MARK: - Check if node exist
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < arrayHeap.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < arrayHeap.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    //MARK: - Getters
    private func leftChild(_ index: Int) -> T {
        return arrayHeap[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> T {
        return arrayHeap[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> T {
        return arrayHeap[getParentIndex(index)]
    }
    
    //MARK: - Operations
    private func swap(_ indexOne: Int,_ indexTwo: Int) {
        let placeholder = arrayHeap[indexOne]
        arrayHeap[indexOne] = arrayHeap[indexTwo]
        arrayHeap[indexTwo] = placeholder
    }
    
    public func peek() -> T {
        if arrayHeap.count != 0 {
            return arrayHeap[0]
        }else {
            fatalError()
        }
    }
    
    func heapifyUp(){
      var index = arrayHeap.count - 1
      while hasParent(index) && parent(index) > arrayHeap[index] {
        let parentIndex = getParentIndex(index)
        swap(parentIndex, index)
        index = parentIndex
      }
    }
    
    func heapifyDown(){
        var index = 0
        while index < arrayHeap.count {
            let leftChildIndex = getLeftChildIndex(index)
            let rightChildIndex = getRightChildIndex(index)
            if leftChild(leftChildIndex) < arrayHeap[index] {
                swap(leftChildIndex, index)
                index = leftChildIndex
            } else if rightChild(rightChildIndex) < arrayHeap[index] {
                swap(rightChildIndex, index)
                index = rightChildIndex
            }
            
        }
    }
    
    
    func isEmpty() -> Bool {
        return arrayHeap.isEmpty
    }
    
    //Extraction
    public func poll()->T{
        if arrayHeap.isEmpty {
            fatalError()
        } else{
            let item = arrayHeap[0]
            arrayHeap[0] = arrayHeap[arrayHeap.count - 1]
            heapifyDown()
            arrayHeap.removeLast()
            return item
        }
    }
    
    public func add(_ item: T) {
        arrayHeap.append(item)
        heapifyUp()
    }
}


//Another implementation
class Heap<T : Comparable>{
    
    //MARK:- Properties
    var heapArray : [T] = []
    
    var isEmpty : Bool{
        return heapArray.count == 0
    }
    
    //MARK: - Get Indicies
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    //MARK: - Operations
    private func heapifyUp(_ index: Int){
        if heapArray[index] < heapArray[getParentIndex(index)] {
            heapArray.swapAt( index,getParentIndex(index))
            let newindex = getParentIndex(index)
            heapifyUp(newindex)
        }
    }
    
    private func heapifyDown(_ index : Int){
        if getLeftChildIndex(index) < heapArray.count  && getRightChildIndex(index) < heapArray.count{
            let smaller = min(heapArray[getLeftChildIndex(index)], heapArray[getRightChildIndex(index)])
            let smallidx = heapArray.firstIndex(of: smaller)
            if heapArray[index] > smaller {
                heapArray.swapAt( index, smallidx!)
                heapifyDown(smallidx!)
            }
        }else if getLeftChildIndex(index) < heapArray.count {
            if heapArray[index] > heapArray[getLeftChildIndex(index)] {
                heapArray.swapAt( index, getLeftChildIndex(index))
                heapifyDown(getLeftChildIndex(index))
            }
        }
    }
    
    func extract() -> T?{
        if heapArray.isEmpty{
            return nil
        }
        else{
            heapArray.swapAt( 0, heapArray.count-1)
            let min = heapArray.removeLast()
            heapifyDown(0)
            return min
        }
    }
    
    
    func insert(element : T){
        heapArray.append(element)
        heapifyUp(heapArray.count-1)
    }
    
}

