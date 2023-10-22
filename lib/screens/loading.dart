import 'package:flutter/material.dart';
import 'package:redapp/model/api_response.dart';
import 'package:redapp/screens/login.dart';
import 'package:redapp/screens/home.dart';
import 'package:redapp/services/user_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>  {
    void _loadUserInfo() async{
      String token = await getToken();
      if (token == ''){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=> const Login()),(route)=>false);
      } else {
        ApiResponse response = await getUserDetails();
        if (response.error == null){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>const Home()),(route)=>false);
        } else if (response.error == 'Unauthenticated.') {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>const Login()),(route)=>false);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}'),
          ));
      }
    }
  }
  @override
  void initState(){
    _loadUserInfo();
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 219, 207, 221),
        child: const Center(
              child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        ),
    );
  }
}
