package quicksort

import (
	"fmt"
	"math/rand"
	"strconv"
	"time"
)

func QuickSort(list []int) []int {

	if len(list) <= 1 {
		return list
	}

	pivot := list[len(list)-1]

	L := make([]int, 0)
	R := make([]int, 0)

	for _, v := range list[:len(list)-1] {
		if v <= pivot {
			L = append(L, v)
		} else {
			R = append(R, v)
		}
	}

	L = QuickSort(L)
	R = QuickSort(R)

	L = append(L, pivot)
	L = append(L, R...)

	return L
}

func main() {
	// var list []int = []int{6, 2, 8, 4, 9}

	// fmt.Printf("Original List %v\n", list)
	// sortedList := CountElapsedTime(QuickSort, list)
	// fmt.Printf("Sorted List %v\n", sortedList)

	// start := time.Now()
	// fuckingBigList := Gen()
	// end := time.Since(start)
	// fmt.Printf("Time elapsed to generate the list %vms\n", end.Milliseconds())

	funckingBigList := Gen()

	CountElapsedTime(QuickSort, funckingBigList)
}

// Gen generates a list of 1_000_000 random numbers
func Gen() []int {
	list := make([]int, 1_000_000)
	stringList := make([]string, 1_000_000)

	rand.New(rand.NewSource(time.Now().UnixNano()))

	for i := range list {
		list[i] = rand.Intn(1_000_000)
		stringList[i] = strconv.Itoa(list[i]) + ","
	}

	return list
}

func CountElapsedTime[T any](f func(T) T, param T) T {
	start := time.Now()
	output := f(param)
	end := time.Since(start)
	fmt.Printf("GO Elapsed time %vseconds.\n", end.Seconds())
	return output
}
