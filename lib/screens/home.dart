import 'package:bluepad_prework/viewmodel/home_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Size screenSize;

  final _scrollController=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeViewModel>().getImages();

    _scrollController.addListener(() async{
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        context.read<HomeViewModel>().getImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Test App',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await Provider.of<HomeViewModel>(context,listen: false).logout();
            Navigator.of(context).pushReplacementNamed('/signin');
          }, icon: Icon(Icons.login_rounded,color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height*0.85,
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(width: screenSize.width*0.7,child: Divider(thickness: 1,color: Colors.indigo,),),
            controller: _scrollController,
            itemCount: context.watch<HomeViewModel>().images.length+1,
            itemBuilder: (context,index){
              if(index==context.watch<HomeViewModel>().images.length){
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return Container(
                width: screenSize.width*0.95,
                height: screenSize.height*0.20,
                child: Column(
                  children: [
                    Text(context.watch<HomeViewModel>().images[index].author),
                    Container(
                      height: screenSize.height*0.17,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: Image.network(context.watch<HomeViewModel>().images[index].imagePath).image)
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ),
    );
  }
}