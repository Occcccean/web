package com.util;

import com.util.SM3Util;

public class Password {
  String password;

  public Password(String password) {
    this.password = password;
  }

  public String getEncodedPassword() {
    return SM3Util.encrypt(password);
  }

  public boolean verify(String encoded) {
    return SM3Util.verify(password, encoded);
  }

  public boolean isValidate() {
    var regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\\p{Punct}).{8,}$";
    return password.matches(regex);
  }
}
