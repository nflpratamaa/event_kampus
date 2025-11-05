# Aplikasi Informasi Kegiatan Kampus

**Tugas Pemrograman Mobile A**  
Nama: Naufal Aulia Pratama  
NIM: H1D023046  

Implementasi aplikasi informasi kegiatan kampus menggunakan Flutter dan GetX (Paket 6).

![Demo Aplikasi](screenshots/demo.gif)

## Fitur

- 📱 Daftar event kampus dengan gambar dan deskripsi
- 📅 Filter event minggu ini di halaman Agenda
- 👥 Informasi panitia dan kontak
- ℹ️ Halaman tentang aplikasi
- 🎯 Navigasi mudah dengan drawer
- 💫 Transisi halaman yang smooth dengan GetX

## Struktur Project

```
lib/
├── main.dart                 # Entry point aplikasi
├── app/
│   ├── routes/              # Konfigurasi routing
│   │   ├── app_pages.dart   # Definisi halaman
│   │   └── app_routes.dart  # Konstanta routes
│   ├── modules/             # Feature modules
│   │   ├── home/           # Halaman utama
│   │   ├── detail/         # Detail event
│   │   ├── agenda/         # Event minggu ini
│   │   ├── contact/        # Info kontak
│   │   └── about/          # Tentang aplikasi
│   └── widgets/            # Widget yang dapat digunakan ulang
│       └── event_card.dart # Card untuk menampilkan event
```

## Teknologi

- Flutter & Dart
- GetX untuk state management & navigasi
- Assets lokal untuk gambar
- Material Design

## Implementasi GetX

### 1. Routing dan Navigasi
GetX menyediakan navigasi yang powerful dan mudah digunakan:

```dart
// Di app_routes.dart - Definisi nama routes
class Routes {
  static const HOME = '/';
  static const DETAIL = '/detail';
  static const AGENDA = '/agenda';
  static const CONTACT = '/contact';
  static const ABOUT = '/about';
}

// Di app_pages.dart - Konfigurasi routes dan pages
class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.DETAIL, page: () => DetailPage()),
    // ... routes lainnya
  ];
}

// Penggunaan navigasi di aplikasi
Get.toNamed(Routes.DETAIL, arguments: event);  // Navigasi dengan parameter
Get.back();  // Kembali ke halaman sebelumnya
```

### 2. State Management
GetX memiliki state management reaktif yang powerful:

```dart
// Controller dengan observable state
class HomeController extends GetxController {
  // Observable variables dengan .obs
  final events = <EventModel>[].obs;
  final isLoading = false.obs;

  // Lifecycle hooks
  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void loadEvents() {
    isLoading.value = true;
    events.assignAll([
      EventModel(
        id: '1',
        title: 'Pekan Kreativitas Mahasiswa',
        date: DateTime.now(),
        // ... data lainnya
      ),
      // ... events lainnya
    ]);
    isLoading.value = false;
  }
}

// Penggunaan di UI dengan Obx
Obx(() => ListView.builder(
  itemCount: controller.events.length,
  itemBuilder: (context, index) {
    final event = controller.events[index];
    return EventCard(event: event);
  },
))
```

### 3. Dependency Injection
GetX menyediakan dependency injection yang simpel:

```dart
// Inject controller
final HomeController controller = Get.put(HomeController());

// Find controller yang sudah di-inject
final HomeController home = Get.find();
```

### 4. Custom Widgets
Widget kustom yang diimplementasikan:

```dart
// EventCard widget untuk menampilkan event
class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const EventCard({
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Gambar event
            Image.asset(
              event.imageUrl,
              width: 92,
              height: 72,
              fit: BoxFit.cover,
            ),
            // Informasi event
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title),
                  Text(event.date.toString()),
                  Text(event.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 5. Fitur per Halaman

#### Home Page (/)
- Menampilkan daftar event menggunakan `EventCard`
- Implementasi drawer untuk navigasi
- Menggunakan `HomeController` untuk state management

#### Detail Event (/detail)
- Menerima parameter event melalui `Get.arguments`
- Menampilkan informasi lengkap event
- Menggunakan `DetailController`

#### Agenda (/agenda)
- Filter event minggu ini menggunakan `AgendaController`
- Sharing state dengan `HomeController` menggunakan Get.find()

#### Contact (/contact)
- Menampilkan daftar panitia
- State management dengan `ContactController`

#### About (/about)
- Informasi aplikasi
- Menggunakan `AboutController` untuk data statis

### 6. Struktur Project
Struktur folder mengikuti standar GetX:
```
lib/
├── main.dart                 # GetMaterialApp setup
├── app/
│   ├── routes/              # Routing GetX
│   │   ├── app_pages.dart   # GetPage definitions
│   │   └── app_routes.dart  # Route names
│   ├── modules/             # Fitur modules
│   │   ├── home/           # Home page
│   │   │   ├── home_page.dart
│   │   │   └── home_controller.dart
│   │   └── ... 
│   └── widgets/            # Shared widgets
```

```dart
// Widget card yang dapat digunakan ulang
class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;
  
  // Tampilan card dengan gambar dan info event
}
```

## Cara Menjalankan

1. Clone repository ini
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Pastikan gambar event tersedia di:
   ```
   assets/images/
   ├── pkm.jpg
   ├── seminar.jpeg
   ├── debat.jpg
   └── workshop.jpeg
   ```
4. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Fitur per Halaman

### Home Page
- Menampilkan daftar event dalam bentuk card
- Setiap card berisi gambar, judul, tanggal, dan deskripsi singkat
- Tap card untuk melihat detail event

### Detail Event
- Gambar event full width
- Informasi lengkap event
- Tombol kembali ke halaman sebelumnya

### Agenda
- Menampilkan event yang berlangsung minggu ini
- Menggunakan filter tanggal otomatis
- Format yang sama dengan halaman Home

### Panitia & Kontak
- Daftar panitia dengan role
- Informasi kontak lengkap
- Layout list yang rapi

### Tentang Aplikasi
- Informasi versi aplikasi
- Deskripsi singkat
- Credit dan informasi pengembang

## Navigasi

Menggunakan drawer (menu samping) yang dapat diakses dari semua halaman utama:
- Home
- Agenda Minggu Ini
- Panitia & Kontak
- Tentang Aplikasi

## Screenshots

![Home Page](screenshots/home.png)
![Detail Event](screenshots/detail.png)
![Agenda](screenshots/agenda.png)
![Contacts](screenshots/contacts.png)

## Note
Gambar event disimpan lokal di folder assets/images dengan format .jpg/.jpeg untuk performa optimal.
