
import 'package:carezyadminapp/res/styles/color_palette.dart';
import 'package:carezyadminapp/res/styles/fonts/plus_jakarta_font_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/country.dart';




class CountryPicker extends StatefulWidget {
  final Country selectedCountry;
  final Function(Country) onSelected;

  const CountryPicker({
    super.key,
    required this.onSelected,
    required this.selectedCountry,
  });

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  late final ValueNotifier<Country> countryNotifier;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    countryNotifier = ValueNotifier(widget.selectedCountry);
  }

  void _openCountryPicker() {
    FocusManager.instance.primaryFocus?.unfocus();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (_) => ValueListenableBuilder(
          valueListenable: countryNotifier,
          builder: (context, selected, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                20.verticalSpace,
                Text("Select Country",
                    style: PlusJakartaFontPalette.fBlack_16_600),
                20.verticalSpace,
                ListView.builder(
                  itemCount: countries.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    bool isSelected = selected.code == country.code;
                    return ListTile(
                      leading:
                          Text(country.flag, style: TextStyle(fontSize: 24)),
                      title: Text(country.name,
                          style: PlusJakartaFontPalette.fBlack_14_600),
                      subtitle: Text(country.dialCode),
                      onTap: () {
                        countryNotifier.value = country;
                        widget.onSelected(country);
                        Navigator.pop(context);
                      },
                      trailing: isSelected
                          ? Icon(
                              Icons.check,
                              color: ColorPalette.primaryColor,
                            )
                          : null,
                    );
                  },
                ),
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openCountryPicker,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.selectedCountry.flag, style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Text(widget.selectedCountry.dialCode,
                style: PlusJakartaFontPalette.fBlack_14_600),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
