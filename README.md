# 🏨 InnSight – House Rental & Hotel Booking App

**InnSight** is a modern, intuitive mobile app built with **Flutter** that allows users to discover, view, and book rental homes and hotels easily. The app integrates **Google Maps** for geolocation-based discovery, **Razorpay** for secure payments, and is backed by **Firebase** for authentication and real-time data management. InnSight is designed to provide a smooth, full-stack booking experience from property exploration to final payment.

---

## 🚀 Project Status

> ✅ **Core Features Implemented & Functional**
> The project began on **May 26, 2025**, and is currently in the **mid-development** phase. Key screens like Home, Property Details, Bookings, Calendar View, Profile, and Booking History have been implemented. Further enhancements (admin panel, backend data integration, and advanced filtering) are in progress.

---

## ✨ Features

* 🔐 **User Authentication** (via Firebase – Email/Google login)
* 📍 **Property Discovery** using Google Maps API
* 🏠 **Property Listings** with search, filters, and booking capability
* 📅 **Booking Page** with integrated **calendar view** for date selection
* 🛏️ **Room Type Summary** and availability per property
* 💳 **Razorpay Integration** for secure and smooth payments
* 📓 **Booking History** section with status (Confirmed, Completed)
* 👤 **User Profile Page** with account information
* 🔔 **Notification System** *(Planned)*
* 🛠️ **Admin Panel for Property Management** *(Planned)*

---

## 🛠️ Tech Stack

| Layer      | Technology                                                                             |
| ---------- | -------------------------------------------------------------------------------------- |
| Framework  | [Flutter](https://flutter.dev/)                                                        |
| Backend    | [Firebase Auth & Firestore](https://firebase.google.com/)                              |
| Maps       | [Google Maps API](https://developers.google.com/maps)                                  |
| Payments   | [Razorpay Flutter SDK](https://razorpay.com/docs/payment-gateway/flutter-integration/) |
| Calendar   | [table\_calendar](https://pub.dev/packages/table_calendar)                             |
| State Mgmt | `setState` \*(for now), Riverpod/Provider *(TBD)*                                      |
| UI Toolkit | Material Design + Custom Widgets                                                       |
| Deployment | GitHub Actions *(Planned)*                                                             |

---

## 📱 Screens (Currently Implemented)

* ✅ Home Page with featured properties and search bar
* ✅ Property Details Page with image, description, and "Book Now"
* ✅ Booking Page with calendar and room summary
* ✅ Profile Page with basic user info
* ✅ Booking History Page
* 🛠️ Map View (Under Construction)
* 🛠️ Authentication Flow (Next Phase)

---

## 📂 Project Structure

```bash
lib/
├── main.dart
├── models/
├── screens/
│   ├── home/
│   │   ├── home_page.dart
│   │   └── property_card.dart
│   ├── booking/
│   │   ├── booking_page.dart
│   │   └── booking_history_page.dart
│   ├── profile/
│   │   └── profile_page.dart
│   └── property/
│       └── property_details_page.dart
├── services/
│   ├── firebase_service.dart
│   ├── payment_service.dart
│   └── map_service.dart *(planned)*
├── widgets/
│   └── custom_bottom_navigation_bar.dart
└── utils/
    └── theme.dart
```

---

## 🔧 Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/innsight.git
   cd innsight
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   * Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   * Enable Firebase Authentication and Firestore

4. **Enable Google Maps API**

   * Add your Google Maps API key in:

     * `android/app/src/main/AndroidManifest.xml`
     * `ios/Runner/AppDelegate.swift`

5. **Set up Razorpay**

   * Create a Razorpay developer account and generate API keys
   * Use [razorpay\_flutter](https://pub.dev/packages/razorpay_flutter) for integration

---

## 📌 Roadmap

* [x] Basic UI Screens (Home, Property Details, Booking)
* [x] Calendar Integration with Room Details
* [x] Booking History View
* [x] Bottom Navigation Integration
* [ ] Firebase Login Integration
* [ ] Map View Page
* [ ] Razorpay Payment Integration
* [ ] Admin Dashboard *(Web/Separate App)*

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋‍♂️ Author

**Ayush Kumar Singh**
📧 [ayushkrsngh2003@gmail.com](mailto:ayushkrsngh2003@gmail.com)
🔗 [LinkedIn](https://www.linkedin.com/in/ayush-kumar-singh-8b6b00249)
🔗 [GitHub](https://github.com/AyushKr2003)


---

<p align="center">
  Made with ❤️ using Flutter – <em>Powering seamless hotel booking experiences</em>
</p>


