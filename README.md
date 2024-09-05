# Client Side App (Customer App)

## Kriminal Fashion App

Kriminal Fashion App is the customer-facing application for browsing and purchasing high-quality fashion items from the Kriminal brand. This app provides a seamless shopping experience for users, allowing them to browse products, add them to their cart, and make purchases securely.

<div style="
  display: flex;
  justify-content: space-between;
  ">
 <img src = "https://github.com/mrcodefrost/kriminal_fashion_client/blob/main/repo%20resources/1.jpg?raw=true" width="250"/>
 <img src = "https://github.com/mrcodefrost/kriminal_fashion_client/blob/main/repo%20resources/2.jpg?raw=true" width="250"/>
 <img src = "https://github.com/mrcodefrost/kriminal_fashion_client/blob/main/repo%20resources/3.jpg?raw=true" width="250"/>
 <img src = "https://github.com/mrcodefrost/kriminal_fashion_client/blob/main/repo%20resources/4.jpg?raw=true" width="250"/>
 <img src = "https://github.com/mrcodefrost/kriminal_fashion_client/blob/main/repo%20resources/5.jpg?raw=true" width="250"/>
</div>

### Features

- **Product Catalog:** Browse high-quality fashion items from the Kriminal brand.
- **Search and Filter:** Search for specific products and filter them based on categories.
- **User Authentication:** Secure user authentication using Firebase authentication.
- **PhonePe Gateway:** Payment integration using the PhonePe gateway for secure transactions.
- **OTP Login:** Login using OTP verification for quick and easy access.
- **Address Management:** Add and manage delivery addresses for orders.

### Usage

- Browse through the catalog and select products of interest.
- Add products to the cart and proceed to checkout.
- Enter delivery address and make payment using the PhonePe gateway (in test mode).

### Platforms

- Android
- iOS
- Web

### Technologies Used

- Flutter
- Firebase

### Installation

1. Clone the repository to your local machine:

 ```bash
   git clone https://github.com/mrcodefrost/kriminal_fashion_client.git
 ```

2. Navigate to the project directory:

 ```bash
   cd kriminal_fashion_client
 ```

3. Install dependencies by running this command in IDE terminal:

 ```bash
   flutter pub get
 ```

4. Set up Firebase:

If you haven't already, [sign in to your Firebase account](https://firebase.google.com/docs/web/setup).
Install Firebase CLI globally using IDE Terminal:

Log in to Firebase
 ```bash
   firebase login
 ```

Activate Flutterfire CLI
 ```bash
   flutter pub global activate flutterfire_cli
 ```


5. Generate Model files by running this command

 ```bash
  dart run build_runner build --delete-conflicting-outputs
 ```

### Configuration

1. Create a `firebase.json` file in the root directory of your project

2. Copy and paste the following configuration into the `firebase.json` file

```json
{
  "hosting": {
     "target": "client",
    "public":  "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ]
  }
}
```

3. If you encounter the error ' error: cannot find symbol MultiDex.install(this)' then delete the 'FlutterMultiDexApplication'
    Issue is caused if the Multidex is activated before migrating to Flutter 3.22. This is a reported [bug](https://github.com/flutter/flutter/issues/148368) in Flutter (v 3.22). It will be fixed in 3.23 release.


### License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
