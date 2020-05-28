func findClockAngle(_ h: Int, _ m: Int) -> Int {
  let hAngle = (360 * h) / 12 //0.5 degree
  let mAngle = (360 * m) / 60  //6 degree

  let result = abs(mAngle - hAngle)
  
  // Result for angle starting at hour to min arms
  // return result
  // Result for smallest angle between arms
  return min(360 - result , result)
}

print(findClockAngle(12,45)) //12:45 -> 90 degrees
print(findClockAngle(9,30)) //9:30 -> 90 degrees
print(findClockAngle(12,30)) //12:30 -> 180 degrees
print(findClockAngle(12,15)) //12:15 -> 90 degrees
print(findClockAngle(1,18)) //1:18 -> 78 degrees


