// Time complexity: 𝑂(log n)
// Space complexity:
// Stability: -
// Recusion: No
// In-place: Yes
// DC: Yes

// The List MUST be already ordered!!!!
fun binarySearch(bucket: ArrayList<Int>, targetNum: Int): Int {
    var right = bucket.size - 1
    var left = 0

    while (left <= right) {
        val midElem = (left + right) / 2

        if (bucket[midElem] == targetNum) {
            return midElem
        } else if (bucket[midElem] < targetNum) {
            left = midElem + 1
        } else {
            right = midElem - 1
        }
    }

    return -1
}
