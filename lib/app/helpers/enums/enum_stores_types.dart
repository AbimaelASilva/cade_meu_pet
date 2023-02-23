import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

/// The type of [EnumStoresType].
enum EnumStoresType {
  pizzas,
  supermarkets,
  snacks,
}

extension EnumStoresTypeExtension on EnumStoresType {
  /// Return enum From String.
  EnumStoresType enumFromString(String value) {
    switch (value) {
      case 'PIZZAS':
        return EnumStoresType.pizzas;
      case 'SUPERMARKETS':
        return EnumStoresType.supermarkets;
      case 'SNACKS':
      default:
        return EnumStoresType.snacks;
    }
  }

  String get translation {
    switch (this) {
      case EnumStoresType.pizzas:
        return 'label_pizzas'.tr;
      case EnumStoresType.supermarkets:
        return 'label_supermarkets'.tr;
      case EnumStoresType.snacks:
        return 'label_snacks'.tr;
    }
  }

  String get bannerGroups {
    switch (this) {
      case EnumStoresType.pizzas:
        return 'PIZZARIAS';
      case EnumStoresType.supermarkets:
        return 'SUPERMERCADOS';
      case EnumStoresType.snacks:
        return 'LANCHES';
    }
  }

  String get urlIcon {
    switch (this) {
      case EnumStoresType.pizzas:
        return 'https://cdn-icons-png.flaticon.com/512/3595/3595458.png';
      case EnumStoresType.supermarkets:
        return 'https://images.vexels.com/media/users/3/200098/isolated/preview/7ad7c76da9a0cd7d2b01b64b2590617b-icone-do-carrinho-de-compras-icone-do-carrinho-de-compras.png';
      case EnumStoresType.snacks:
        return 'https://cdn-icons-png.flaticon.com/512/5854/5854311.png';
    }
  }

  String get stringFromEnum => describeEnum(this);
}
