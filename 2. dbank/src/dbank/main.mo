import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

// actor DBank {
//   var currentValue : Nat = 300; //this value get s reset upon refreshing
//   currentValue := 100; //value changed

//   let id = 42553; //a constant whose value cant be changed later

//   Debug.print("Hello"); //to print direct srtings
//   Debug.print(debug_show (currentValue)); //to print assigned values
//   Debug.print(debug_show (id));
// };

// actor DBank {
//   //to let people deposit money

//   var currentValue : Nat = 300;
//   currentValue := 100;

//   //this is a private function - can access only within actor DBAank
//   func topUp() {
//     currentValue += 1;
//     Debug.print(debug_show (currentValue));
//   };
//   topUp();
// };

// actor DBank {
//   var currentValue : Nat = 300;
//   currentValue := 100;

//   // to access from outside call it from command line and modify func
//   public func topUp(amount : Nat) {
//     currentValue += amount;
//     Debug.print(debug_show (currentValue));
//   };
// };

// actor DBank {
//   var currentValue : Nat = 300;
//   currentValue := 100;
//   //challenge
//   //allow users to withdraw an amount from the currentValue
//   //decrease the currentValue by  the amount
//   public func withdrawal(amount : Nat) {
//     let tempValue : Int = currentValue -amount;
//     if (tempValue >= 0) {
//       currentValue -= amount;
//       Debug.print(debug_show (currentValue));
//     } else {
//       Debug.print("Amount too large. Current Value less than zero");
//     };
//   };
// };

// actor DBank {
//   var currentValue : Nat = 300;
//   currentValue := 100;

//   public func topUp(amount : Nat) {
//     currentValue += amount;
//     Debug.print(debug_show (currentValue));
//   };

//   public func withdrawal(amount : Nat) {
//     let tempValue : Int = currentValue -amount;
//     if (tempValue >= 0) {
//       currentValue -= amount;
//       Debug.print(debug_show (currentValue));
//     } else {
//       Debug.print("Amount too large. Current Value less than zero");
//     };
//   };

//   //to get values faster. here we are calling an async functionr
//   public query func checkBalance() : async Nat {
//     return currentValue;
//   };
// };

// actor DBank {
//   //to store a new value in the same variable upon refreshing

//   stable var currentValue : Nat = 300; //to store a new value in the same variable upon refreshing

//   public func topUp(amount : Nat) {
//     currentValue += amount;
//     Debug.print(debug_show (currentValue));
//   };

//   public func withdrawal(amount : Nat) {
//     let tempValue : Int = currentValue -amount;
//     if (tempValue >= 0) {
//       currentValue -= amount;
//       Debug.print(debug_show (currentValue));
//     } else {
//       Debug.print("Amount too large. Current Value less than zero");
//     };
//   };

// };

// actor DBank {
//   //compound interest (A=[P*((1+(r/n))^nt)])
//   // A=amount
//   // P=priciple(initial amount)
//   // r=rate in percentage (decimal)
//   // n=number of times it is compounded
//   // t=time

//   stable var currentValue : Float = 300;
//   stable var startTime = Time.now();
//   Debug.print(debug_show (startTime));

//   public func compound() {
//     let currentTime = Time.now();
//     let timeElapsedNS = currentTime -startTime;
//     let timeElapsed = timeElapsedNS / 1000000000;
//     currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
//     startTime := currentTime;
//   };
// };

actor DBank {
  //to compound and do other banking tasks as well

stable var currentValue : Float = 300;
currentValue := 300;
Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime -startTime;
    let timeElapsed = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.001 ** Float.fromInt(timeElapsed));
    startTime := currentTime;
  };

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawal(amount : Float) {
    let tempValue : Float = currentValue -amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large. Current Value less than zero");
    };

  };

  public query func checkBalance() : async Float {
    return currentValue;
  };
};

// actor DBank {
//   //compound interest (A=[P*((1+(r/n))^nt)])
//   // A=amount
//   // P=priciple(initial amount)
//   // r=rate in percentage (decimal)
//   // n=number of times it is compounded
//   // t=time

//   stable var currentValue : Float = 300;
//   stable var startTime = Time.now();
//   Debug.print(debug_show (startTime));

//   public func compound() {
//     let currentTime = Time.now();
//     let timeElapsedNS = currentTime -startTime;
//     let timeElapsed = timeElapsedNS / 1000000000;
//     currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
//     startTime := currentTime;
//   };
// };

// actor DBank {
//   //to work without compuonding

//   stable var currentValue : Float = 300;
//   currentValue := 300;
//   Debug.print(debug_show (currentValue));

//   stable var startTime = Time.now();
//   Debug.print(debug_show (startTime));

//   public func topUp(amount : Float) {
//     currentValue += amount;
//     Debug.print(debug_show (currentValue));
//   };

//   public func withdrawal(amount : Float) : async Float {
//     if (amount <= currentValue) {
//       currentValue -= amount;
//       Debug.print(debug_show (currentValue));
//       return currentValue;
//     } else {
//       Debug.print("Amount too large.");
//       return currentValue;
//     };

//   };

//   public query func checkBalance() : async Float {
//     return currentValue;
//   };
// };
