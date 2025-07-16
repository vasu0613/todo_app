# 📝 Trackory

---

**Trackory** is a sleek and efficient to-do app built with **Flutter**, designed to elevate productivity with seamless task management, local data storage via Hive, and a visually engaging interface that adapts to system themes.

---

## 🚀 Features

- 🧠 **Task Management** – Add, delete, and mark tasks as complete.
- 📦 **Hive Storage** – Fast, secure, and persistent local data storage.
- 🌗 **System-Based Theming** – Follows light/dark mode based on OS settings.
- 💅 **Gradient & Font Styling** – Beautiful typography and gradient effects for polished UI.
- ✨ **Animated Experience** – Lottie animations for dynamic interactions.
- 📤 **Swipe Actions** – Slidable task tiles for intuitive control.

---

## 📱 Screenshots

### Splash Screen
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/9ad7dce8-2b18-4ef4-a7b0-7f0902df8955" />

### Home Screen(Empty)
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/7c3f9773-9573-481f-9690-174348c54625" />

### Home Screen(Tasks)
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/6dde031a-6c2d-4c87-ba70-20f7ad21c26c" />

### Adding Tasks
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/6102ccaf-62ff-4180-a01f-4146222e6329" />

### Marking Task(Done)
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/e08dcb64-7b0d-48f1-bc20-03aed3dce571" />

### Deleting Task
<img width="672" height="1496" alt="image" src="https://github.com/user-attachments/assets/6fc263b6-54f1-4e54-8436-31a0ef1bef73" />

---

## 🛠️ Packages Used

| Package                  | Purpose                                                  |
|--------------------------|----------------------------------------------------------|
| `hive`                   | NoSQL database for fast local storage                    |
| `hive_flutter`           | Flutter bindings for Hive                                |
| `flutter_slidable`       | Swipeable task tiles (e.g. delete/edit via swipe)        |
| `lottie`                 | Lightweight animations for playful task transitions      |
| `google_fonts`           | Stylish custom fonts                                     |
| `simple_gradient_text`   | Gradient text effects for headers and titles             |

---

## 📦 Setup

```bash
git clone https://github.com/yourusername/trackory.git
cd trackory
flutter pub get
```

---

## 🧠 Hive Initialization

```dart
void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}
```

---

## 🎨 Dynamic Theme Integration

```dart
MaterialApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system,
);
```

---

## 🖌️ UI Flair

- Use `GoogleFonts.lato()` or any font from Google Fonts for your custom typography.
- Add gradient styling like:

```dart
GradientText(
  'T R A C K O R Y',
  style: GoogleFonts.inter(
    textStyle: TextStyle(fontSize: 40),
    fontWeight: FontWeight.bold,
  ),
  colors: [
    Theme.of(context).colorScheme.onTertiary,
    Theme.of(context).colorScheme.tertiaryFixed,
  ],
  textAlign: TextAlign.center,
),
```

- Add playful Lottie animations on splash or empty task screens.

---

## 📂 Folder Structure

```
lib/
├── data/
│   └── database.dart
├── theme/
│   └── theme.dart
├── screens/
│   └── home_screen.dart
│   └── splasc_screen.dart
├── widgets/
│   └── todo_tile.dart
│   └── button.dart
│   └── dialog_box.dart
└── main.dart
```

---

## ✍️ Author

Created with ❤️ by **Vatsal**  
Trackory – for those who like their goals tracked with style.

---
