const findClockAngle = (hour, minute) => {
  const hourAngle = (360 * hour) / 12;
  const minuteAngle = (360 * minute) / 60;

  const result = Math.abs(hourAngle - minuteAngle);
  return Math.min(360 - result, result);
};

console.log(findClockAngle(12, 45)); //12:45 -> 90 degrees
console.log(findClockAngle(9, 30)); //9:30 -> 90 degrees
console.log(findClockAngle(12, 30)); //12:30 -> 180 degrees
console.log(findClockAngle(12, 15)); //12:15 -> 90 degrees
console.log(findClockAngle(1, 18)); //1:18 -> 78 degrees
