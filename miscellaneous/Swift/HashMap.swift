class MyHashMap {
    var bucket: [[Int]]

    init() {
        bucket = Array(repeating: [], count: 1024)
    }

    func hashFunc(key: Int) -> Int {
        return key % 1024
    }

    func put(_ key: Int, _ value: Int) {
        let arrayKeyPosition: Int = hashFunc(key: key)
        var bucketArray: [Int] = bucket[arrayKeyPosition]
        let keyAlreadyExists = bucketArray.contains(key)

        if keyAlreadyExists {
            if let keyIndex = bucketArray.firstIndex(of: key) {
                bucketArray[keyIndex + 1] = value
                bucket[arrayKeyPosition] = bucketArray
            }
        } else {
            bucketArray.append(key)
            bucketArray.append(value)
            bucket[arrayKeyPosition] = bucketArray
        }
    }

    func get(_ key: Int) -> Int {
        let arrayKeyPosition: Int = hashFunc(key: key)
        let bucketArray: [Int] = bucket[arrayKeyPosition]
        let keyAlreadyExists = bucketArray.contains(key)

        if keyAlreadyExists {
            if let keyIndex = bucketArray.firstIndex(of: key) {
                return bucketArray[keyIndex + 1]
            }
        }

        return -1
    }

    func remove(_ key: Int) {
        let arrayKeyPosition: Int = hashFunc(key: key)
        var bucketArray: [Int] = bucket[arrayKeyPosition]
        let keyAlreadyExists = bucketArray.contains(key)

        if keyAlreadyExists {
            if let keyIndex = bucketArray.firstIndex(of: key) {
                bucketArray.remove(at: keyIndex + 1)
                bucketArray.remove(at: keyIndex)
                bucket[arrayKeyPosition] = bucketArray
            }
        }
    }
}

// Testing
let newHashMap = MyHashMap()

newHashMap.put(1, 1)
newHashMap.put(2, 2)
print(newHashMap.get(1))
print(newHashMap.get(3))
newHashMap.put(2, 1)
print(newHashMap.get(2))
newHashMap.remove(2)
print(newHashMap.get(2))
print(newHashMap.bucket)
