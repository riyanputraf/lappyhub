# LappyHub

<img width="1920" alt="Cover" src="https://github.com/user-attachments/assets/940fa42b-4822-40ca-8ac1-42d50368d118">

## Description

LappyHub adalah aplikasi mobile yang menawarkan layanan penyewaan laptop untuk memenuhi kebutuhan pengguna seperti pelajar yang membutuhkan laptop baru tanpa harus membeli laptop baru.

## Feature

- Authentication
- Search Location
- List produk laptop
- Detail produk laptop
- Pencarian berdasarkan kategori laptop
- Sewa laptop
- Checkout
- Metode Pembayaran
- Konfirmasi pesanan fingerprint dan PIN
- List pesanan laptop
- Chat dengan admin Lappy
- Profil pengguna

## Tech

- Flutter
- State Management GetX
- Mockapi
- Firebase

## Installation

1. Clone this repository

   ```bash
   git clone https://github.com/riyanputraf/lappyhub.git
   ```
2. Go into the folder
   ```bash  
   cd lappyhub
   ```
3. Install Flutter dependencies
   ```bash  
   flutter pub get
   ```
4. Firebase configuration
   - Create a project in Firebase Console
   - Select Flutter Platform
   - Install the Firebase CLI
   - Run FlutterFire CLI on terminal
      ```bash
      dart pub global activate flutterfire_cli
      ```
   - Run command at the root of your Flutter project directory
     ```bash
      flutterfire configure
      ```
   - Follow configuration instruction
   - Initialize Firebase
     ```javascript
      import 'package:firebase_core/firebase_core.dart';
      import 'firebase_options.dart';
      
      // ...
      
      Future<void> main() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        runApp(const MyApp());
      }
      ```
5. Run the Flutter application
   ```bash  
   flutter run
   ```

