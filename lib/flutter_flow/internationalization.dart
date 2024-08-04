import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'uk', 'ru'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ukText = '',
    String? ruText = '',
  }) =>
      [enText, ukText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'ubnscupp': {
      'en': 'Flights',
      'ru': 'Рейсы',
      'uk': 'Авіарейси',
    },
    'atvc6iqr': {
      'en': 'Aircraft',
      'ru': 'Самолет',
      'uk': 'Літак',
    },
    'pjg1bqqz': {
      'en': 'Airports',
      'ru': 'Аэропорты',
      'uk': 'Аеропорти',
    },
    'at9l86kl': {
      'en': 'Users',
      'ru': 'Пользователи',
      'uk': 'Користувачі',
    },
    'ehv5p6gs': {
      'en': 'Finances',
      'ru': 'Финансы',
      'uk': 'Фінанси',
    },
    '6mev8r9u': {
      'en': 'Dashboard',
      'ru': 'Панель приборов',
      'uk': 'Панель приладів',
    },
  },
  // Auth1
  {
    '48nprh5c': {
      'en': 'Sign In',
      'ru': 'Войти',
      'uk': 'Увійти',
    },
    'rarnkde6': {
      'en': 'Let\'s get started by filling out the form below.',
      'ru': 'Давайте начнем с заполнения формы ниже.',
      'uk': 'Давайте почнемо, заповнивши форму нижче.',
    },
    '69fbpcfe': {
      'en': 'Email',
      'ru': 'Электронная почта',
      'uk': 'Електронна пошта',
    },
    'yyzf0rz1': {
      'en': 'Password',
      'ru': 'Пароль',
      'uk': 'Пароль',
    },
    's21bf2z0': {
      'en': 'Sign In',
      'ru': 'Войти',
      'uk': 'Увійти',
    },
    'oeefxtqu': {
      'en': 'Forgot Password',
      'ru': 'Забыли пароль',
      'uk': 'Забули пароль',
    },
    'cyjs70hb': {
      'en': 'Or sign up with',
      'ru': 'Или зарегистрируйтесь с помощью',
      'uk': 'Або зареєструйтесь у',
    },
    '2ekw4tiz': {
      'en': 'Continue with Google',
      'ru': 'Продолжить с Google',
      'uk': 'Продовжуйте з Google',
    },
    't9hip06w': {
      'en': 'Continue with Apple',
      'ru': 'Продолжить с Apple',
      'uk': 'Продовжуйте з Apple',
    },
    'lumlotd6': {
      'en': 'Sign Up',
      'ru': 'Зарегистрироваться',
      'uk': 'Зареєструватися',
    },
    'm6zyfa64': {
      'en': 'Let\'s get started by filling out the form below.',
      'ru': 'Давайте начнем с заполнения формы ниже.',
      'uk': 'Давайте почнемо, заповнивши форму нижче.',
    },
    'sgj8wzmt': {
      'en': 'Email',
      'ru': 'Электронная почта',
      'uk': 'Електронна пошта',
    },
    'e5qtb9l4': {
      'en': 'Password',
      'ru': 'Пароль',
      'uk': 'Пароль',
    },
    's4i34zmi': {
      'en': 'Confirm Password',
      'ru': 'Подтвердите пароль',
      'uk': 'Підтвердьте пароль',
    },
    'o1vax8m3': {
      'en': 'Create Account',
      'ru': 'Зарегистрироваться',
      'uk': 'Створити акаунт',
    },
    'f5kpe3rz': {
      'en': 'Or sign up with',
      'ru': 'Или зарегистрируйтесь с помощью',
      'uk': 'Або зареєструйтесь у',
    },
    '7ig21is0': {
      'en': 'Continue with Google',
      'ru': 'Продолжить с Google',
      'uk': 'Продовжуйте з Google',
    },
    'fkx2d4nk': {
      'en': 'Continue with Apple',
      'ru': 'Продолжить с Apple',
      'uk': 'Продовжуйте з Apple',
    },
    'ces97de0': {
      'en': 'Home',
      'ru': 'Дом',
      'uk': 'додому',
    },
  },
  // FlightsScreen
  {
    '33avkdr7': {
      'en': 'Flights',
      'ru': 'Рейсы',
      'uk': 'Авіарейси',
    },
    '930xfzto': {
      'en': 'Flight Number: AA123',
      'ru': 'Номер рейса: AA123',
      'uk': 'Номер рейсу: AA123',
    },
    '3k6ixj1v': {
      'en': 'Departure: JFK',
      'ru': 'Вылет: JFK',
      'uk': 'Відправлення: JFK',
    },
    'ngef5qq4': {
      'en': 'Arrival: LAX',
      'ru': 'Прибытие: Лос-Анджелес',
      'uk': 'Прибуття: LAX',
    },
    '4oz8nq8k': {
      'en': 'Time: 10:00 AM - 1:00 PM',
      'ru': 'Время: 10:00 - 13:00',
      'uk': 'Час: 10:00 - 13:00',
    },
    '2mezuz7t': {
      'en': 'Flight Number: UA456',
      'ru': 'Номер рейса: UA456',
      'uk': 'Номер рейсу: UA456',
    },
    'phidchgx': {
      'en': 'Departure: SFO',
      'ru': 'Отправление: Сан-Франциско',
      'uk': 'Відправлення: SFO',
    },
    'ul2qb3y5': {
      'en': 'Arrival: ORD',
      'ru': 'Прибытие: ЗАКАЗАТЬ',
      'uk': 'Прибуття: ОРД',
    },
    'ggm0rq9a': {
      'en': 'Time: 11:00 AM - 4:00 PM',
      'ru': 'Время: 11:00 - 16:00',
      'uk': 'Час: 11:00 - 16:00',
    },
    'e5ur803i': {
      'en': 'Flight Number: DL789',
      'ru': 'Номер рейса: DL789',
      'uk': 'Номер рейсу: DL789',
    },
    'nhd5zbj4': {
      'en': 'Departure: ATL',
      'ru': 'Отправление: АТЛ',
      'uk': 'Відправлення: ATL',
    },
    'hguinjts': {
      'en': 'Arrival: MIA',
      'ru': 'Прибытие: Пропал без вести',
      'uk': 'Прибуття: МВС',
    },
    '8ntbed8j': {
      'en': 'Time: 2:00 PM - 5:00 PM',
      'ru': 'Время: 14:00 - 17:00',
      'uk': 'Час: 14:00 - 17:00',
    },
    '88rb55zh': {
      'en': 'New Flight',
      'ru': 'Новый рейс',
      'uk': 'Новий рейс',
    },
    'scvloreb': {
      'en': 'Page Title',
      'ru': 'Заголовок страницы',
      'uk': 'Назва сторінки',
    },
  },
  // AirportsScreen
  {
    'ycverw1h': {
      'en': 'Airports',
      'ru': 'Аэропорты',
      'uk': 'Аеропорти',
    },
    'o3ss27by': {
      'en': 'Search airports...',
      'ru': 'Поиск аэропортов...',
      'uk': 'Пошук аеропортів...',
    },
    'cwl3vecu': {
      'en': 'Airport 1',
      'ru': 'Аэропорт 1',
      'uk': 'Аеропорт 1',
    },
    'lwur39yd': {
      'en': 'Location 1',
      'ru': 'Местоположение 1',
      'uk': 'Розташування 1',
    },
    'ism5x7ya': {
      'en': 'Airport 2',
      'ru': 'Аэропорт 2',
      'uk': 'Аеропорт 2',
    },
    'd0x1lxzd': {
      'en': 'Location 2',
      'ru': 'Местоположение 2',
      'uk': 'Розташування 2',
    },
    'f0o15icz': {
      'en': 'Airport 3',
      'ru': 'Аэропорт 3',
      'uk': 'Аеропорт 3',
    },
    '1tyjm0tw': {
      'en': 'Location 3',
      'ru': 'Местоположение 3',
      'uk': 'Розташування 3',
    },
    '77bvawme': {
      'en': 'Airport 4',
      'ru': 'Аэропорт 4',
      'uk': 'Аеропорт 4',
    },
    'cmlg58nq': {
      'en': 'Location 4',
      'ru': 'Расположение 4',
      'uk': 'Розташування 4',
    },
    '0jlqv0z7': {
      'en': 'Airport 5',
      'ru': 'Аэропорт 5',
      'uk': 'Аеропорт 5',
    },
    '4c5393lm': {
      'en': 'Location 5',
      'ru': 'Местоположение 5',
      'uk': 'Розташування 5',
    },
  },
  // UsersScreen
  {
    'hlqsyihq': {
      'en': 'Card Header',
      'ru': 'Заголовок карты',
      'uk': 'Заголовок картки',
    },
    'b3k0dq0t': {
      'en': 'Create tables and ui elements that work below.',
      'ru':
          'Создайте таблицы и элементы пользовательского интерфейса, которые будут работать ниже.',
      'uk': 'Створюйте таблиці та елементи інтерфейсу, які працюють нижче.',
    },
    'x92phkug': {
      'en': 'ID',
      'ru': 'ИДЕНТИФИКАТОР',
      'uk': 'ID',
    },
    'qrcxvkjc': {
      'en': 'User Information',
      'ru': 'информация о пользователе',
      'uk': 'Інформація про користувача',
    },
    '5zl6211c': {
      'en': 'Date Created',
      'ru': 'Дата создания',
      'uk': 'Дата створення',
    },
    'u3v5n15h': {
      'en': 'Last Active',
      'ru': 'Последнее посещение',
      'uk': 'Останній активний',
    },
    'ms7u1xn2': {
      'en': 'Status',
      'ru': 'Положение дел',
      'uk': 'Статус',
    },
    'kvzosebw': {
      'en': 'Actions',
      'ru': 'Действия',
      'uk': 'Дії',
    },
    'pn6mi6z1': {
      'en': '#2424',
      'ru': '#2424',
      'uk': '#2424',
    },
    'wpa9irbr': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    'tmdawc3v': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    'hl5vs5tq': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    'tpup3oj1': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    '8bb6uvx7': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    '6fni21ft': {
      'en': '#2427',
      'ru': '#2427',
      'uk': '#2427',
    },
    '7u8rliqt': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    '22rnni0p': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    '4otcof90': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    '6efpy8q7': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    'ou7nu5fj': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    '6bc7qby9': {
      'en': '#2424',
      'ru': '#2424',
      'uk': '#2424',
    },
    'yr19y1hp': {
      'en': 'Randy Peterson',
      'ru': 'Рэнди Петерсон',
      'uk': 'Ренді Петерсон',
    },
    'ldzwj01f': {
      'en': 'randy.p@domainname.com',
      'ru': 'randy.p@domainname.com',
      'uk': 'randy.p@domainname.com',
    },
    'x9fs6nnv': {
      'en': 'Jan. 20th, 2023',
      'ru': '20 января 2023 г.',
      'uk': '20 січня 2023 р',
    },
    'jj7cw8wf': {
      'en': 'A few moments ago',
      'ru': 'Несколько минут назад',
      'uk': 'Кілька хвилин тому',
    },
    'qwvz0zjd': {
      'en': 'Active',
      'ru': 'Активный',
      'uk': 'Активний',
    },
    'rax3fvso': {
      'en': '#2424',
      'ru': '',
      'uk': '',
    },
    'jw5dzaq6': {
      'en': 'Randy Peterson',
      'ru': '',
      'uk': '',
    },
    'ff52jei6': {
      'en': 'randy.p@domainname.com',
      'ru': '',
      'uk': '',
    },
    'xyaq9bzc': {
      'en': 'Jan. 20th, 2023',
      'ru': '',
      'uk': '',
    },
    '3t8s51ol': {
      'en': 'A few moments ago',
      'ru': '',
      'uk': '',
    },
    'rgzytj1i': {
      'en': 'Active',
      'ru': '',
      'uk': '',
    },
    '9eqq5700': {
      'en': '#2424',
      'ru': '',
      'uk': '',
    },
    '8ri72pxe': {
      'en': 'Randy Peterson',
      'ru': '',
      'uk': '',
    },
    '8v4mww1a': {
      'en': 'randy.p@domainname.com',
      'ru': '',
      'uk': '',
    },
    'ng279fsn': {
      'en': 'Jan. 20th, 2023',
      'ru': '',
      'uk': '',
    },
    'g3p65esd': {
      'en': 'A few moments ago',
      'ru': '',
      'uk': '',
    },
    'gatkzpt4': {
      'en': 'Active',
      'ru': '',
      'uk': '',
    },
    '7f8sn4s9': {
      'en': '#2424',
      'ru': '',
      'uk': '',
    },
    'pz7620vn': {
      'en': 'Randy Peterson',
      'ru': '',
      'uk': '',
    },
    'yywxg9ut': {
      'en': 'randy.p@domainname.com',
      'ru': '',
      'uk': '',
    },
    'p0fc74wp': {
      'en': 'Jan. 20th, 2023',
      'ru': '',
      'uk': '',
    },
    'aa7s4zis': {
      'en': 'A few moments ago',
      'ru': '',
      'uk': '',
    },
    'k4driaw1': {
      'en': 'Active',
      'ru': '',
      'uk': '',
    },
    'fedm4amy': {
      'en': '#2424',
      'ru': '',
      'uk': '',
    },
    'o0mn31gx': {
      'en': 'Randy Peterson',
      'ru': '',
      'uk': '',
    },
    'hjx0vsj8': {
      'en': 'randy.p@domainname.com',
      'ru': '',
      'uk': '',
    },
    'w3aktx78': {
      'en': 'Jan. 20th, 2023',
      'ru': '',
      'uk': '',
    },
    '4abbiq9w': {
      'en': 'A few moments ago',
      'ru': '',
      'uk': '',
    },
    'dmxrwrth': {
      'en': 'Active',
      'ru': '',
      'uk': '',
    },
    'ymtvw6k3': {
      'en': 'Users',
      'ru': 'Пользователи',
      'uk': 'Користувачі',
    },
  },
  // AircraftScreen
  {
    'm8lkp3nw': {
      'en': 'Aircraft Screen',
      'ru': 'Экран самолета',
      'uk': 'Екран літака',
    },
    'tbqawwwo': {
      'en': 'New Aircraft',
      'ru': 'Новый самолет',
      'uk': 'Новий літак',
    },
    '2te2vghj': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    'vyxvaq86': {
      'en': 'Boeing 737',
      'ru': 'Боинг 737',
      'uk': 'Боїнг 737',
    },
    'm999vxzv': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    'i9upebwv': {
      'en': 'N12345',
      'ru': 'N12345',
      'uk': 'N12345',
    },
    'nb3iaas1': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    'a0m9xkb3': {
      'en': '180',
      'ru': '180',
      'uk': '180',
    },
    'qcjxljp3': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    'zf984rie': {
      'en': 'Airbus A320',
      'ru': 'Аэробус А320',
      'uk': 'Airbus A320',
    },
    '168ee45f': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    'epxfksko': {
      'en': 'N54321',
      'ru': 'N54321',
      'uk': 'N54321',
    },
    '09p51le6': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    'apvlsmw4': {
      'en': '150',
      'ru': '150',
      'uk': '150',
    },
    'ja91c268': {
      'en': 'Aircraft Model',
      'ru': 'Модель самолета',
      'uk': 'Модель літака',
    },
    's13p09ly': {
      'en': 'Boeing 747',
      'ru': 'Боинг 747',
      'uk': 'Боїнг 747',
    },
    '18hccsxo': {
      'en': 'Registration No.',
      'ru': 'Номер регистрации.',
      'uk': 'реєстраційний номер',
    },
    '2u1wwiga': {
      'en': 'N67890',
      'ru': 'N67890',
      'uk': 'N67890',
    },
    'raioofgy': {
      'en': 'Capacity',
      'ru': 'Емкость',
      'uk': 'Ємність',
    },
    '1npy4wlu': {
      'en': '400',
      'ru': '400',
      'uk': '400',
    },
  },
  // FinancesScreen
  {
    'g4pyx0du': {
      'en': 'Financial Overview',
      'ru': 'Финансовый обзор',
      'uk': 'Фінансовий огляд',
    },
    'k2wfw4gc': {
      'en': 'Income',
      'ru': '',
      'uk': '',
    },
    '5xe88f45': {
      'en': 'Expenses',
      'ru': '',
      'uk': '',
    },
    'adxgeb9p': {
      'en': 'Generate Report',
      'ru': 'Создать отчет',
      'uk': 'Створити звіт',
    },
  },
  // FlightDetailsScreen
  {
    '84954yz3': {
      'en': 'Flight Details',
      'ru': 'Детали полета',
      'uk': 'Деталі польоту',
    },
    'tui6ldek': {
      'en': 'Flight Number',
      'ru': 'Номер рейса',
      'uk': 'Номер рейсу',
    },
    '5daw7eig': {
      'en': 'FL1234',
      'ru': 'FL1234',
      'uk': 'FL1234',
    },
    'zgm9kod2': {
      'en': 'Departure: JFK Airport',
      'ru': 'Вылет: Аэропорт имени Джона Кеннеди',
      'uk': 'Відправлення: аеропорт JFK',
    },
    'iziqg7wx': {
      'en': 'Arrival: LAX Airport',
      'ru': 'Прибытие: Аэропорт Лос-Анджелеса',
      'uk': 'Прибуття: аеропорт LAX',
    },
    '48ho5cq8': {
      'en': 'Departure Date: 08 Dec 2023, 9:40am',
      'ru': 'Дата отправления: 08 декабря 2023 г., 9:40 утра',
      'uk': 'Дата відправлення: 08 грудня 2023 р. 9:40',
    },
    '73t0ufw9': {
      'en': 'Arrival Date: 08 Dec 2023, 12:30pm',
      'ru': 'Дата прибытия: 08 декабря 2023 г., 12:30',
      'uk': 'Дата прибуття: 08.12.2023, 12:30',
    },
    'sulffwch': {
      'en': 'Aircraft Model: Boeing 737',
      'ru': 'Модель самолета: Boeing 737',
      'uk': 'Модель літака: Boeing 737',
    },
    'h6vkr6xu': {
      'en': 'Registration Number: N12345',
      'ru': 'Регистрационный номер: N12345',
      'uk': 'Реєстраційний номер: N12345',
    },
    '2ebjpjyd': {
      'en': 'Pilot: John Doe',
      'ru': 'Пилот: Джон Доу',
      'uk': 'Пілот: Джон Доу',
    },
    'bsvnyjjx': {
      'en': 'License: ABC123456',
      'ru': 'Лицензия: ABC123456',
      'uk': 'Ліцензія: ABC123456',
    },
    'mt42u8uo': {
      'en': 'Flight Status: Scheduled',
      'ru': 'Статус рейса: запланирован',
      'uk': 'Статус рейсу: за розкладом',
    },
    'bittgona': {
      'en': 'Passengers:',
      'ru': 'Пассажиры:',
      'uk': 'Пасажири:',
    },
    'oik01izs': {
      'en': '1. Alice Smith',
      'ru': '1. Элис Смит',
      'uk': '1. Еліс Сміт',
    },
    '2qohjngi': {
      'en': '2. Bob Johnson',
      'ru': '2. Боб Джонсон',
      'uk': '2. Боб Джонсон',
    },
    'edsm78qw': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
  },
  // AircraftDetailsScreen
  {
    'qwmcgxdh': {
      'en': 'Aircraft Details',
      'ru': 'Подробности о самолете',
      'uk': 'Деталі літака',
    },
    'j20s2lqu': {
      'en': 'Model: Boeing 737',
      'ru': 'Модель: Боинг 737',
      'uk': 'Модель: Boeing 737',
    },
    'pvzkgney': {
      'en': 'Registration Number: N12345',
      'ru': 'Регистрационный номер: N12345',
      'uk': 'Реєстраційний номер: N12345',
    },
    'yn3azb0w': {
      'en': 'Capacity: 180',
      'ru': 'Вместимость: 180',
      'uk': 'Місткість: 180',
    },
    'l3um3x4x': {
      'en': 'Maintenance History:',
      'ru': 'История обслуживания:',
      'uk': 'Історія технічного обслуговування:',
    },
    'zzyk8bqj': {
      'en':
          '1. 01/01/2023 - Engine Check\\n2. 01/06/2023 - Tire Replacement\\n3. 01/12/2023 - Oil Change',
      'ru':
          '1. 01/01/2023 - Проверка двигателя\\n2. 01/06/2023 - Замена шин\\n3. 01/12/2023 - Замена масла',
      'uk':
          '1. 01.01.2023 - Перевірка двигуна\\n2. 06.01.2023 - Заміна шин\\n3. 12.01.2023 - Заміна масла',
    },
    'jn2517ak': {
      'en': 'Other Details:',
      'ru': 'Другие детали:',
      'uk': 'Інші деталі:',
    },
    'bwwouhic': {
      'en': 'This aircraft is primarily used for domestic flights.',
      'ru': 'Этот самолет в основном используется для внутренних рейсов.',
      'uk': 'Цей літак в основному використовується для внутрішніх рейсів.',
    },
    'mgnnh5h7': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
    'veeh70z6': {
      'en': 'Delete',
      'ru': 'Удалить',
      'uk': 'Видалити',
    },
  },
  // AirportDetailsScreen
  {
    'rg044orq': {
      'en': 'Airport Details',
      'ru': 'Подробности аэропорта',
      'uk': 'Деталі аеропорту',
    },
    'wc8q7qde': {
      'en': 'Airport Name',
      'ru': 'Название аэропорта',
      'uk': 'Назва аеропорту',
    },
    'iqe1h0o0': {
      'en': 'IATA Code: XYZ',
      'ru': 'Код ИАТА: XYZ',
      'uk': 'Код IATA: XYZ',
    },
    'wgutefhn': {
      'en': 'Location: City, Country',
      'ru': 'Местоположение: Город, Страна',
      'uk': 'Розташування: місто, країна',
    },
    'sacfo3ya': {
      'en': 'Contact Information',
      'ru': 'Контактная информация',
      'uk': 'Контактна інформація',
    },
    '0gftxd4r': {
      'en': 'Phone: +123456789',
      'ru': 'Телефон: +123456789',
      'uk': 'Телефон: +123456789',
    },
    '5or3gt79': {
      'en': 'Email: contact@airport.com',
      'ru': 'Электронная почта: contact@airport.com',
      'uk': 'Електронна адреса: contact@airport.com',
    },
    '5asefsf2': {
      'en': 'Runway Information',
      'ru': 'Информация о взлетно-посадочной полосе',
      'uk': 'Інформація про злітно-посадкову смугу',
    },
    'gd7ekydl': {
      'en': 'Runway 1: 3000m',
      'ru': 'Взлетно-посадочная полоса 1: 3000 м',
      'uk': 'ЗПС 1: 3000 м',
    },
    'ltokdb26': {
      'en': 'Runway 2: 2500m',
      'ru': 'Взлетно-посадочная полоса 2: 2500 м',
      'uk': 'ЗПС 2: 2500 м',
    },
    'j00tf342': {
      'en': 'Other Details',
      'ru': 'Другие детали',
      'uk': 'Інші деталі',
    },
    '06a4ubdx': {
      'en': 'Additional information about the airport.',
      'ru': 'Дополнительная информация об аэропорте.',
      'uk': 'Додаткова інформація про аеропорт.',
    },
    '177tf258': {
      'en': 'Edit',
      'ru': 'Редактировать',
      'uk': 'Редагувати',
    },
    'bs2gvlre': {
      'en': 'Delete',
      'ru': 'Удалить',
      'uk': 'Видалити',
    },
  },
  // UserDetailsScreen
  {
    'sxc4079c': {
      'en': 'John Doe',
      'ru': 'Джон Доу',
      'uk': 'Джон Доу',
    },
    'ul9oj2hz': {
      'en': 'Email:',
      'ru': 'Электронная почта:',
      'uk': 'Електронна пошта:',
    },
    'qke0k8e5': {
      'en': 'john.doe@example.com',
      'ru': 'john.doe@example.com',
      'uk': 'john.doe@example.com',
    },
    'tomkonml': {
      'en': 'Role:',
      'ru': 'Роль:',
      'uk': 'роль:',
    },
    'n1em3d2v': {
      'en': 'Pilot',
      'ru': 'Пилот',
      'uk': 'Пілот',
    },
    'iymzpsxy': {
      'en': 'Contact Information',
      'ru': 'Контактная информация',
      'uk': 'Контактна інформація',
    },
    'r941zxg9': {
      'en': 'Phone:',
      'ru': 'Телефон:',
      'uk': 'телефон:',
    },
    '25bqazdp': {
      'en': '+1234567890',
      'ru': '+1234567890',
      'uk': '+1234567890',
    },
    'uoj5yejl': {
      'en': 'Address:',
      'ru': 'Адрес:',
      'uk': 'Адреса:',
    },
    'wla4ea65': {
      'en': '123 Main St, City, Country',
      'ru': '123 Мейн Стрит, Город, Страна',
      'uk': 'Головна 123, місто, країна',
    },
    'jqksr8qj': {
      'en': 'Flight History',
      'ru': 'История полетов',
      'uk': 'Історія польотів',
    },
    '22vrll8t': {
      'en': 'As Pilot:',
      'ru': 'В качестве пилота:',
      'uk': 'Як пілот:',
    },
    'ysrdnzhq': {
      'en': 'Flight 1, Flight 2, Flight 3',
      'ru': 'Рейс 1, Рейс 2, Рейс 3',
      'uk': 'Рейс 1, Рейс 2, Рейс 3',
    },
    '1ypwpfy0': {
      'en': 'As Passenger:',
      'ru': 'В качестве пассажира:',
      'uk': 'Як пасажир:',
    },
    'siaokdlx': {
      'en': 'Flight A, Flight B, Flight C',
      'ru': 'Рейс A, Рейс B, Рейс C',
      'uk': 'Рейс A, рейс B, рейс C',
    },
    'hih4l5tz': {
      'en': 'Other Details',
      'ru': 'Другие детали',
      'uk': 'Інші деталі',
    },
    'cw5hpjgn': {
      'en': 'Additional relevant information about the user goes here.',
      'ru': 'Дополнительная важная информация о пользователе находится здесь.',
      'uk': 'Тут міститься додаткова релевантна інформація про користувача.',
    },
    '7t1b921i': {
      'en': 'Edit User',
      'ru': 'Редактировать пользователя',
      'uk': 'Редагувати користувача',
    },
    'ja65y8g1': {
      'en': 'Delete User',
      'ru': 'Удалить пользователя',
      'uk': 'Видалити користувача',
    },
    '1p09tbbm': {
      'en': 'User Details',
      'ru': 'Данные пользователя',
      'uk': 'Відомості про користувача',
    },
  },
  // CreateEditFlightScreen
  {
    '4t2opw4t': {
      'en': 'Create/Edit Flight',
      'ru': 'Создать/редактировать рейс',
      'uk': 'Створити/редагувати рейс',
    },
    'jav6tp1n': {
      'en': 'Flight Number',
      'ru': 'Номер рейса',
      'uk': 'Номер рейсу',
    },
    '850eqp90': {
      'en': 'Enter flight number',
      'ru': 'Введите номер рейса',
      'uk': 'Введіть номер рейсу',
    },
    'n8v9qxxy': {
      'en': 'Departure Airport',
      'ru': 'Аэропорт вылета',
      'uk': 'Аеропорт вильоту',
    },
    'ev2x1fzj': {
      'en': 'Enter departure airport',
      'ru': 'Введите аэропорт вылета',
      'uk': 'Введіть аеропорт вильоту',
    },
    'jzaj84tf': {
      'en': 'Arrival Airport',
      'ru': 'Аэропорт прибытия',
      'uk': 'Аеропорт прибуття',
    },
    'te4uhcr3': {
      'en': 'Enter arrival airport',
      'ru': 'Введите аэропорт прибытия',
      'uk': 'Введіть аеропорт прибуття',
    },
    'gidjotru': {
      'en': 'Departure Date',
      'ru': 'Дата отбытия',
      'uk': 'Дата відправлення',
    },
    'pvbiae4z': {
      'en': 'Arrival Date',
      'ru': 'Дата прибытия',
      'uk': 'Дата прибуття',
    },
    'x9lay9sq': {
      'en': 'Departure Time',
      'ru': 'Время отправления',
      'uk': 'Час відправлення',
    },
    '92yd6w68': {
      'en': 'Arrival Time',
      'ru': 'Время прибытия',
      'uk': 'Час прибуття',
    },
    '6eogxmzm': {
      'en': 'Aircraft',
      'ru': 'Самолет',
      'uk': 'Літак',
    },
    'xp5a9z3s': {
      'en': 'Select Aircraft',
      'ru': 'Выбрать самолет',
      'uk': 'Виберіть Літак',
    },
    'altugulg': {
      'en': 'Pilot',
      'ru': 'Пилот',
      'uk': 'Пілот',
    },
    '33wl8ziu': {
      'en': 'Select Pilot',
      'ru': 'Выбрать пилота',
      'uk': 'Виберіть Пілот',
    },
    'umcfyqvj': {
      'en': 'Save',
      'ru': 'Сохранять',
      'uk': 'зберегти',
    },
  },
  // GenerateReportsScreen
  {
    'tb3qyxox': {
      'en': 'Generate Reports',
      'ru': 'Генерировать отчеты',
      'uk': 'Створення звітів',
    },
    'q26myq67': {
      'en': 'Select Report Type',
      'ru': 'Выберите тип отчета',
      'uk': 'Виберіть тип звіту',
    },
    'rs382sd9': {
      'en': 'Flights',
      'ru': 'Рейсы',
      'uk': 'Авіарейси',
    },
    'jj8mz3dt': {
      'en': 'Finances',
      'ru': 'Финансы',
      'uk': 'Фінанси',
    },
    '3ss5iu6g': {
      'en': 'Users',
      'ru': 'Пользователи',
      'uk': 'Користувачі',
    },
    'cpj0wkwv': {
      'en': 'Generate Report',
      'ru': 'Создать отчет',
      'uk': 'Створити звіт',
    },
    '0drgkcq1': {
      'en': 'Generated Reports',
      'ru': 'Сгенерированные отчеты',
      'uk': 'Згенеровані звіти',
    },
    'zgnb98ni': {
      'en': 'Report 1',
      'ru': 'Отчет 1',
      'uk': 'Звіт 1',
    },
    'l3k6qtwe': {
      'en': 'Report Description',
      'ru': 'Описание отчета',
      'uk': 'Опис звіту',
    },
    'agr5mmby': {
      'en': 'Export PDF',
      'ru': 'Экспорт PDF-файла',
      'uk': 'Експорт PDF',
    },
    '32gm2lr6': {
      'en': 'Export CSV',
      'ru': 'Экспорт CSV',
      'uk': 'Експорт CSV',
    },
    '445h486i': {
      'en': 'Report 2',
      'ru': 'Отчет 2',
      'uk': 'Звіт 2',
    },
    'x3vxt2xm': {
      'en': 'Report Description',
      'ru': 'Описание отчета',
      'uk': 'Опис звіту',
    },
    'w1gcq9hv': {
      'en': 'Export PDF',
      'ru': 'Экспорт PDF-файла',
      'uk': 'Експорт PDF',
    },
    '3j5wihiw': {
      'en': 'Export CSV',
      'ru': 'Экспорт CSV',
      'uk': 'Експорт CSV',
    },
  },
  // ForgotPassword02
  {
    'x0kp13s4': {
      'en': 'Back',
      'ru': 'Назад',
      'uk': 'Назад',
    },
    'v5vvuiwh': {
      'en': 'Forgot Password',
      'ru': 'Забыли пароль',
      'uk': 'Забули пароль',
    },
    '7i5h6k9l': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ru':
          'Мы отправим вам письмо со ссылкой для сброса пароля. Введите ниже адрес электронной почты, связанный с вашей учетной записью.',
      'uk':
          'Ми надішлемо вам електронний лист із посиланням для скидання пароля. Будь ласка, введіть адресу електронної пошти, пов’язану з вашим обліковим записом, нижче.',
    },
    'nttfd6zo': {
      'en': 'Your email address...',
      'ru': 'Ваш электронный адрес...',
      'uk': 'Ваша електронна адреса...',
    },
    'jj1k74vd': {
      'en': 'Enter your email...',
      'ru': 'Введите адрес электронной почты...',
      'uk': 'Введіть свою електронну адресу...',
    },
    'yoz07jj2': {
      'en': 'Send Link',
      'ru': 'Отправить ссылку',
      'uk': 'Надіслати посилання',
    },
    'p7rdz3k0': {
      'en': 'Home',
      'ru': 'Дом',
      'uk': 'додому',
    },
  },
  // maptracking
  {
    'o2icnip5': {
      'en': 'Google Maps is not supported in FlutterFlow.',
      'ru': 'Google Maps не поддерживается во FlutterFlow.',
      'uk': 'Карти Google не підтримуються у FlutterFlow.',
    },
  },
  // Profile
  {
    'alo1miex': {
      'en': 'Joy Augustin',
      'ru': 'Джой Августин',
      'uk': 'Джой Августин',
    },
    'j71k4g0b': {
      'en': 'joy@augustin.com',
      'ru': 'радость@augustin.com',
      'uk': 'joy@augustin.com',
    },
    '3irjao8y': {
      'en': 'Account',
      'ru': 'Счет',
      'uk': 'Обліковий запис',
    },
    'hbns1k91': {
      'en': 'Payment Options',
      'ru': 'Варианты оплаты',
      'uk': 'Варіанти оплати',
    },
    'cavyuyew': {
      'en': 'Country',
      'ru': 'Страна',
      'uk': 'Країна',
    },
    '2iqwkqsh': {
      'en': 'Notification Settings',
      'ru': 'Настройки уведомлений',
      'uk': 'Налаштування сповіщень',
    },
    'c5vmr91c': {
      'en': 'Edit Profile',
      'ru': 'Редактировать профиль',
      'uk': 'Редагувати профіль',
    },
    '6f8njew8': {
      'en': 'General',
      'ru': 'Общий',
      'uk': 'Загальний',
    },
    '7r6bq1kw': {
      'en': 'Support',
      'ru': 'Поддерживать',
      'uk': 'Підтримка',
    },
    'xxlwo580': {
      'en': 'Terms of Service',
      'ru': 'Условия использования',
      'uk': 'Умови використання',
    },
    'ka3bjyfy': {
      'en': 'Invite Friends',
      'ru': 'Пригласить друзей',
      'uk': 'Запросити друзів',
    },
    't6bjgcfi': {
      'en': 'Profile',
      'ru': 'Профиль',
      'uk': 'Профіль',
    },
    'l0fc8xpo': {
      'en': 'Home',
      'ru': 'Дом',
      'uk': 'додому',
    },
  },
  // BNB
  {
    'v9fwqbls': {
      'en': 'Page Title',
      'ru': 'Заголовок страницы',
      'uk': 'Назва сторінки',
    },
    'o6scnfxb': {
      'en': 'Home',
      'ru': 'Дом',
      'uk': 'додому',
    },
  },
  // SideNav01
  {
    'jv9nol5m': {
      'en': 'check.io',
      'ru': 'проверить.io',
      'uk': 'check.io',
    },
    'rj6tqr96': {
      'en': 'Inbox',
      'ru': 'Входящие',
      'uk': 'Вхідні',
    },
    'kfl8ek6y': {
      'en': 'Today',
      'ru': 'Сегодня',
      'uk': 'Сьогодні',
    },
    'pnr2u341': {
      'en': 'My Channel',
      'ru': 'Мой канал',
      'uk': 'Мій канал',
    },
    'z4riasnk': {
      'en': 'Dashboard',
      'ru': 'Панель приборов',
      'uk': 'Панель приладів',
    },
    'l5t4qnac': {
      'en': 'My Team',
      'ru': 'Моя команда',
      'uk': 'Моя команда',
    },
    'kt8sxukr': {
      'en': 'Messages',
      'ru': 'Сообщения',
      'uk': 'Повідомлення',
    },
    'fv4ww0ur': {
      'en': 'Completed Tasks',
      'ru': 'Выполненные задачи',
      'uk': 'Виконані завдання',
    },
    '8vtmito1': {
      'en': 'Settings',
      'ru': 'Настройки',
      'uk': 'Налаштування',
    },
    '5dvkd5mf': {
      'en': 'Add Channel',
      'ru': 'Добавить канал',
      'uk': 'Додати канал',
    },
    'tb43k8vk': {
      'en': 'Andrew D.',
      'ru': 'Эндрю Д.',
      'uk': 'Ендрю Д.',
    },
    'iizmfk7p': {
      'en': 'Admin',
      'ru': 'Админ',
      'uk': 'адмін',
    },
  },
  // sidewidg
  {
    'ex6undas': {
      'en': 'Flights',
      'ru': '',
      'uk': '',
    },
    '29eobgx9': {
      'en': 'Aircraft',
      'ru': '',
      'uk': '',
    },
    '52luxin1': {
      'en': 'Airports',
      'ru': '',
      'uk': '',
    },
    'zreixiwl': {
      'en': 'Users',
      'ru': '',
      'uk': '',
    },
    'phoelcj5': {
      'en': 'Finances',
      'ru': '',
      'uk': '',
    },
    'y9pow0nu': {
      'en': 'Log Out',
      'ru': '',
      'uk': '',
    },
  },
  // Miscellaneous
  {
    'x0ox6guy': {
      'en': 'Label here...',
      'ru': 'Метка здесь...',
      'uk': 'Позначте тут...',
    },
    '9cnqmp7u': {
      'en': 'Button',
      'ru': 'Кнопка',
      'uk': 'Кнопка',
    },
    'qrxew4zx': {
      'en': 'Button',
      'ru': 'Кнопка',
      'uk': 'Кнопка',
    },
    'd6fqnxmw': {
      'en': 'Title',
      'ru': 'Заголовок',
      'uk': 'Назва',
    },
    '1koq6pec': {
      'en': 'Subtitle goes here...',
      'ru': 'Подзаголовок здесь...',
      'uk': 'Тут йде підзаголовок...',
    },
    '40c6y13w': {
      'en': 'Option 1',
      'ru': 'Опция 1',
      'uk': 'Варіант 1',
    },
    'jafc7tq4': {
      'en': 'Option 2',
      'ru': 'Вариант 2',
      'uk': 'Варіант 2',
    },
    'gr4n6g3p': {
      'en': 'Option 3',
      'ru': 'Вариант 3',
      'uk': 'Варіант 3',
    },
    'iz596psm': {
      'en': 'Please select...',
      'ru': 'Пожалуйста выберите...',
      'uk': 'Виберіть будь ласка...',
    },
    't39v911q': {
      'en': 'Search for an item...',
      'ru': 'Поиск элемента...',
      'uk': 'Пошук предмета...',
    },
    'qaaqj8og': {
      'en': 'Heading',
      'ru': 'Заголовок',
      'uk': 'Заголовок',
    },
    'b8vyahno': {
      'en': 'paragraph',
      'ru': 'параграф',
      'uk': 'пункт',
    },
    'vf152fax': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '2n99rxjp': {
      'en':
          'Stay updated with the latest from FMA Management by allowing notifications.',
      'ru':
          'Оставайтесь в курсе последних новостей от FMA Management, разрешив получение уведомлений.',
      'uk':
          'Будьте в курсі останніх новин від FMA Management, дозволивши сповіщення.',
    },
    'bjbm4tke': {
      'en':
          'FMA Management needs access to your photos/media library to let you upload images, videos, or other files.',
      'ru':
          'Управлению FMA необходим доступ к вашей библиотеке фотографий/медиа, чтобы вы могли загружать изображения, видео или другие файлы.',
      'uk':
          'Керівництву FMA потрібен доступ до вашої фото/медійної бібліотеки, щоб ви могли завантажувати зображення, відео чи інші файли.',
    },
    'occhge27': {
      'en':
          'Allow FMA Management to access your location to provide personalized features and recommendations.',
      'ru':
          'Разрешите FMA Management получать доступ к вашему местоположению для предоставления персонализированных функций и рекомендаций.',
      'uk':
          'Надайте керівництву FMA доступ до вашого місцезнаходження, щоб надавати персоналізовані функції та рекомендації.',
    },
    'q9fonmn5': {
      'en':
          'Enable camera access to share moments, create content, or participate in calls within FMA Management.',
      'ru':
          'Включите доступ к камере, чтобы делиться моментами, создавать контент или участвовать в звонках в рамках FMA Management.',
      'uk':
          'Увімкніть доступ до камери, щоб ділитися моментами, створювати вміст або брати участь у дзвінках у FMA Management.',
    },
    'jje08xar': {
      'en':
          'o create events, reminders, or integrate with your schedule, FMA Management needs access to your calendar.',
      'ru':
          'Чтобы создавать события, напоминания или интегрировать их в ваше расписание, FMA Management необходим доступ к вашему календарю.',
      'uk':
          'o створювати події, нагадування або інтегрувати їх у ваш розклад, FMA Management потребує доступу до вашого календаря.',
    },
    'vygf8zw6': {
      'en':
          'For enhanced security and convenience, FMA Management would like to use your biometrics (fingerprint/face ID) to verify your identity.',
      'ru':
          'В целях повышения безопасности и удобства руководство FMA хотело бы использовать ваши биометрические данные (отпечатки пальцев/идентификатор лица) для подтверждения вашей личности.',
      'uk':
          'Для підвищення безпеки та зручності керівництво FMA хоче використовувати ваші біометричні дані (відбиток пальця/ідентифікатор обличчя) для підтвердження вашої особи.',
    },
    'sw99grb2': {
      'en':
          'Enable microphone access to share moments, create content, or participate in calls within FMA Management.',
      'ru':
          'Включите доступ к микрофону, чтобы делиться моментами, создавать контент или участвовать в звонках в рамках FMA Management.',
      'uk':
          'Увімкніть доступ до мікрофона, щоб ділитися моментами, створювати вміст або брати участь у дзвінках у FMA Management.',
    },
    'g7m14swx': {
      'en':
          'Grant FMA Management access to your contacts to easily connect with colleagues who are also using the app.',
      'ru':
          'Предоставьте руководству FMA доступ к вашим контактам, чтобы легко связаться с коллегами, которые также используют приложение.',
      'uk':
          'Надайте FMA Management доступ до ваших контактів, щоб легко спілкуватися з колегами, які також використовують додаток.',
    },
    'pslo1uvx': {
      'en':
          '\"FMA Management would like to access Bluetooth to connect with devices, share files, or enable wireless features.',
      'ru':
          '«Руководству FMA хотелось бы получить доступ к Bluetooth для подключения к устройствам, обмена файлами или включения беспроводных функций.',
      'uk':
          '«Керівництво FMA хоче отримати доступ до Bluetooth для підключення до пристроїв, обміну файлами або ввімкнення бездротових функцій.',
    },
    'oa76fd3w': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'o46qxar6': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'egn29dsm': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '0y1aqkm4': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'hy1328of': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '4hp1l9ej': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'lhtw8h7h': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'c78k05w4': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '2z2duaoq': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'kyrbumaa': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'mhbilxhi': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '7qlx29t5': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'r871lt70': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '90nncnom': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'ellrevvt': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'gdotnkgg': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    's8y2l6tt': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'jl33f83y': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '554ebzro': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'hg6mbncg': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    '2g1fbgj1': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'kuyrlkn8': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'nuqpqlv9': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'zno06i2h': {
      'en': '',
      'ru': '',
      'uk': '',
    },
    'mpgca08v': {
      'en': '',
      'ru': '',
      'uk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
