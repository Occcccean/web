package com.util.exceptions;

public class WebException extends Exception {
  int statusCode;
  String message;

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public WebException(String message) {
    this.statusCode = 404;
    this.message = message;
  }

  public WebException() {
    this("");
  }

}
