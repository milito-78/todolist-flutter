mixin AuthHeader {
  Map<String,String> authorization(String token){
    return {"Authorization" : "Bearer $token" };
  }
}