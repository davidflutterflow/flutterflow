import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'tr', 'ar'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String trText = '',
    String arText = '',
  }) =>
      [enText, trText, arText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'tr0bmhnb': {
      'en': 'Start chat',
      'ar': '',
      'tr': '',
    },
    'n8glveq3': {
      'en': 'Slider Test',
      'ar': '',
      'tr': '',
    },
    'jmpqxmaf': {
      'en': 'Run a Date Picker',
      'ar': '',
      'tr': '',
    },
    'wmpxv4rk': {
      'en': 'Total Number Count Sample',
      'ar': '',
      'tr': '',
    },
    'i9l4hs6n': {
      'en': 'ListView Drop-downs',
      'ar': '',
      'tr': '',
    },
    'q2cy2n5a': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // TextFields
  {
    'br4lmdv6': {
      'en': 'Sign In',
      'ar': '',
      'tr': '',
    },
    'mvwajwkz': {
      'en': 'Sign Up',
      'ar': '',
      'tr': '',
    },
    '63e59fbj': {
      'en': 'Get started by creating an account below.',
      'ar': '',
      'tr': '',
    },
    'tblnozr9': {
      'en': 'Your email address...',
      'ar': '',
      'tr': '',
    },
    'r1mmmhc3': {
      'en': 'Enter your email...',
      'ar': '',
      'tr': '',
    },
    'z9n25mwa': {
      'en': 'Password',
      'ar': '',
      'tr': '',
    },
    'bc2yjtg9': {
      'en': 'Enter your email...',
      'ar': '',
      'tr': '',
    },
    'lz4kfa7o': {
      'en': 'Confirm Password',
      'ar': '',
      'tr': '',
    },
    '94wkfljn': {
      'en': 'Enter your email...',
      'ar': '',
      'tr': '',
    },
    '0oric3oi': {
      'en': 'Get Started',
      'ar': '',
      'tr': '',
    },
    'd628ioy0': {
      'en': 'Continue as Guest',
      'ar': '',
      'tr': '',
    },
    '4mgomuhj': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // splash
  {
    'gi28hd8m': {
      'en': 'Button',
      'ar': '',
      'tr': '',
    },
    '7lo3v6ff': {
      'en': 'Page Title',
      'ar': '',
      'tr': '',
    },
    '9r70o9h9': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // A_CustomSearch
  {
    'igc15zpn': {
      'en': 'Nothing Found !',
      'ar': '',
      'tr': '',
    },
    'nauquyi2': {
      'en': 'Search for something else',
      'ar': '',
      'tr': '',
    },
    '6cijq0ml': {
      'en': 'No Search Result',
      'ar': '',
      'tr': '',
    },
    'cxsbp4ss': {
      'en': 'Type some thing to see results',
      'ar': '',
      'tr': '',
    },
    'wrufxfc1': {
      'en': 'Custom Search',
      'ar': '',
      'tr': '',
    },
    '8223vxt8': {
      'en': 'Search',
      'ar': '',
      'tr': '',
    },
    'jqrn26yx': {
      'en': 'Search Results',
      'ar': '',
      'tr': '',
    },
    'v3njx65g': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // Query
  {
    'i3yp4u4s': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // CustomActions
  {
    'xt63xep8': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    'anzhzqw9': {
      'en': 'List View From Action',
      'ar': '',
      'tr': '',
    },
    'i7qlv2od': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // InfinitScroll
  {
    '45mvjhcj': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    '3yefv68n': {
      'en': 'Test Infinit Scroll',
      'ar': '',
      'tr': '',
    },
    'vgdvoewu': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // Chat
  {
    '7xmavgkm': {
      'en': 'Group Chat',
      'ar': '',
      'tr': '',
    },
  },
  // CreateGroupChat
  {
    'atxvtb6w': {
      'en': 'Create Group Chat',
      'ar': '',
      'tr': '',
    },
    'ph13d691': {
      'en': 'Select the friends to add to chat.',
      'ar': '',
      'tr': '',
    },
    '85vqodpb': {
      'en': 'Create Chat',
      'ar': '',
      'tr': '',
    },
  },
  // ChatPages
  {
    'xkl5uwej': {
      'en': 'All Chats',
      'ar': '',
      'tr': '',
    },
  },
  // InviteToChat
  {
    'gnqt0gw4': {
      'en': 'Add Friends to chat',
      'ar': '',
      'tr': '',
    },
    '68pc4kql': {
      'en': 'Selectuser to add to chat.',
      'ar': '',
      'tr': '',
    },
    'eog4mkno': {
      'en': 'LOGOUT',
      'ar': '',
      'tr': '',
    },
    's93jz7m5': {
      'en': 'Display Name',
      'ar': '',
      'tr': '',
    },
    '4bvoxo1g': {
      'en': 'Invite to Chat',
      'ar': '',
      'tr': '',
    },
  },
  // SignUp
  {
    'vwmm2xqf': {
      'en': 'Sign In',
      'ar': '',
      'tr': '',
    },
    '67f6tj22': {
      'en': 'Sign Up',
      'ar': '',
      'tr': '',
    },
    '5uc8awr6': {
      'en': 'Get started by creating an account below.',
      'ar': '',
      'tr': '',
    },
    'fmpszdz4': {
      'en': 'Get Started',
      'ar': '',
      'tr': '',
    },
    'vfmkg6jr': {
      'en': 'Continue as Guest',
      'ar': '',
      'tr': '',
    },
  },
  // Login
  {
    'hbagzvrl': {
      'en': 'Sign In',
      'ar': '',
      'tr': '',
    },
    'ggq0kctd': {
      'en': 'Sign Up',
      'ar': '',
      'tr': '',
    },
    'bnm9xv4e': {
      'en': 'Get started by creating an account below.',
      'ar': '',
      'tr': '',
    },
    '5rpzg5uv': {
      'en': 'Login',
      'ar': '',
      'tr': '',
    },
    'b1hxgx9v': {
      'en': 'Continue as Guest',
      'ar': '',
      'tr': '',
    },
  },
  // ComponentTest
  {
    'wplnjobw': {
      'en': 'Continue as Guest',
      'ar': '',
      'tr': '',
    },
    '80fzqi6f': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    '91l08vb2': {
      'en': 'Page Title',
      'ar': '',
      'tr': '',
    },
    'ojcotf37': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // Slider
  {
    '07ewknsd': {
      'en': 'Slider Value',
      'ar': '',
      'tr': '',
    },
    'poqd3ay3': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    's3ydovpe': {
      'en': 'Slider Test',
      'ar': '',
      'tr': '',
    },
    '66r1ccre': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // UserGrade
  {
    '1g3tglx1': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    '81vcpqw2': {
      'en': 'Users base on grade',
      'ar': '',
      'tr': '',
    },
    'sigg9rbt': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // DropDowns
  {
    'ow2eumqa': {
      'en': 'Option 1',
      'ar': '',
      'tr': '',
    },
    'osov0pyc': {
      'en': 'Option 2',
      'ar': '',
      'tr': '',
    },
    '3tmwe21z': {
      'en': 'Option 3',
      'ar': '',
      'tr': '',
    },
    'd9dx5jon': {
      'en': 'Option 4',
      'ar': '',
      'tr': '',
    },
    'hos4w6ic': {
      'en': 'Please select...',
      'ar': '',
      'tr': '',
    },
    'hen5ok0z': {
      'en': 'Back',
      'ar': '',
      'tr': '',
    },
    'kskzhzge': {
      'en': 'DropDowns',
      'ar': '',
      'tr': '',
    },
    'z0iy8apw': {
      'en': 'Home',
      'ar': '',
      'tr': '',
    },
  },
  // testComp
  {
    '3cf8gmgq': {
      'en': '[Some hint text...]',
      'ar': '',
      'tr': '',
    },
    'k54tgdn6': {
      'en': 'Field is required',
      'ar': '',
      'tr': '',
    },
  },
  // button
  {
    'ie0n4bj4': {
      'en': 'Hello World',
      'ar': '',
      'tr': '',
    },
  },
  // test2
  {
    'vyc1k914': {
      'en': 'Button',
      'ar': '',
      'tr': '',
    },
  },
  // testComp2
  {
    'j6uv9eab': {
      'en': 'Hello World',
      'ar': '',
      'tr': '',
    },
  },
  // Miscellaneous
  {
    'frkvub6v': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '79hravj4': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'qc24q6ay': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '3xihgsg6': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'v8ui2q0a': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'u5w8ka6p': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '1rlt14ms': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'smj4vh8b': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'wo2o9wo9': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'rbrv3p0o': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'd8ndglbc': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'crumdne7': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'qnd3lm9p': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'rz7l8b5n': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '74v97r61': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '426lvel6': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '7nho5x2a': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'dhdomc14': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '2ax4ksuk': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'jdihd8gf': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'wtqb3pdt': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '596d3e50': {
      'en': '',
      'ar': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
