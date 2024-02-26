import 'package:flutter/material.dart';

class SmallHeightedSizedBox extends SizedBox {
  const SmallHeightedSizedBox({
    Key? key,
  }) : super(
          key: key,
          height: 16,
        );
}

class SmallerHeightedSizedBox extends SizedBox {
  const SmallerHeightedSizedBox({
    Key? key,
  }) : super(
          key: key,
          height: 12,
        );
}

class SmallestHeightedSizedBox extends SizedBox {
  const SmallestHeightedSizedBox({
    Key? key,
  }) : super(
          key: key,
          height: 8,
        );
}

class MediumHeightedSizedBox extends SizedBox {
  const MediumHeightedSizedBox({
    Key? key,
  }) : super(key: key, height: 32);
}

class LargeHeitedSizedBox extends SizedBox {
  const LargeHeitedSizedBox({
    Key? key,
  }) : super(key: key, height: 48);
}
