class Validators {
  static String? validateEmail(
    String? value,
  ) {
    String emailPattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Email ID can not be empty";
    } else if (!regex.hasMatch(value.trim())) {
      return "Please enter a valid Email ID";
    } else {
      return null;
    }
  }

  static String? validateEmailORMobile(String? value, {bool isEmailId = true}) {
    String emailPattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Email or Mobile number can not be empty";
    } else if (!regex.hasMatch(value.trim()) && isEmailId) {
      return "Please enter a valid Email ID";
    } else if (!isEmailId && value.length <= 5) {
      return "Please enter a valid Mobile number";
    } else {
      return null;
    }
  }

  static String? validateRegNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Vehicle Reg. Number field can not be empty";
    } else if (value.length < 4) {
      return "Invalid Vehicle reg. number";
    } else {
      return null;
    }
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return "OTP field can not be empty";
    } else if (value.length != 6) {
      return "Invalid OTP Number";
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password should not be empty";
    } else {
      if (!RegExp(r'^.{8,}$').hasMatch(value)) {
        return "Password should be minimum 8 characters";
      } else if (!RegExp('.*[a-z].*').hasMatch(value)) {
        return "Should have at least one lower character";
      } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
        return "Should have at least one upper character";
      } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
        return "Should contain at least one number";
      } else if (!RegExp(".*[!@#&*~\$%_].*").hasMatch(value)) {
        return "Should contain at least one special character";
      } else {
        return null;
      }
    }
  }

  static String? validateConfirmPassword(
      String? newPassword, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password should not be empty";
    } else {
      if (newPassword == null || newPassword.isEmpty) {
        return null;
      } else if (confirmPassword != newPassword) {
        return "Password doesn't match";
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password should not be empty";
    } else if (value.length <= 4) {
      return "Please enter a valid password";
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name should not be empty";
    } else if (value.length <= 3) {
      return "Please enter a valid name";
    } else {
      return null;
    }
  }

  static String? validateVehicleName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name should not be empty";
    } else if (value.length < 2) {
      return "Please enter a valid name";
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number should not be empty";
    } else if (value.length < 5) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return "City should not be empty";
    } else if (value.length < 2) {
      return "Please enter a valid city";
    } else {
      return null;
    }
  }

  static String? validateVehicleNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vehicle number is required';
    }
    final pattern = r'^[A-Z0-9\- ]{5,12}$';
    final regExp = RegExp(pattern, caseSensitive: false);
    if (!regExp.hasMatch(value.trim())) {
      return 'Enter a valid vehicle number';
    }

    return null;
  }

  static String? validateODOMeter(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Odometer reading is required';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    } else if (value.length < 6) {
      return 'Enter a valid address';
    }
    return null;
  }

  static String? validateVIN(String? value) {
    final vinPattern = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');

    if (value == null || value.isEmpty) {
      return 'Please enter the VIN';
    } else if (!vinPattern.hasMatch(value)) {
      return 'Invalid VIN. VIN must be 17 characters and exclude I, O, Q.';
    }

    return null;
  }
}
