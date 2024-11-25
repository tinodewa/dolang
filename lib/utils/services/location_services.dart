import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LocationServices {
  /// Memastikan class ini tidak bisa diinstansiasi
  LocationServices._();

  /// Singleton instance
  static final LocationServices _repository = LocationServices._();

  /// Factory method to get the singleton instance
  factory LocationServices() {
    return _repository;
  }

  static Stream<ServiceStatus> streamService =
      Geolocator.getServiceStatusStream();

  late Position position;

  late bool? locationEnabled = false;

  /// Mendapatkan informasi lokasi
  Future<LocationResult> getCurrentPosition() async {
    /// Apakah layanan lokasi aktif?
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /// Jika tidak, kirim pesan error
      return LocationResult.error(message: 'Location service not enabled'.tr);
    }

    /// Cek izin lokasi
    LocationPermission permission = await Geolocator.checkPermission();

    /// Apakah izin lokasi ditolak
    if (permission == LocationPermission.denied) {
      /// Jika  tidak, minta izin
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// Jika izin ditolak, kirim pesan error
        return LocationResult.error(
            message: 'Location permission not granted'.tr);
      }
    }

    /// Apakah izin lokasi ditolak selamanya
    if (permission == LocationPermission.deniedForever) {
      /// Jika ya, kirim pesan error
      return LocationResult.error(
          message: 'Location permission not granted forever'.tr);
    }

    /// Jika izin lokasi diberikan, ambil lokasi

    try {
      position = await Geolocator.getCurrentPosition();
      locationEnabled = true;
    } catch (exception, stackTrace) {
      /// Jika gagal mendapatkan lokasi, kirim pesan error
      Sentry.captureException(exception, stackTrace: stackTrace);
      locationEnabled = false;
      return LocationResult.error(message: 'Location service not enabled'.tr);
    }

    /// Ambil informasi lokasi
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      /// Jika tidak ada informasi lokasi, kirim pesan error
      return LocationResult.error(message: 'Location not found'.tr);
    } else {
      /// Jika ada informasi lokasi, kirim informasi lokasi
      return LocationResult.success(
        position: position,
        addressFull: [
          placemarks.first.name,
          placemarks.first.locality,
          placemarks.first.subAdministrativeArea,
          placemarks.first.administrativeArea,
          placemarks.first.country,
        ].where((e) => e != null).join(', '),
        addressShort: [
          placemarks.first.locality,
          placemarks.first.subAdministrativeArea,
        ].where((e) => e != null).join(', '),
      );
    }
  }

  /// Get distance between two points
  double getDistanceBetween(
      {required double endLatitude, required double endLongitude}) {
    return Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      endLatitude,
      endLongitude,
    );
  }
}

class LocationResult {
  final bool success;
  final Position? position;
  final String? addressFull;
  final String? addressShort;
  final String? message;

  LocationResult({
    required this.success,
    this.position,
    this.addressFull,
    this.addressShort,
    this.message,
  });

  factory LocationResult.success(
      {required Position position, required String addressFull, addressShort}) {
    return LocationResult(
      success: true,
      position: position,
      addressFull: addressFull,
      addressShort: addressShort,
    );
  }

  factory LocationResult.error({required String message}) {
    return LocationResult(
      success: false,
      message: message,
    );
  }
}
