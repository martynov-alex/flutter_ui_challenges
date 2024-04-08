enum CryptoCoin {
  binanceCoin('Binance Coin', 'BNB'),
  bitcoin('Bitcoin', 'BTC'),
  dash('Dash', 'DASH'),
  dogecoin('Dogecoin', 'DOGE'),
  ethereum('Ethereum', 'ETH'),
  ripple('Ripple', 'XRP'),
  ;

  const CryptoCoin(this.name, this.ticker);

  final String name;
  final String ticker;
}
