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

fun main() {
    val list = arrayListOf(1, 3, 5, 7, 9, 11, 13, 15, 17, 19)

    // Test case 1: Target number is present (middle element)
    val target1 = 9
    val result1 = binarySearch(list, target1)
    println("Target $target1 found at index: $result1") // Expected output: 4

    // Test case 2: Target number is present (first element)
    val target2 = 1
    val result2 = binarySearch(list, target2)
    println("Target $target2 found at index: $result2") // Expected output: 0

    // Test case 3: Target number is present (last element)
    val target3 = 19
    val result3 = binarySearch(list, target3)
    println("Target $target3 found at index: $result3") // Expected output: 9

    // Test case 4: Target number is not present
    val target4 = 4
    val result4 = binarySearch(list, target4)
    println("Target $target4 found at index: $result4") // Expected output: -1

    // Test case 5: Target number is present (near middle element)
    val target5 = 7
    val result5 = binarySearch(list, target5)
    println("Target $target5 found at index: $result5") // Expected output: 3
}
