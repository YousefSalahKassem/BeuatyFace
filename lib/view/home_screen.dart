import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:makeupapp/controller/controller.dart';
import 'package:makeupapp/view/product_info.dart';

class HomeScreen extends StatelessWidget {
final ProductController productController=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Makeup-App"),
        ),
        titleSpacing: 60,
        toolbarHeight: 50,
        backgroundColor: Colors.black26,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(child: Text("Best Makeup",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo_outlined)),
              ],
            ),
          ),
          Expanded(
            child:Obx(
                (){
                  if (productController.isLoading.value)return const Center(child: CircularProgressIndicator());
                  else {
                    return  StaggeredGridView.countBuilder(
                      itemCount: productController.productList.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                      itemBuilder: (context,index){
                        return ProductInfo(productController.productList[index]);
                      },
                      staggeredTileBuilder: (index)=>const StaggeredTile.fit(1));
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}
