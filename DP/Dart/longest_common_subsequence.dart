import 'dart:math';

int longestCommonSubsequence(String text1, String text2) {
  int m = text1.length;
  int n = text2.length;
  List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (text1[i - 1] == text2[j - 1]) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
      } else {
        dp[i][j] = max(dp[i - 1][j], (dp[i][j - 1]));
      }
    }
  }
  return dp[m][n];
}

void main() {
  String text1 = "AMANHA";
  String text2 = "PARASITA";
  print(longestCommonSubsequence(text1, text2));
}
