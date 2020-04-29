//Using Dynamic Programming
func countSubstrings(_ s: String) -> Int {
    
    let length = s.count
    guard s.count > 0 else {
        return 0
    }
    var counter = 0
    let arr = Array(s)
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: arr.count), count: arr.count)
    
    for i in (0..<length).reversed() {
        for j in (i..<length).reversed() {
            if i == j {
                dp[i][j] = true
                counter += 1
            } else if j == i + 1 && arr[i] == arr[j] {
                dp[i][j] = true
                counter += 1
            } else if dp[i+1][j-1] && arr[i] == arr[j] {
                dp[i][j] = true
                counter += 1
            }
        }
    }
    
    return counter
}
