import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context,index) => categoriesBuilder(ShopCubit.get(context).categoriesModel.data.dataModel[index]), 
          separatorBuilder: (context,index) =>  SizedBox(height: 10,), 
          itemCount: ShopCubit.get(context).categoriesModel.data.dataModel.length
          );
      },
    );
  }
  
  Widget categoriesBuilder(DataModel categoriesModel){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
            children: [
              Image(image: NetworkImage('${categoriesModel.image}'),fit: BoxFit.cover,width: 100,),
              SizedBox(width: 20,),
              Text('${categoriesModel.name}'),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
    );
  }
}
