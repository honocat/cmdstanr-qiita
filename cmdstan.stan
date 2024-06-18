// cmdstan.stan
// CmdStanの解説のためのStanファイルです．
// https://qiita.com/Honoka-Nakano/items/b26222aec402b9ecabf9

// 分析に用いるデータを定義する．
data {
  int<lower=0> N;  // サンプルサイズ
  array[N] int Y;  // ビールの売上
  array[N] real X; // 気温
  array[N] int Z;  // 来客数
}

// 推定したいパラメタを定義する．
parameters {
  real beta1;
  real beta2;
  real beta3;
  real<lower=0> sigma;
}

// 分析に用いるモデルを定義する．
model {
  array[N] real mu;
  for (i in 1:N) {
    mu[i] = beta1 + beta2 * X[i] + beta3 * Z[i];
    Y[i] ~ normal(mu[i], sigma);
  }
}
