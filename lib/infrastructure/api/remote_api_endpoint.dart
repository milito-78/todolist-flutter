class RemoteApiEndpoint {
  static const MainUrl = "https://milito.ir/";
  late String version = "v1";

  RemoteApiEndpoint.version(this.version);
  RemoteApiEndpoint({this.version = "v1"});

  String get domain => MainUrl;

  String get path {
    return MainUrl + "api/" + version + "/";
  }

}