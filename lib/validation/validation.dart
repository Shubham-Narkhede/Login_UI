class ValidationData{

  static String firstNameValidate(String firstname) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (firstname.length == 0) {
      return 'Please enter name';
    } else if (!regExp.hasMatch(firstname)) {
      return 'Please enter valid first name';
    }
    return null;
  }

  static String lastNameValidate(String lastname) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (lastname.length == 0) {
      return 'Last name is required';
    } else if (!regExp.hasMatch(lastname)) {
      return 'Please enter valid last name';
    }
    return null;
  }

  static String passwordValidate(String passValue) {
    if (passValue.length == 0) {
      return 'Please enter password';
    } else if (passValue.length < 6 ) {
      return 'password must be greater than 6 characters';
    }
    return null;
  }

  static String emailValidate(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Please enter email";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  static String mobileValidate(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}