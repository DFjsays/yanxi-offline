package com.google.gson;

/** 编译期占位，签名与真实 gson 保持一致。 */
public class JsonObject extends JsonElement {
    public JsonObject addProperty(String name, String value) {
        return this;
    }

    public JsonObject addProperty(String name, Number value) {
        return this;
    }

    public JsonObject add(String name, JsonElement value) {
        return this;
    }
}
