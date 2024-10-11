class MyHashSet() {
    val buckets = Array(2) { ArrayList<Int>() }

    fun hashFun(key: Int): Int = key % 2

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

        return bucket.contains(key)
    }
}
