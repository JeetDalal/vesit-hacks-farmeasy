class Products {
  final String productName;
  final int productPrice;
  final String productQuantity;
  final String productImageUrl;

  Products(
      {required this.productName,
      required this.productPrice,
      required this.productImageUrl,
      required this.productQuantity});
}

List<Products> pList = [
  Products(
      productName: 'Potatoes',
      productPrice: 30,
      productQuantity: '1 Kg',
      productImageUrl:
          'https://images.pexels.com/photos/65174/pexels-photo-65174.jpeg?cs=srgb&dl=pexels-mali-maeder-65174.jpg&fm=jpg'),
  Products(
      productName: 'Tomatoes',
      productPrice: 30,
      productQuantity: '1 Kg',
      productImageUrl:
          'https://images.pexels.com/photos/65174/pexels-photo-65174.jpeg?cs=srgb&dl=pexels-mali-maeder-65174.jpg&fm=jpg'),
  Products(
      productName: 'Carrot',
      productPrice: 25,
      productQuantity: '1/2 Kg',
      productImageUrl:
          'https://images.pexels.com/photos/65174/pexels-photo-65174.jpeg?cs=srgb&dl=pexels-mali-maeder-65174.jpg&fm=jpg'),
  Products(
      productName: 'Beetroot',
      productPrice: 12,
      productQuantity: '1/2 Kg',
      productImageUrl:
          'https://st2.depositphotos.com/1001944/5552/i/600/depositphotos_55521083-stock-photo-fresh-beetroot-on-wooden-background.jpg'),
];
