class LocationCoordinates{
  final String latitude;
  final String longitude;

  LocationCoordinates({
    required this.latitude,
    required this.longitude
  });
}

class LocationStreet{
  final String number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });
}

class LocationTimezone{
  final String description;
  final String offset;

  LocationTimezone({
    required this.description,
    required this.offset
  });
}

class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone
  });

  factory UserLocation.fromMap(Map<String,dynamic> json){
    final street = LocationStreet(number: json['street']['number'].toString(), name: json['street']['name']);
    final coordinates = LocationCoordinates(latitude: json['coordinates']['latitude'], longitude: json['coordinates']['longitude']);
    final timezone = LocationTimezone(description: json['timezone']['description'], offset: json['timezone']['offset']);
    return UserLocation(city: json['city'], state: json['state'], country: json['country'], postcode: json['postcode'].toString(), street: street, coordinates: coordinates, timezone: timezone);
  }
}