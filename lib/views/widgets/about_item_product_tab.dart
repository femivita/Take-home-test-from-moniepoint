import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:take_home_test/constants/enums/prod_location.dart';
import 'package:take_home_test/providers/reviews.dart';
import 'package:take_home_test/views/widgets/product_grid_builder.dart';
import 'package:take_home_test/views/widgets/review_item_product_tab.dart';
import '../../constants/color.dart';
import '../../models/product.dart';
import '../../providers/cart.dart';
import '../../providers/category.dart';
import '../../providers/product.dart';
import '../../providers/stores.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import 'k_wrap.dart';

class AboutItemTab extends StatefulWidget {
  const AboutItemTab({
    Key? key,
    required this.product,
    required this.categoryData,
    required this.storeData,
    required this.size,
    required this.products,
    required this.productData,
    required this.cartData,
    required this.navigateToStore,
  }) : super(key: key);

  final Product product;
  final Categories categoryData;
  final Stores storeData;
  final Size size;
  final List<Product> products;
  final Products productData;
  final Cart cartData;
  final Function navigateToStore;

  @override
  State<AboutItemTab> createState() => _AboutItemTabState();
}

class _AboutItemTabState extends State<AboutItemTab> {
  var currentReviewTag = 'Popular';
  List<String> reviewTags = ['Popular', 'Trending', 'Latest', 'Yesterday'];
  // change review tag
  void changeReviewTag(String value) {
    setState(() {
      currentReviewTag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = data['product_id'];
    ProdLocation prodLocation = data['prodLocation'];
    var productData = Provider.of<Products>(context);
    var storeData = Provider.of<Stores>(context);
    var cartData = Provider.of<Cart>(context);
    var categoryData = Provider.of<Categories>(context);
    var reviewData = Provider.of<Reviews>(context);
    Product product = productData.findById(id);
    List<Product> products =
        Provider.of<Products>(context, listen: false).recommendProducts;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(title: 'Brand', data: product.brandName),
              KWrap(title: 'Color', data: product.colorName),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Category',
                data: categoryData.findById(product.catId).title,
              ),
              KWrap(title: 'Material', data: product.material),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Condition',
                data: product.condition,
              ),
              KWrap(title: 'Heavy', data: product.heavy),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(
            color: storeColor,
            thickness: 0.4,
          ),
          const SizedBox(height: 30),
          Text(
            'Description:',
            style: getMediumStyle(
              color: accentColor,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 140,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: product.descriptionList.length,
              itemBuilder: (context, index) {
                var item = product.descriptionList[index];

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '• $item',
                    style: getRegularStyle(
                      color: greyFontColor,
                      fontSize: FontSize.s16,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
            style: getRegularStyle(
              color: greyFontColor,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Show less ^',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(
            color: storeColor,
            thickness: 0.4,
          ),
          const SizedBox(height: 20),
          Text(
            'Shipping Information:',
            style: getMediumStyle(
              color: accentColor,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Delivery:',
                data: product.shippingInformation.delivery,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Shipping:',
                data: product.shippingInformation.shipping,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KWrap(
                title: 'Arrival:',
                data: product.shippingInformation.arrival,
              )
            ],
          ),
          const SizedBox(height: 30),
          const Divider(
            color: storeColor,
            thickness: 0.4,
          ),
          const SizedBox(height: 30),
          Text(
            'Seller Information:',
            style: getMediumStyle(
              color: accentColor,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.storeId,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    storeData.findById(product.storeId).imgUrl,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeData.findById(product.storeId).name,
                    style: getMediumStyle(
                      color: accentColor,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Active 5m ago | 94.3 Positive feedback',
                    style: getRegularStyle(
                      color: greyFontColor,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      side: const BorderSide(color: primaryColor),
                    ),
                    onPressed: () => widget.navigateToStore(),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.storefront, color: primaryColor),
                        const SizedBox(width: 10),
                        Text(
                          'Visit store',
                          style: getRegularStyle(
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(
            color: storeColor,
            thickness: 0.4,
          ),
          const SizedBox(height: 20),
          reviewTab(
            product: product,
            size: widget.size,
            reviewData: reviewData,
            currentReviewTag: currentReviewTag,
            reviewTags: reviewTags,
            changeReviewTag: changeReviewTag,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended Products:',
                style: getMediumStyle(
                  color: accentColor,
                  fontSize: FontSize.s16,
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  'See more',
                  style: getMediumStyle(
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: widget.size.height / 3,
            child: ProductGridBuilder(
              prodLocation: ProdLocation.recommendedProducts,
              products: products,
              productsData: productData,
              categoryData: categoryData,
              cartData: cartData,
            ),
          )
        ],
      ),
    );
  }
}
