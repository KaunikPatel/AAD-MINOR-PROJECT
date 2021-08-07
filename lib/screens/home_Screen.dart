import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_login/providers/auth.dart';
import 'package:rest_api_login/screens/login_Screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';




class HomeScreen extends StatelessWidget {
  
  Razorpay  _razorpay ;


 @override
  void initState() {
    this.initState();
    _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_NRTeaZx7nFaYGm',
      'amount': 20000,
      'name': 'kaunik',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'minor@projeckaunik.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text("Home"),
        
      ),
      drawer: Drawer(child: Column(children: [


            
            Text("   "),
            Text("   "),
            Text(" Wel Come "),
            Text("   "),
            Text("   "),
            Divider(thickness: 5,color: Colors.blue,),
            ListTile(
              title: Text("Update",),
              trailing: Icon(Icons.update),
            ),
            
            Divider(thickness: 5,color: Colors.blue,),

            ListTile(
              title: Text("Account"),
               trailing: Icon(Icons.account_box),
            ),

            Divider(thickness: 5,color: Colors.blue,),

            ListTile(
              title: Text("Help"),
               trailing: Icon(Icons.help),
            ),

            Divider(thickness: 5,color: Colors.blue,),

             ListTile(
             
               trailing: Icon(Icons.home),
              
            
                 title: RaisedButton(
                 onPressed: () {
                 Navigator.of(context).pushReplacementNamed("/");
                 Provider.of<Auth>(context, listen: false).logout();
                 },
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(" Add Address"),
                color: Colors.green,
        ),
                  
              
            ),

            Divider(thickness: 5,color: Colors.blue,),

          ListTile(
             
               trailing: Icon(Icons.logout),
              
            
                 title: RaisedButton(
                 onPressed: () {
                 Navigator.of(context).pushReplacementNamed("/");
                 Provider.of<Auth>(context, listen: false).logout();
                 },
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("Logout"),
                color: Colors.green,
        ),
          ),


      ],),),
    
      body: Center(
        
        child: ElevatedButton(onPressed: (){openCheckout();},child: Text("payment"),),


        // child: RaisedButton(
        //   onPressed: () {
        //     openCheckout();
        //   },
        //   child: Text("Razorpay"),
        // ),
      ),

    );
    
  }
}
