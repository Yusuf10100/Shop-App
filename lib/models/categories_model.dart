
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
  List<DataModel> dataModel = [];
  
 
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    // if (json['data'] != null) {
      // data = new List<Data>();
      json['data'].forEach((v) {
        dataModel.add(DataModel.fromJson(v));
      });
    // }
   
  }

}

class DataModel {
  int id;
  String name;
  String image;


  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  
  
}




