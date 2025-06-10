package com.util.exceptions;

public class UnAuthException extends WebException {
  public UnAuthException(String role) {
    super("你不是" + role + "，你到底是谁？");
  }

  public UnAuthException(String role, String actual) {
    super("你不是" + role + "，你是" + actual);
  }
}
