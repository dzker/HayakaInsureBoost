class Element {
  final String name;
  final String image;

  Element({required this.name, required this.image});
}

final List<Element> elements = [
  Element(name: "Customer List", image: "asset/customerList.jpeg"),
  Element(name: "Redeem Reward Point", image: "asset/redeemRewardpoint.jpeg"),
  Element(name: "Redeem Transaction", image: "asset/redeemTransaction.jpeg"),
  Element(name: "Redeemed Item", image: "asset/redeemedItem.jpeg"),
];
