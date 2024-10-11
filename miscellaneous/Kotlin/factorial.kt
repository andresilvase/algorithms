fun factorial(num: Int): Int {
    return when {
        num < 0 -> throw IllegalArgumentException("Não existe fatorial de número negativo!")
        num in 0..1 -> 1
        else -> num * factorial(num - 1)
    }
}

fun main() {
    val number: Int
    number = 0
    val result = factorial(number)
    println("The factorial of $number is $result!")
}
