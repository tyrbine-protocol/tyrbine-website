// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get notification =>
      'Подготовка к первичному размещению нод. Подпишись:';

  @override
  String get project_description => 'Протокол ликвидности для Solana';

  @override
  String get staking => 'Staking';

  @override
  String get about => 'О проекте';

  @override
  String get claim => 'Потребовать';

  @override
  String get connect => 'Подключить';

  @override
  String get how_it_work => 'Как это работает';

  @override
  String get how_first =>
      'Ноды Tyrbine обеспечивают ликвидность для экосистемы Solana';

  @override
  String get income => 'Доход';

  @override
  String get income_description => 'Ноды получают доход от торговых комиссий';

  @override
  String get holders => 'Держатели';

  @override
  String get holders_description =>
      '100% дохода распределяется между держателями нод';

  @override
  String get profitability => 'Доходность';

  @override
  String get economics => 'Экономика';

  @override
  String get roadmap => 'Дорожная карта';

  @override
  String get stability => 'Стабильность в крипто уже здесь';

  @override
  String get docs => 'Документация';

  @override
  String get nodes => 'Ноды';

  @override
  String get stat => 'Статистика';

  @override
  String get company => 'Компания';

  @override
  String get security => 'Безопасность';

  @override
  String get resources => 'Ресурсы';

  @override
  String get privacy_policy => 'Политика конф.';

  @override
  String get feature => 'Механика';

  @override
  String get scroll => 'Прокрути';

  @override
  String get billion => 'Миллиарда';

  @override
  String get dailyTrading => 'Ежедневный торговый объём в сети Solana';

  @override
  String get dailyTradingSubtext =>
      'Мы ожидаем, что наши ноды будут обрабатывать минимум 5% ежедневного торгового объема Solana. В этом случае доходность одной ноды составит 10 USDC в день';

  @override
  String get nodesEarning =>
      'Ноды зарабатывают токены с высокой ликвидностью: SOL, USDC';

  @override
  String get transparent => 'Прозрачность';

  @override
  String get revDist => 'Распределения доходов';

  @override
  String get revDistSubtext =>
      'Команда проекта зарабатывает так же, как и владельцы нод. В обращении 2000 нод, из которых только 100 принадлежат команде';

  @override
  String get roadmapSubtext =>
      '3 шага к прибыльности: первичное размещение нод, запуск протокола Tyrbine и интеграция с агрегатором Jupiter';

  @override
  String get launcher => 'Лаунчер';

  @override
  String get quickStart => 'Быстрый старт для запуска ноды';
}
