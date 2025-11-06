import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('hi'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Preparing for the initial offering of nodes. Follow us:'**
  String get notification;

  /// No description provided for @project_description.
  ///
  /// In en, this message translates to:
  /// **'Liquidity Protocol for Solana Ecosystem'**
  String get project_description;

  /// No description provided for @staking.
  ///
  /// In en, this message translates to:
  /// **'Staking'**
  String get staking;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get claim;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @how_it_work.
  ///
  /// In en, this message translates to:
  /// **'How it work'**
  String get how_it_work;

  /// No description provided for @how_first.
  ///
  /// In en, this message translates to:
  /// **'Tyrbine Nodes provide liquidity for Solana ecosystem'**
  String get how_first;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @income_description.
  ///
  /// In en, this message translates to:
  /// **'Nodes earn income from trading fees'**
  String get income_description;

  /// No description provided for @holders.
  ///
  /// In en, this message translates to:
  /// **'Holders'**
  String get holders;

  /// No description provided for @holders_description.
  ///
  /// In en, this message translates to:
  /// **'100% of income are distributed among the holders of the nodes'**
  String get holders_description;

  /// No description provided for @profitability.
  ///
  /// In en, this message translates to:
  /// **'Profitability'**
  String get profitability;

  /// No description provided for @economics.
  ///
  /// In en, this message translates to:
  /// **'Economics'**
  String get economics;

  /// No description provided for @roadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get roadmap;

  /// No description provided for @stability.
  ///
  /// In en, this message translates to:
  /// **'Stability in crypto is here'**
  String get stability;

  /// No description provided for @docs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get docs;

  /// No description provided for @nodes.
  ///
  /// In en, this message translates to:
  /// **'Nodes'**
  String get nodes;

  /// No description provided for @stat.
  ///
  /// In en, this message translates to:
  /// **'Stat'**
  String get stat;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy_policy;

  /// No description provided for @feature.
  ///
  /// In en, this message translates to:
  /// **'Feature'**
  String get feature;

  /// No description provided for @scroll.
  ///
  /// In en, this message translates to:
  /// **'Scroll'**
  String get scroll;

  /// No description provided for @billion.
  ///
  /// In en, this message translates to:
  /// **'Billion'**
  String get billion;

  /// No description provided for @dailyTrading.
  ///
  /// In en, this message translates to:
  /// **'Daily trading volume on Solana'**
  String get dailyTrading;

  /// No description provided for @dailyTradingSubtext.
  ///
  /// In en, this message translates to:
  /// **'We expect our nodes to handle a minimum of 5% of Solana daily trading volume. In this case, the profitability of one node will be 10 USDC per day'**
  String get dailyTradingSubtext;

  /// No description provided for @nodesEarning.
  ///
  /// In en, this message translates to:
  /// **'Nodes are earning high-liquidity tokens SOL, USDC'**
  String get nodesEarning;

  /// No description provided for @transparent.
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get transparent;

  /// No description provided for @revDist.
  ///
  /// In en, this message translates to:
  /// **'Revenue distribution'**
  String get revDist;

  /// No description provided for @revDistSubtext.
  ///
  /// In en, this message translates to:
  /// **'The project team earns as well as the owners of nodes, there are 2000 nodes in circulation, and only 100 belong to the team'**
  String get revDistSubtext;

  /// No description provided for @roadmapSubtext.
  ///
  /// In en, this message translates to:
  /// **'3 steps to reach profitability: Initial Node Offering, Tyrbine Protocol Launch and Jupiter Exchange Integration'**
  String get roadmapSubtext;

  /// No description provided for @launcher.
  ///
  /// In en, this message translates to:
  /// **'Launcher'**
  String get launcher;

  /// No description provided for @quickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick start to run node'**
  String get quickStart;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'hi', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
