import java.util.Collections

fun quickSort(arr: ArrayList<Int>, left: Int, right: Int) {

    if (left < right) {
        val pivotIndex: Int = partition(arr, left, right)

        quickSort(arr, left, pivotIndex - 1)
        quickSort(arr, pivotIndex + 1, right)
    }
}

fun partition(arr: ArrayList<Int>, left: Int, right: Int): Int {
    val pivot: Int = arr[right]

    var currentLastSmallerThanPivotIndex = left - 1

    for (i in left ..< right) {
        if (arr[i] <= pivot) {
            currentLastSmallerThanPivotIndex++

            if (currentLastSmallerThanPivotIndex < i) {
                Collections.swap(arr, currentLastSmallerThanPivotIndex, i)
            }
        }
    }

    currentLastSmallerThanPivotIndex++
    Collections.swap(arr, currentLastSmallerThanPivotIndex, right)
    return currentLastSmallerThanPivotIndex
}
