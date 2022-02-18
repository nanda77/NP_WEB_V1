class ConvertorClass{

  static int btcToSats(double btc){
    double sets = btc*100000000;
    return sets.round();
  }

}