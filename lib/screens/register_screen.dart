import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../InputData/inputData.dart';
import '../utilities/constants.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  validateData() {
    if (_key.currentState.validate()) {
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.transparent,
        duration: new Duration(seconds: 9),
        content: new Row(
          children: <Widget>[
            new CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            new Text(
              "Submitting...",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ));

      addData();

      _key.currentState.save();
    } else {
      // validation error
      setState(() {
        scaffoldKey.currentState.hideCurrentSnackBar();
        _validate = true;
      });
    }
  }

  Future addData() {
    print("Email:${emailController.text}");
    print("Password:${passwordController.text}");
    setState(() {
      scaffoldKey.currentState.hideCurrentSnackBar();
    });
  }

  Future navigatePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Form(
          key: _key,
          autovalidate: _validate,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF84FFFF),
                          Color(0xFF18FFFF),
                          Color(0xFF00E5FF),
                          Color(0xFF00B8D4),
                        ],
                        stops: [0.1, 0.4, 0.7, 0.9],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.purple,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          InputData.buildNameTF(nameController),
                          SizedBox(height: 20.0),
                          InputData.buildEmailTF(emailController),

                          SizedBox(height: 20.0),
                          InputData.buildNumberTF(numberController),

                          SizedBox(
                            height: 20.0,
                          ),
                          InputData.buildPasswordTF(passwordController),

                          SizedBox(
                            height: 20.0,
                          ),
                          InputData.buildLoginBtn("REGISTER", validateData),

                          InputData.buildSignupSigninBtn(
                              "Already have an Account?",
                              "Sign In",
                              navigatePage)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
