
// class CategoriesModel {
//   bool status;
//   CategoriesDataModel data;
//    CategoriesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data =  CategoriesDataModel.fromJson( json['data']);
//   }
// }

// class CategoriesDataModel {
//   int currentPage;
//   DataModel data;
//    CategoriesDataModel.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     data =  DataModel.fromJson( json['data']);
//   }
// }

// class DataModel {
//   int id;
//   String name;
//   String image;

//   DataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
// }

class CategoriesModel {
  bool status;
  Null message;
  CategoriesDataModel data;


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CategoriesDataModel.fromJson(json['data']) : null;
  }

}

class CategoriesDataModel {
  int currentPage;
  List<CategoriesDataModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

 
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<CategoriesDataModel>();
      json['data'].forEach((v) {
        data.add(new CategoriesDataModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class Data {
  int id;
  String name;
  String image;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  
  
}




