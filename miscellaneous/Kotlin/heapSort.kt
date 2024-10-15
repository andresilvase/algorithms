import java.util.Collections

fun heapSort(arr: ArrayList<Int>) {
    val arrSize: Int = arr.size

    // Build max-heap
    for (i in (arrSize / 2) - 1 downTo 0) {
        heapify(arr, arrSize, i)
    }

    for (i in arrSize - 1 downTo 1) {
        Collections.swap(arr, 0, i)

        if (i > 1) heapify(arr, i, 0)
    }
}

fun heapify(arr: ArrayList<Int>, arrSize: Int, i: Int) {
    var largest: Int = i
    var left: Int = 2 * i + 1
    var right: Int = 2 * i + 2

    if (left < arrSize && arr[left] > arr[largest]) {
        largest = left
    }

    if (right < arrSize && arr[right] > arr[largest]) {
        largest = right
    }

    if (largest != i) {
        Collections.swap(arr, i, largest)

        heapify(arr, arrSize, largest)
    }
}

fun main() {
    val arr: ArrayList<Int> = arrayListOf<Int>(1, 90, 4, 8, 2, 35, 76, 5)

    heapSort(arr)
    println(arr)

    val a = binarySearch(arr, 90)

    print(a)
}
