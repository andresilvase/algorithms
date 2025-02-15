package main

import "fmt"

// AMANHA PARASITA Using DP

//   P A R A S I T A
// A 0 1 1 1 1 1 1 1
// M 0 1 1 1 1 1 1 1
// A 0 1 1 2 2 2 2 2
// N 0 1 1 2 2 2 2 2
// H 0 1 1 2 2 2 2 2
// A 0 1 1 2 2 2 2 3

// AMANHA PARASITA Using Two 1D Arrays
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 0 0 0 0 0 0 0

// i, j := 1, 1 // A, P
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 0 0 0 0 0 0 0

// i, j := 1, 2 // A, A
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 0 0 0 0 0 0

// i, j := 1, 3 // A, R
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 0 0 0 0 0

// i, j := 1, 4	// A, A
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 1 0 0 0 0

// i, j := 1, 5 // A, S
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 1 1 0 0 0

// i, j := 1, 6 // A, I
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 1 1 1 0 0

// i, j := 1, 7 // A, T
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 1 1 1 1 0

// i, j := 1, 8 // A, A
// Previous: 0 0 0 0 0 0 0 0 0
// Current:  0 0 1 1 1 1 1 1 1

// PARASITA
// AMANHA
// AAA

// PARAFERNALHA
// PARAFUSADO
// PARAFA

// BUTECO
// CANECO
// ECO

// XIBATA
// CAPIXABA
// IBA

// BOTINA
// BOTIJA
// BOTI

// CANETA
// BOCETA
// CETA

func longestCommonSubsequence(text, text2 string) int {
	m := len(text)
	n := len(text2)
	sub := ""

	curr := make([]int, n+1)
	prev := make([]int, n+1)

	for i := 1; i <= m; i++ {
		for j := 1; j <= n; j++ {
			if text[i-1] == text2[j-1] {
				curr[j] = 1 + prev[j-1]
				sub += string(text[i-1])
			} else {
				curr[j] = max(curr[j-1], prev[j])
			}
		}

		prev = curr
	}

	// return prev[len(prev)-1]
	fmt.Println(sub)
	return len(sub)

}

func main() {
	fmt.Println(longestCommonSubsequence("amanha", "parasita"))
}
