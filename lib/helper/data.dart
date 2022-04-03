import 'package:flutter_news/models/category_models.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  return category = [
    CategoryModel(
      categoryName: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
    ),
    CategoryModel(
      categoryName: 'Entertainment',
      imageUrl:
          'https://media.istockphoto.com/photos/multiple-television-screens-in-blue-tones-picture-id171588907',
    ),
    CategoryModel(
      categoryName: 'General',
      imageUrl:
          'https://media.istockphoto.com/photos/headline-picture-id184625088?b=1&k=20&m=184625088&s=170667a&w=0&h=eU3WjzBxqfutz-71Lun8kP-FOKsBh6h2YYR6f1TFhYw=',
    ),
    CategoryModel(
      categoryName: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    CategoryModel(
      categoryName: 'Science',
      imageUrl:
          'https://media.istockphoto.com/photos/gene-therapy-concept-medical-technology-medtech-picture-id1302573302?s=612x612',
    ),
    CategoryModel(
      categoryName: 'Sports',
      imageUrl:
          'https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190756?s=612x612',
    ),
    CategoryModel(
      categoryName: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
  ];
}
