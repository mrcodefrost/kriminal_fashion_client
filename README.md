# Client Side App (Customer App)

## Kriminal Fashion App

Kriminal Fashion App is the customer-facing application for browsing and purchasing high-quality fashion items from the Kriminal brand. This app provides a seamless shopping experience for users, allowing them to browse products, add them to their cart, and make purchases securely.

### Features

- **Product Catalog:** Browse high-quality fashion items from the Kriminal brand.
- **Search and Filter:** Search for specific products and filter them based on categories.
- **User Authentication:** Secure user authentication using Firebase authentication.
- **PhonePe Gateway:** Payment integration using the PhonePe gateway for secure transactions.
- **OTP Login:** Login using OTP verification for quick and easy access.
- **Address Management:** Add and manage delivery addresses for orders.


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

- If you haven't already, [sign in to your Firebase account](https://firebase.google.com/docs/web/setup).
- Install Firebase CLI globally using IDE Terminal:
    ```bash
   flutter pub get
    ```
- Log in to Firebase
    ```bash
   firebase login
    ```

- Activate Flutterfire CLI
    ```bash
   flutter pub global activate flutterfire_cli
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





