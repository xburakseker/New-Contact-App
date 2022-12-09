import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'name': 'Enter name',
          'number': 'Enter number',
          'done': 'Done',
          'contactsapp': 'Contact App',
          'language': 'Change Language',
          'eng': 'English',
        },
        'de_DE': {
          'name': 'Name eingeben',
          'number': 'Nummer eingeben',
          'done': 'Fertig',
          'contactsapp': 'Kontakte App',
          'language': 'Sprache ändern',
          'eng': 'Deutsch',
        },
        'tr_TR': {
          'name': 'İsim Giriniz',
          'number': 'Numara Giriniz',
          'done': 'Bitti',
          'contactsapp': 'Rehber Uygulaması',
          'language': 'Dili Değiştir',
          'eng': 'Türkçe',
        }
      };
}
