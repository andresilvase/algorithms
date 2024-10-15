class MyHashSet() {
    val buckets = Array(6) { ArrayList<Int>() }

    fun hashFun(key: Int): Int = key % 6

    fun add(key: Int) {
        val bucket = buckets[hashFun(key)]

        if (!contains(key)) {
            bucket.add(key)
        }
    }

    fun remove(key: Int) {
        val bucket = buckets[hashFun(key)]

        if (contains(key)) {
            bucket.remove(key)
        }
    }

    fun contains(key: Int): Boolean {
        val bucket = buckets[hashFun(key)]

        quickSort(bucket, 0, bucket.size - 1)

        return binarySearch(bucket, key) != -1
    }
}
