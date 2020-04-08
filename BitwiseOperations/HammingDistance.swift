func hammingDistance(x: Int,y: Int)->Int {
    
    var count = 0
    var z = x^y
    while(z != 0){
        count += (z&1)
        z = z>>1
    }
    return count;
}

hammingDistance(x: 1, y: 4) // 2
