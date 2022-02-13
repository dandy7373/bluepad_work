import 'package:bluepad_prework/viewmodel/signin_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Signin extends StatefulWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  TextEditingController? email= TextEditingController();
  TextEditingController? password= TextEditingController();
  late Size screenSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SigninViewModel>().isLoggedin();
    
  }
  @override
  Widget build(BuildContext context) {
    screenSize=MediaQuery.of(context).size;
    if(context.watch<SigninViewModel>().wait){
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if(context.watch<SigninViewModel>().loggedin){
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
    print('suxr');
    return Scaffold(
      body:SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Please Sign in to continue',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05),
          child: Text('Email ID',style: TextStyle(color: Colors.indigo),),
        ),
         Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05, vertical: 16),
          child: Container(
            width: screenSize.width*0.9,
            height: screenSize.height*0.075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.indigo,width: 3)
            ),
            child: TextFormField(
              obscureText: false,
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Password',
                fillColor: Colors.indigo,
                border:InputBorder.none
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05),
          child: Text('Password',style: TextStyle(color: Colors.indigo),),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05, vertical: 16),
          child: Container(
            width: screenSize.width*0.9,
            height: screenSize.height*0.075,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.indigo,width: 3)
            ),
            child: TextFormField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Password',
                fillColor: Colors.indigo,
                border:InputBorder.none
              ),
            ),
          ),
        ),
        InkWell(
          onDoubleTap: ()async{
            print('000');
          },
          onTap: ()async{
            print('yes');
            
            print(Provider.of<SigninViewModel>(context,listen: false).success);
            await Provider.of<SigninViewModel>(context,listen:false).signin();//Prototyping the actual Signin process

            if(Provider.of<SigninViewModel>(context,listen: false).success){
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            }
          },
          child: Center(
            child: Container(
              width: screenSize.width*0.9,
              height: screenSize.height*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.indigo
              ),
              child: Center(
                child: Text('Sigin',style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            ),
          ),
        )
      ],
    ) ,
      )
    );
  }
}