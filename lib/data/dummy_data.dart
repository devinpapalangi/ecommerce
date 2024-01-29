import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';
import 'package:ecommerce/utils/contants/image_strings.dart';
import 'package:ecommerce/routes/routes.dart';

class DummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: true),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: false),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: false),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: false),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner7,
        targetScreen: TRoutes.checkout,
        active: false),
  ];
  static final List<CategoryModel> categories = [
    //Parent Categories
    CategoryModel(
        id: '1', name: 'Sport', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '4', name: 'Cloth', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '5', name: 'Animal', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoe', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetic',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8', name: 'Jewelry', image: TImages.sportIcon, isFeatured: true),

    //Sub Categories
    //Sport
    CategoryModel(
        id: '9',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Track Suits',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '11',
        name: 'Sport Equipments',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    //Furniture
    CategoryModel(
        id: '12',
        name: 'Bedroom Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '13',
        name: 'Kitchen Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '14',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '2'),

    //Electronics
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '3'),

    //Cloth
    CategoryModel(
        id: '17',
        name: 'Shirts',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '4'),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: TImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: TImages.acerlogo,
        name: 'Acer',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: TImages.jordanLogo,
        name: 'Jordan',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.pumaLogo,
        name: 'Puma',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'ZARA',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'Samsung',
        productsCount: 36,
        isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        stock: 15,
        price: 135,
        isFeatured: true,
        title: 'Green Nike Sports Shoe',
        salePrice: 30,
        description: 'Green Nike Sport Shoe',
        brand: BrandModel(
            id: '1',
            name: 'Nike',
            image: TImages.nikeLogo,
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9
        ],
        sku: 'ABR4568',
        categoryId: '1',
        thumbnail: TImages.productImage1,
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              image: TImages.productImage1,
              price: 134,
              salePrice: 122.6,
              stock: 34,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
              description:
                  'This is a Product description for Green Nike Sport Shoes'),
          ProductVariationModel(
            id: '2',
            image: TImages.productImage23,
            price: 132,
            stock: 15,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '3',
            image: TImages.productImage23,
            price: 234,
            stock: 0,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '4',
            image: TImages.productImage1,
            price: 232,
            stock: 222,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '5',
            image: TImages.productImage21,
            price: 334,
            stock: 0,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '6',
            image: TImages.productImage21,
            price: 332,
            stock: 11,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
          ),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description:
          'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description:
          'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage64,
        TImages.productImage65,
        TImages.productImage66,
        TImages.productImage67
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
        id: '004',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage60,
        description:
            'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
        brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
        images: [
          TImages.productImage60,
          TImages.productImage61,
          TImages.productImage62,
          TImages.productImage63
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 38', 'EU 32', 'EU 34'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              description:
                  'This is a Product description for 4 Color collar t-shirt dry fit',
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 8,
              price: 234,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage61,
              attributeValues: {
                'Color': 'Yellow',
                'Size': 'EU 32'
              }), // Product VariationModel
          ProductVariationModel(
              id: '5',
              stock: 8,
              price: 334,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 38'}),
          ProductVariationModel(
              id: '7',
              stock: 0,
              price: 334,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '8',
              stock: 11,
              price: 332,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '005',
        title: 'Nike Air Jordon Shoes',
        stock: 15,
        price: 35,
        isFeatured: false,
        thumbnail: TImages.productImage10,
        description:
            'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage7,
          TImages.productImage8,
          TImages.productImage9,
          TImages.productImage10
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Black', 'Brown']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 16,
              price: 36,
              salePrice: 12.6,
              image: TImages.productImage8,
              description:
                  "Flutter is Google's mobile UI open source framework to build high-quality native (super fast) interfaces for 10S and Android apps with the unified codebase.",
              attributeValues: {
                'Color': 'Orange',
                'Size': 'EU 34'
              }), // Product VariationModel
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 35,
              image: TImages.productImage7,
              attributeValues: {
                'Color': 'Black',
                'Size': 'EU 32'
              }), // Product VariationModel
          ProductVariationModel(
              id: '3',
              stock: 14,
              price: 34,
              image: TImages.productImage9,
              attributeValues: {
                'Color': 'Brown',
                'Size': 'EU 34'
              }), // Product VariationModel
          ProductVariationModel(
              id: '4',
              stock: 13,
              price: 33,
              image: TImages.productImage7,
              attributeValues: {
                'Color': 'Black',
                'Size': 'EU 34'
              }), // Product VariationModel
          ProductVariationModel(
              id: '5',
              stock: 12,
              price: 32,
              image: TImages.productImage9,
              attributeValues: {
                'Color': 'Brown',
                'Size': 'EU 32'
              }), // Product VariationModel
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 31,
              image: TImages.productImage8,
              attributeValues: {
                'Color': 'Brange',
                'Size': 'EU 32'
              }), // Product VariationModel
        ],
        productType: 'ProductType.variable'),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description:
          'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', image: TImages.samsungLogo, name: 'Samsung'),
      images: [
        TImages.productImage11,
        TImages.productImage12,
        TImages.productImage13,
        TImages.productImage12
      ],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description:
          'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '7', image: TImages.tomiLogo, name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ), // Product Model
  ];
}
