# Aplikasi Informasi Kegiatan Kampus

## Informasi Pengembang
- **Mata Kuliah**: Pemrograman Mobile A
- **Nama**: Naufal Aulia Pratama
- **NIM**: H1D023046

## Deskripsi
Aplikasi ini dibuat menggunakan Flutter dan GetX untuk menampilkan informasi kegiatan kampus secara praktis. Pengguna dapat melihat daftar event, detail kegiatan, agenda mingguan, informasi panitia, hingga halaman tentang aplikasi. Navigasi dibuat sederhana menggunakan drawer dan seluruh transisi halaman dikontrol melalui GetX sehingga terasa ringan dan responsif.

## Arsitektur Aplikasi


### 1. Routing & Navigation
Routing diatur menggunakan `app_routes.dart` dan `app_pages.dart`. Nama rute seperti `/`, `/detail`, atau `/agenda` disimpan dalam konstanta sehingga mudah digunakan. Untuk berpindah halaman, cukup menggunakan `Get.toNamed(Routes.DETAIL, arguments: event)` dan kembali dengan `Get.back()`.

### 2. State Management
State management memanfaatkan GetxController. Misalnya pada `HomeController`, data event disimpan dalam variabel observable (`events.obs`) dan otomatis diperbarui di tampilan menggunakan widget `Obx`. Saat controller dijalankan, fungsi `loadEvents()` memuat daftar event dan langsung ditampilkan tanpa perlu memanggil `setState()`.

#### Contoh Controller
```dart
class HomeController extends GetxController {
  final events = <EventModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void loadEvents() {
    isLoading.value = true;
    events.assignAll([...]); // Data event
    isLoading.value = false;
  }
}
```

### 3. UI Components
Di bagian tampilan, data ini ditampilkan menggunakan `ListView.builder` dan dibungkus dalam `Obx` agar selalu sinkron dengan data di controller.

Widget utama yang digunakan untuk menampilkan event adalah `EventCard`. Di dalamnya terdapat tampilan gambar, judul, tanggal, dan deskripsi singkat. Widget ini juga menerima fungsi `onTap` untuk membuka halaman detail saat diklik.

#### Contoh Widget
```dart
class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const EventCard({required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(event.imageUrl, width: 92, height: 72, fit: BoxFit.cover),
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

## Fitur Aplikasi

### 1. Home Page
Menampilkan seluruh daftar kegiatan dalam bentuk kartu. Ketika salah satu kartu ditekan, pengguna diarahkan ke halaman Detail yang berisi informasi lengkap kegiatan menggunakan data dari `Get.arguments`.

### 2. Agenda Page
Aplikasi secara otomatis menampilkan kegiatan yang berlangsung dalam minggu ini. Logika penyaringan tanggal diatur di dalam controller khusus bernama `AgendaController`.

### 3. Contact Page
Menampilkan daftar panitia lengkap dengan jabatan dan kontak mereka.

### 4. About Page
Berisi informasi singkat mengenai aplikasi, versi, serta pengembang.

## Navigasi
Semua halaman utama dapat diakses melalui menu drawer yang ditampilkan di sisi kiri layar, sehingga pengguna dapat berpindah halaman dengan mudah tanpa kembali ke halaman awal.