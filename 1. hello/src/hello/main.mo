actor {
  // accepts name of type txt and returns something of type text
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
