package com.util.exceptions;

public class UnAuthException extends WebException {
  public UnAuthException(String role) {
    super("你不是" + role + "，你到底是谁？");
  }
}
