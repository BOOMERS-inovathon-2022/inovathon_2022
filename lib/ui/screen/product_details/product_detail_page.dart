import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/dto/product_listing_dto.dart';
import 'package:inovathon_2022/ui/screen/product_details/product_detail_widget.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(this.product);

  ProductListingDTO product;

  @override
  State<ProductDetailPage> createState() => ProductDetailWidget();
}
