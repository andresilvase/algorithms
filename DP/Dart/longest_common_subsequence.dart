import 'dart:math';

(String, int) longestCommonSubsequence(String text1, String text2) {
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

  return (showSubsequence(dp, text1, text2), dp[m][n]);
}

String showSubsequence(List<List<int>> dp, String text1, String text2) {
  int m = text1.length;
  int n = text2.length;

  StringBuffer sub = StringBuffer();

  int i = m;
  int j = n;

  while (i > 0 && j > 0) {
    if (text1[i - 1] == text2[j - 1]) {
      sub.write(text1[i - 1]);
      i--;
      j--;
    } else {
      if (dp[i - 1][j] > dp[i][j - 1]) {
        i--;
      } else {
        j--;
      }
    }
  }

  return sub.toString().split('').reversed.join();
}

void main() {
  String text1 = "CANETA";
  String text2 = "BUCETA";
  print(longestCommonSubsequence(text1, text2));
}
