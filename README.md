Certainly! Below is a **GitHub README** for your project. This README provides an overview of the project, its features, setup instructions, and usage details. You can copy and paste this into a `README.md` file in your project repository.

---

# Live Location Tracker with OpenStreetMap

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![OpenStreetMap](https://img.shields.io/badge/OpenStreetMap-%237EBC6F.svg?style=for-the-badge&logo=OpenStreetMap&logoColor=white)

A Flutter application that tracks the user's live location and displays it on a map using **OpenStreetMap**. The app also allows users to set a destination and fetches the route between the current location and the destination using the **OSRM API**.

---

## Features

- **Live Location Tracking**: Continuously tracks the user's location and updates the map in real-time.
- **Destination Search**: Allows users to search for a destination using the **OpenStreetMap Nominatim API**.
- **Route Display**: Fetches and displays the route between the current location and the destination using the **OSRM API**.
- **Interactive Map**: Uses `flutter_map` for a highly customizable and interactive map experience.
- **Permissions Handling**: Ensures proper handling of location permissions using `permission_handler` and `location` packages.

---

## Screenshots

| Live Location Tracking | Destination Search | Route Display |
|------------------------|--------------------|---------------|
| ![Live Location](screenshots/live_location.png) | ![Destination Search](screenshots/destination_search.png) | ![Route Display](screenshots/route_display.png) |

---

## Prerequisites

Before running the project, ensure you have the following installed:

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **VS Code**: For development and debugging.
- **Android Emulator** or **Physical Device**: To run the app.

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/live-location-tracker.git
cd live-location-tracker
```

### 2. Install Dependencies

Run the following command to install all the required dependencies:

```bash
flutter pub get
```

### 3. Configure API Keys

This project uses the following APIs:
- **OpenStreetMap Nominatim API**: For geocoding (converting location names to coordinates).
- **OSRM API**: For fetching routes between two points.

No API keys are required for these services, as they are free and open-source.

### 4. Run the App

Connect your device or start an emulator, then run:

```bash
flutter run
```

---

## Project Structure

```
lib/
├── main.dart                # Entry point of the application
├── screens/
│   └── map_screen.dart      # Main screen with map and location tracking
└── widgets/                 # Custom widgets (if any)
```

---

## Dependencies

This project uses the following packages:

- **[flutter_map](https://pub.dev/packages/flutter_map)**: For displaying the OpenStreetMap.
- **[geolocator](https://pub.dev/packages/geolocator)**: For accessing the device's location.
- **[location](https://pub.dev/packages/location)**: For handling location permissions.
- **[permission_handler](https://pub.dev/packages/permission_handler)**: For managing runtime permissions.
- **[http](https://pub.dev/packages/http)**: For making API requests to Nominatim and OSRM.
- **[latlong2](https://pub.dev/packages/latlong2)**: For handling latitude and longitude coordinates.

---

## How It Works

1. **Live Location Tracking**:
   - The app uses the `geolocator` package to fetch the user's current location and updates the map in real-time.

2. **Destination Search**:
   - Users can search for a destination using the OpenStreetMap Nominatim API. The app fetches the coordinates of the destination and adds a marker to the map.

3. **Route Display**:
   - The app uses the OSRM API to fetch the route between the user's current location and the destination. The route is displayed as a polyline on the map.

4. **Permissions**:
   - The app ensures that location permissions are granted before accessing the device's location.

---

## Contributing

Contributions are welcome! If you find any issues or want to add new features, feel free to open a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- **OpenStreetMap**: For providing free and open-source map data.
- **OSRM**: For the open-source routing service.
- **Flutter Community**: For maintaining the awesome packages used in this project.

---

## Support

If you find this project helpful, consider giving it a ⭐️ on GitHub!

---

Feel free to customize this README to better suit your project. Let me know if you need further assistance! 🚀
