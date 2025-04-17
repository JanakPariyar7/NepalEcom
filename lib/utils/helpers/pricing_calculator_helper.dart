class JPricingCalculator {
  //--calculate the price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //calculate shipping cost

  static calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //calculate tax amount

  static calculateTaxAmount(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //lookup for the taxrate from sources, apis or database
    return 0.10; //this is for example
  }

  static double getShippingCost(String location) {
    //look up for shipping cost by api or database
    return 5.00; //for example only
  }
}
