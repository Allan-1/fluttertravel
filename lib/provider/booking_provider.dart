import 'package:flutter/foundation.dart';

import '../models/hotelbooking_model.dart';

class BookingList extends ChangeNotifier{
  final List<HotelBooking> _booking = [];

  List<HotelBooking> get bookings => _booking;

  void addBooking(HotelBooking booking){
    _booking.add(booking);
    notifyListeners();
  }

  void removeBooking(HotelBooking booking){
    _booking.remove(booking);
    notifyListeners();
  }
}