package com.google.gson;

/** 编译期占位，签名与真实 gson 保持一致。 */
public class JsonArray extends JsonElement {
    public JsonArray add(JsonElement value) {
        return this;
    }
}
