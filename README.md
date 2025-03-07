# 🚀 Live Location Tracker with OpenStreetMap

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![OpenStreetMap](https://img.shields.io/badge/OpenStreetMap-%237EBC6F.svg?style=for-the-badge&logo=OpenStreetMap&logoColor=white)

Welcome to the **Live Location Tracker**! This Flutter app tracks your live location, lets you set a destination, and draws the route between the two points using **OpenStreetMap** and **OSRM API**. It's like Google Maps, but cooler (and open-source)! 🌍

---

```plaintext
  _______ _                 _          _____ _             _    
 |__   __| |               | |        / ____| |           | |   
    | |  | | ___  ___ _ __ | |_ ___  | (___ | |_ __ _ _ __| | __
    | |  | |/ _ \/ _ \ '_ \| __/ __|  \___ \| __/ _` | '__| |/ /
    | |  | |  __/  __/ | | | |_\__ \  ____) | || (_| | |  |   < 
    |_|  |_|\___|\___|_| |_|\__|___/ |_____/ \__\__,_|_|  |_|\_\
```

---

## 🎯 Features

- **📍 Live Location Tracking**: Know where you are, always! (Unless you’re in a cave. 🦇)
- **🔍 Destination Search**: Find your next adventure using OpenStreetMap’s Nominatim API.
- **🛣️ Route Display**: Get the best route from your current location to your destination, courtesy of OSRM.
- **🗺️ Interactive Map**: Zoom, pan, and explore the world with `flutter_map`.
- **🔒 Permissions Handling**: No sneaky location access—everything’s transparent and permission-based.

---

## 🛠️ Prerequisites

Before diving in, make sure you have:

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **VS Code**: For coding magic. ✨
- **Android Emulator** or **Physical Device**: To see the app in action.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/live-location-tracker.git
cd live-location-tracker
```

### 2. Install Dependencies

Run this command to get all the dependencies:

```bash
flutter pub get
```

### 3. Run the App

Fire up your emulator or connect your device, then run:

```bash
flutter run
```

---

## 🧩 How It Works

### 1. **Live Location Tracking**
   - The app uses the `geolocator` package to fetch your current location and updates the map in real-time. It’s like having a personal GPS in your pocket! 📱

### 2. **Destination Search**
   - Want to go somewhere? Type in the destination, and the app fetches its coordinates using the **OpenStreetMap Nominatim API**. A marker is added to the map so you know where you’re headed. 🎯

### 3. **Route Display**
   - The app uses the **OSRM API** to calculate the best route between your current location and the destination. The route is displayed as a blue line on the map. Follow the line, and you’ll never get lost! 🛤️

### 4. **Permissions**
   - The app ensures you’re in control. It asks for location permissions before accessing your device’s location. No shady business here! 🔒

---

## 🛠️ Project Structure

```plaintext
lib/
├── main.dart                # The heart of the app
├── screens/
│   └── map_screen.dart      # Where the magic happens (map + location tracking)
└── widgets/                 # Custom widgets (if any)
```

---

## 📦 Dependencies

This project uses the following packages:

- **[flutter_map](https://pub.dev/packages/flutter_map)**: For displaying OpenStreetMap.
- **[geolocator](https://pub.dev/packages/geolocator)**: For accessing the device’s location.
- **[location](https://pub.dev/packages/location)**: For handling location permissions.
- **[permission_handler](https://pub.dev/packages/permission_handler)**: For managing runtime permissions.
- **[http](https://pub.dev/packages/http)**: For making API requests to Nominatim and OSRM.
- **[latlong2](https://pub.dev/packages/latlong2)**: For handling latitude and longitude coordinates.

---

## 🤝 Contributing

Want to make this project even better? Here’s how you can help:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## 📜 License

This project is licensed under the **MIT License**. Feel free to use, modify, and share it! See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **OpenStreetMap**: For providing free and open-source map data. You rock! 🌍
- **OSRM**: For the open-source routing service. You’re the real MVP! 🏆
- **Flutter Community**: For maintaining the awesome packages used in this project. Keep up the great work! 🚀

---

## 💬 Support

If you find this project helpful, give it a ⭐️ on GitHub! And if you have any questions or suggestions, feel free to open an issue. Let’s build something amazing together! 🚀

---

```plaintext
  _____ _                 _ _ 
 |_   _| |__   __ _ _ __| | |
   | | | '_ \ / _` | '__| | |
   | | | | | | (_| | |  |_|_|
   |_| |_| |_|\__,_|_|  (_|_)
```

---

Enjoy tracking your location like a pro! 🎉
