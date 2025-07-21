import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  const CountryModel({
    this.flag,
    this.name,
    this.code,
    this.dialCode,
  });

  final String? flag;
  final String? name;
  final String? code;
  final String? dialCode;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      flag: json["flag"],
      name: json["name"],
      code: json["code"],
      dialCode: json["dial_code"],
    );
  }

  @override
  List<Object?> get props => [
        flag,
        name,
        code,
        dialCode,
      ];
}

List<CountryModel> countryList =
    data.map((e) => CountryModel.fromJson(e)).toList();

List<Map<String, String>> data = [
  {"flag": "🇦🇼", "name": "Aruba", "code": "AW", "dial_code": ""},
  {"flag": "🇦🇫", "name": "Afghanistan", "code": "AF", "dial_code": ""},
  {"flag": "🇦🇴", "name": "Angola", "code": "AO", "dial_code": ""},
  {"flag": "🇦🇮", "name": "Anguilla", "code": "AI", "dial_code": ""},
  {"flag": "🇦🇽", "name": "Åland Islands", "code": "AX", "dial_code": ""},
  {"flag": "🇦🇱", "name": "Albania", "code": "AL", "dial_code": ""},
  {"flag": "🇦🇩", "name": "Andorra", "code": "AD", "dial_code": ""},
  {
    "flag": "🇦🇪",
    "name": "United Arab Emirates",
    "code": "AE",
    "dial_code": "+971"
  },
  {"flag": "🇦🇷", "name": "Argentina", "code": "AR", "dial_code": ""},
  {"flag": "🇦🇲", "name": "Armenia", "code": "AM", "dial_code": ""},
  {"flag": "🇦🇸", "name": "American Samoa", "code": "AS", "dial_code": ""},
  {"flag": "🇦🇶", "name": "Antarctica", "code": "AQ", "dial_code": ""},
  {
    "flag": "🇹🇫",
    "name": "French Southern Territories",
    "code": "TF",
    "dial_code": ""
  },
  {
    "flag": "🇦🇬",
    "name": "Antigua and Barbuda",
    "code": "AG",
    "dial_code": ""
  },
  {"flag": "🇦🇺", "name": "Australia", "code": "AU", "dial_code": ""},
  {"flag": "🇦🇹", "name": "Austria", "code": "AT", "dial_code": ""},
  {"flag": "🇦🇿", "name": "Azerbaijan", "code": "AZ", "dial_code": ""},
  {"flag": "🇧🇮", "name": "Burundi", "code": "BI", "dial_code": ""},
  {"flag": "🇧🇪", "name": "Belgium", "code": "BE", "dial_code": ""},
  {"flag": "🇧🇯", "name": "Benin", "code": "BJ", "dial_code": ""},
  {
    "flag": "🇧🇶",
    "name": "Bonaire, Sint Eustatius and Saba",
    "code": "BQ",
    "dial_code": ""
  },
  {"flag": "🇧🇫", "name": "Burkina Faso", "code": "BF", "dial_code": ""},
  {"flag": "🇧🇩", "name": "Bangladesh", "code": "BD", "dial_code": ""},
  {"flag": "🇧🇬", "name": "Bulgaria", "code": "BG", "dial_code": ""},
  {"flag": "🇧🇭", "name": "Bahrain", "code": "BH", "dial_code": ""},
  {"flag": "🇧🇸", "name": "Bahamas", "code": "BS", "dial_code": ""},
  {
    "flag": "🇧🇦",
    "name": "Bosnia and Herzegovina",
    "code": "BA",
    "dial_code": ""
  },
  {"flag": "🇧🇱", "name": "Saint Barthélemy", "code": "BL", "dial_code": ""},
  {"flag": "🇧🇾", "name": "Belarus", "code": "BY", "dial_code": ""},
  {"flag": "🇧🇿", "name": "Belize", "code": "BZ", "dial_code": ""},
  {"flag": "🇧🇲", "name": "Bermuda", "code": "BM", "dial_code": ""},
  {
    "flag": "🇧🇴",
    "name": "Bolivia, Plurinational State of",
    "code": "BO",
    "dial_code": ""
  },
  {"flag": "🇧🇷", "name": "Brazil", "code": "BR", "dial_code": "+55"},
  {"flag": "🇧🇧", "name": "Barbados", "code": "BB", "dial_code": ""},
  {"flag": "🇧🇳", "name": "Brunei Darussalam", "code": "BN", "dial_code": ""},
  {"flag": "🇧🇹", "name": "Bhutan", "code": "BT", "dial_code": ""},
  {"flag": "🇧🇻", "name": "Bouvet Island", "code": "BV", "dial_code": ""},
  {"flag": "🇧🇼", "name": "Botswana", "code": "BW", "dial_code": ""},
  {
    "flag": "🇨🇫",
    "name": "Central African Republic",
    "code": "CF",
    "dial_code": ""
  },
  {"flag": "🇨🇦", "name": "Canada", "code": "CA", "dial_code": ""},
  {
    "flag": "🇨🇨",
    "name": "Cocos (Keeling) Islands",
    "code": "CC",
    "dial_code": ""
  },
  {"flag": "🇨🇭", "name": "Switzerland", "code": "CH", "dial_code": ""},
  {"flag": "🇨🇱", "name": "Chile", "code": "CL", "dial_code": ""},
  {"flag": "🇨🇳", "name": "China", "code": "CN", "dial_code": "+86"},
  {"flag": "🇨🇮", "name": "Côte d'Ivoire", "code": "CI", "dial_code": ""},
  {"flag": "🇨🇲", "name": "Cameroon", "code": "CM", "dial_code": ""},
  {
    "flag": "🇨🇩",
    "name": "Congo, The Democratic Republic of the",
    "code": "CD",
    "dial_code": ""
  },
  {"flag": "🇨🇬", "name": "Congo", "code": "CG", "dial_code": ""},
  {"flag": "🇨🇰", "name": "Cook Islands", "code": "CK", "dial_code": ""},
  {"flag": "🇨🇴", "name": "Colombia", "code": "CO", "dial_code": ""},
  {"flag": "🇰🇲", "name": "Comoros", "code": "KM", "dial_code": ""},
  {"flag": "🇨🇻", "name": "Cabo Verde", "code": "CV", "dial_code": ""},
  {"flag": "🇨🇷", "name": "Costa Rica", "code": "CR", "dial_code": ""},
  {"flag": "🇨🇺", "name": "Cuba", "code": "CU", "dial_code": ""},
  {"flag": "🇨🇼", "name": "Curaçao", "code": "CW", "dial_code": ""},
  {"flag": "🇨🇽", "name": "Christmas Island", "code": "CX", "dial_code": ""},
  {"flag": "🇰🇾", "name": "Cayman Islands", "code": "KY", "dial_code": ""},
  {"flag": "🇨🇾", "name": "Cyprus", "code": "CY", "dial_code": ""},
  {"flag": "🇨🇿", "name": "Czechia", "code": "CZ", "dial_code": ""},
  {"flag": "🇩🇪", "name": "Germany", "code": "DE", "dial_code": "+49"},
  {"flag": "🇩🇯", "name": "Djibouti", "code": "DJ", "dial_code": ""},
  {"flag": "🇩🇲", "name": "Dominica", "code": "DM", "dial_code": ""},
  {"flag": "🇩🇰", "name": "Denmark", "code": "DK", "dial_code": ""},
  {"flag": "🇩🇴", "name": "Dominican Republic", "code": "DO", "dial_code": ""},
  {"flag": "🇩🇿", "name": "Algeria", "code": "DZ", "dial_code": ""},
  {"flag": "🇪🇨", "name": "Ecuador", "code": "EC", "dial_code": ""},
  {"flag": "🇪🇬", "name": "Egypt", "code": "EG", "dial_code": ""},
  {"flag": "🇪🇷", "name": "Eritrea", "code": "ER", "dial_code": ""},
  {"flag": "🇪🇭", "name": "Western Sahara", "code": "EH", "dial_code": ""},
  {"flag": "🇪🇸", "name": "Spain", "code": "ES", "dial_code": ""},
  {"flag": "🇪🇪", "name": "Estonia", "code": "EE", "dial_code": ""},
  {"flag": "🇪🇹", "name": "Ethiopia", "code": "ET", "dial_code": ""},
  {"flag": "🇫🇮", "name": "Finland", "code": "FI", "dial_code": ""},
  {"flag": "🇫🇯", "name": "Fiji", "code": "FJ", "dial_code": ""},
  {
    "flag": "🇫🇰",
    "name": "Falkland Islands (Malvinas)",
    "code": "FK",
    "dial_code": ""
  },
  {"flag": "🇫🇷", "name": "France", "code": "FR", "dial_code": "+33"},
  {"flag": "🇫🇴", "name": "Faroe Islands", "code": "FO", "dial_code": ""},
  {
    "flag": "🇫🇲",
    "name": "Micronesia, Federated States of",
    "code": "FM",
    "dial_code": ""
  },
  {"flag": "🇬🇦", "name": "Gabon", "code": "GA", "dial_code": ""},
  {"flag": "🇬🇧", "name": "United Kingdom", "code": "GB", "dial_code": "+44"},
  {"flag": "🇬🇪", "name": "Georgia", "code": "GE", "dial_code": ""},
  {"flag": "🇬🇬", "name": "Guernsey", "code": "GG", "dial_code": ""},
  {"flag": "🇬🇭", "name": "Ghana", "code": "GH", "dial_code": ""},
  {"flag": "🇬🇮", "name": "Gibraltar", "code": "GI", "dial_code": ""},
  {"flag": "🇬🇳", "name": "Guinea", "code": "GN", "dial_code": ""},
  {"flag": "🇬🇵", "name": "Guadeloupe", "code": "GP", "dial_code": ""},
  {"flag": "🇬🇲", "name": "Gambia", "code": "GM", "dial_code": ""},
  {"flag": "🇬🇼", "name": "Guinea-Bissau", "code": "GW", "dial_code": ""},
  {"flag": "🇬🇶", "name": "Equatorial Guinea", "code": "GQ", "dial_code": ""},
  {"flag": "🇬🇷", "name": "Greece", "code": "GR", "dial_code": ""},
  {"flag": "🇬🇩", "name": "Grenada", "code": "GD", "dial_code": ""},
  {"flag": "🇬🇱", "name": "Greenland", "code": "GL", "dial_code": ""},
  {"flag": "🇬🇹", "name": "Guatemala", "code": "GT", "dial_code": ""},
  {"flag": "🇬🇫", "name": "French Guiana", "code": "GF", "dial_code": ""},
  {"flag": "🇬🇺", "name": "Guam", "code": "GU", "dial_code": ""},
  {"flag": "🇬🇾", "name": "Guyana", "code": "GY", "dial_code": ""},
  {"flag": "🇭🇰", "name": "Hong Kong", "code": "HK", "dial_code": ""},
  {
    "flag": "🇭🇲",
    "name": "Heard Island and McDonald Islands",
    "code": "HM",
    "dial_code": ""
  },
  {"flag": "🇭🇳", "name": "Honduras", "code": "HN", "dial_code": ""},
  {"flag": "🇭🇷", "name": "Croatia", "code": "HR", "dial_code": ""},
  {"flag": "🇭🇹", "name": "Haiti", "code": "HT", "dial_code": ""},
  {"flag": "🇭🇺", "name": "Hungary", "code": "HU", "dial_code": ""},
  {"flag": "🇮🇩", "name": "Indonesia", "code": "ID", "dial_code": ""},
  {"flag": "🇮🇲", "name": "Isle of Man", "code": "IM", "dial_code": ""},
  {"flag": "🇮🇳", "name": "India", "code": "IN", "dial_code": "+91"},
  {
    "flag": "🇮🇴",
    "name": "British Indian Ocean Territory",
    "code": "IO",
    "dial_code": ""
  },
  {"flag": "🇮🇪", "name": "Ireland", "code": "IE", "dial_code": ""},
  {
    "flag": "🇮🇷",
    "name": "Iran, Islamic Republic of",
    "code": "IR",
    "dial_code": ""
  },
  {"flag": "🇮🇶", "name": "Iraq", "code": "IQ", "dial_code": ""},
  {"flag": "🇮🇸", "name": "Iceland", "code": "IS", "dial_code": ""},
  {"flag": "🇮🇱", "name": "Israel", "code": "IL", "dial_code": ""},
  {"flag": "🇮🇹", "name": "Italy", "code": "IT", "dial_code": ""},
  {"flag": "🇯🇲", "name": "Jamaica", "code": "JM", "dial_code": ""},
  {"flag": "🇯🇪", "name": "Jersey", "code": "JE", "dial_code": ""},
  {"flag": "🇯🇴", "name": "Jordan", "code": "JO", "dial_code": ""},
  {"flag": "🇯🇵", "name": "Japan", "code": "JP", "dial_code": "+81"},
  {"flag": "🇰🇿", "name": "Kazakhstan", "code": "KZ", "dial_code": ""},
  {"flag": "🇰🇪", "name": "Kenya", "code": "KE", "dial_code": ""},
  {"flag": "🇰🇬", "name": "Kyrgyzstan", "code": "KG", "dial_code": ""},
  {"flag": "🇰🇭", "name": "Cambodia", "code": "KH", "dial_code": ""},
  {"flag": "🇰🇮", "name": "Kiribati", "code": "KI", "dial_code": ""},
  {
    "flag": "🇰🇳",
    "name": "Saint Kitts and Nevis",
    "code": "KN",
    "dial_code": ""
  },
  {"flag": "🇰🇷", "name": "Korea, Republic of", "code": "KR", "dial_code": ""},
  {"flag": "🇰🇼", "name": "Kuwait", "code": "KW", "dial_code": ""},
  {
    "flag": "🇱🇦",
    "name": "Lao People's Democratic Republic",
    "code": "LA",
    "dial_code": ""
  },
  {"flag": "🇱🇧", "name": "Lebanon", "code": "LB", "dial_code": ""},
  {"flag": "🇱🇷", "name": "Liberia", "code": "LR", "dial_code": ""},
  {"flag": "🇱🇾", "name": "Libya", "code": "LY", "dial_code": ""},
  {"flag": "🇱🇨", "name": "Saint Lucia", "code": "LC", "dial_code": ""},
  {"flag": "🇱🇮", "name": "Liechtenstein", "code": "LI", "dial_code": ""},
  {"flag": "🇱🇰", "name": "Sri Lanka", "code": "LK", "dial_code": ""},
  {"flag": "🇱🇸", "name": "Lesotho", "code": "LS", "dial_code": ""},
  {"flag": "🇱🇹", "name": "Lithuania", "code": "LT", "dial_code": ""},
  {"flag": "🇱🇺", "name": "Luxembourg", "code": "LU", "dial_code": ""},
  {"flag": "🇱🇻", "name": "Latvia", "code": "LV", "dial_code": ""},
  {"flag": "🇲🇴", "name": "Macao", "code": "MO", "dial_code": ""},
  {
    "flag": "🇲🇫",
    "name": "Saint Martin (French part)",
    "code": "MF",
    "dial_code": ""
  },
  {"flag": "🇲🇦", "name": "Morocco", "code": "MA", "dial_code": ""},
  {"flag": "🇲🇨", "name": "Monaco", "code": "MC", "dial_code": ""},
  {
    "flag": "🇲🇩",
    "name": "Moldova, Republic of",
    "code": "MD",
    "dial_code": ""
  },
  {"flag": "🇲🇬", "name": "Madagascar", "code": "MG", "dial_code": ""},
  {"flag": "🇲🇻", "name": "Maldives", "code": "MV", "dial_code": ""},
  {"flag": "🇲🇽", "name": "Mexico", "code": "MX", "dial_code": ""},
  {"flag": "🇲🇭", "name": "Marshall Islands", "code": "MH", "dial_code": ""},
  {"flag": "🇲🇰", "name": "North Macedonia", "code": "MK", "dial_code": ""},
  {"flag": "🇲🇱", "name": "Mali", "code": "ML", "dial_code": ""},
  {"flag": "🇲🇹", "name": "Malta", "code": "MT", "dial_code": ""},
  {"flag": "🇲🇲", "name": "Myanmar", "code": "MM", "dial_code": ""},
  {"flag": "🇲🇪", "name": "Montenegro", "code": "ME", "dial_code": ""},
  {"flag": "🇲🇳", "name": "Mongolia", "code": "MN", "dial_code": ""},
  {
    "flag": "🇲🇵",
    "name": "Northern Mariana Islands",
    "code": "MP",
    "dial_code": ""
  },
  {"flag": "🇲🇿", "name": "Mozambique", "code": "MZ", "dial_code": ""},
  {"flag": "🇲🇷", "name": "Mauritania", "code": "MR", "dial_code": ""},
  {"flag": "🇲🇸", "name": "Montserrat", "code": "MS", "dial_code": ""},
  {"flag": "🇲🇶", "name": "Martinique", "code": "MQ", "dial_code": ""},
  {"flag": "🇲🇺", "name": "Mauritius", "code": "MU", "dial_code": ""},
  {"flag": "🇲🇼", "name": "Malawi", "code": "MW", "dial_code": ""},
  {"flag": "🇲🇾", "name": "Malaysia", "code": "MY", "dial_code": ""},
  {"flag": "🇾🇹", "name": "Mayotte", "code": "YT", "dial_code": ""},
  {"flag": "🇳🇦", "name": "Namibia", "code": "NA", "dial_code": ""},
  {"flag": "🇳🇨", "name": "New Caledonia", "code": "NC", "dial_code": ""},
  {"flag": "🇳🇪", "name": "Niger", "code": "NE", "dial_code": ""},
  {"flag": "🇳🇫", "name": "Norfolk Island", "code": "NF", "dial_code": ""},
  {"flag": "🇳🇬", "name": "Nigeria", "code": "NG", "dial_code": ""},
  {"flag": "🇳🇮", "name": "Nicaragua", "code": "NI", "dial_code": ""},
  {"flag": "🇳🇺", "name": "Niue", "code": "NU", "dial_code": ""},
  {"flag": "🇳🇱", "name": "Netherlands", "code": "NL", "dial_code": ""},
  {"flag": "🇳🇴", "name": "Norway", "code": "NO", "dial_code": ""},
  {"flag": "🇳🇵", "name": "Nepal", "code": "NP", "dial_code": ""},
  {"flag": "🇳🇷", "name": "Nauru", "code": "NR", "dial_code": ""},
  {"flag": "🇳🇿", "name": "New Zealand", "code": "NZ", "dial_code": ""},
  {"flag": "🇴🇲", "name": "Oman", "code": "OM", "dial_code": ""},
  {"flag": "🇵🇰", "name": "Pakistan", "code": "PK", "dial_code": ""},
  {"flag": "🇵🇦", "name": "Panama", "code": "PA", "dial_code": ""},
  {"flag": "🇵🇳", "name": "Pitcairn", "code": "PN", "dial_code": ""},
  {"flag": "🇵🇪", "name": "Peru", "code": "PE", "dial_code": ""},
  {"flag": "🇵🇭", "name": "Philippines", "code": "PH", "dial_code": ""},
  {"flag": "🇵🇼", "name": "Palau", "code": "PW", "dial_code": ""},
  {"flag": "🇵🇬", "name": "Papua New Guinea", "code": "PG", "dial_code": ""},
  {"flag": "🇵🇱", "name": "Poland", "code": "PL", "dial_code": ""},
  {"flag": "🇵🇷", "name": "Puerto Rico", "code": "PR", "dial_code": ""},
  {
    "flag": "🇰🇵",
    "name": "Korea, Democratic People's Republic of",
    "code": "KP",
    "dial_code": ""
  },
  {"flag": "🇵🇹", "name": "Portugal", "code": "PT", "dial_code": ""},
  {"flag": "🇵🇾", "name": "Paraguay", "code": "PY", "dial_code": ""},
  {
    "flag": "🇵🇸",
    "name": "Palestine, State of",
    "code": "PS",
    "dial_code": ""
  },
  {"flag": "🇵🇫", "name": "French Polynesia", "code": "PF", "dial_code": ""},
  {"flag": "🇶🇦", "name": "Qatar", "code": "QA", "dial_code": ""},
  {"flag": "🇷🇪", "name": "Réunion", "code": "RE", "dial_code": ""},
  {"flag": "🇷🇴", "name": "Romania", "code": "RO", "dial_code": ""},
  {"flag": "🇷🇺", "name": "Russian Federation", "code": "RU", "dial_code": ""},
  {"flag": "🇷🇼", "name": "Rwanda", "code": "RW", "dial_code": ""},
  {"flag": "🇸🇦", "name": "Saudi Arabia", "code": "SA", "dial_code": ""},
  {"flag": "🇸🇩", "name": "Sudan", "code": "SD", "dial_code": ""},
  {"flag": "🇸🇳", "name": "Senegal", "code": "SN", "dial_code": ""},
  {"flag": "🇸🇬", "name": "Singapore", "code": "SG", "dial_code": ""},
  {
    "flag": "🇬🇸",
    "name": "South Georgia and the South Sandwich Islands",
    "code": "GS",
    "dial_code": ""
  },
  {
    "flag": "🇸🇭",
    "name": "Saint Helena, Ascension and Tristan da Cunha",
    "code": "SH",
    "dial_code": ""
  },
  {
    "flag": "🇸🇯",
    "name": "Svalbard and Jan Mayen",
    "code": "SJ",
    "dial_code": ""
  },
  {"flag": "🇸🇧", "name": "Solomon Islands", "code": "SB", "dial_code": ""},
  {"flag": "🇸🇱", "name": "Sierra Leone", "code": "SL", "dial_code": ""},
  {"flag": "🇸🇻", "name": "El Salvador", "code": "SV", "dial_code": ""},
  {"flag": "🇸🇲", "name": "San Marino", "code": "SM", "dial_code": ""},
  {"flag": "🇸🇴", "name": "Somalia", "code": "SO", "dial_code": ""},
  {
    "flag": "🇵🇲",
    "name": "Saint Pierre and Miquelon",
    "code": "PM",
    "dial_code": ""
  },
  {"flag": "🇷🇸", "name": "Serbia", "code": "RS", "dial_code": ""},
  {"flag": "🇸🇸", "name": "South Sudan", "code": "SS", "dial_code": ""},
  {
    "flag": "🇸🇹",
    "name": "Sao Tome and Principe",
    "code": "ST",
    "dial_code": ""
  },
  {"flag": "🇸🇷", "name": "Suriname", "code": "SR", "dial_code": ""},
  {"flag": "🇸🇰", "name": "Slovakia", "code": "SK", "dial_code": ""},
  {"flag": "🇸🇮", "name": "Slovenia", "code": "SI", "dial_code": ""},
  {"flag": "🇸🇪", "name": "Sweden", "code": "SE", "dial_code": ""},
  {"flag": "🇸🇿", "name": "Eswatini", "code": "SZ", "dial_code": ""},
  {
    "flag": "🇸🇽",
    "name": "Sint Maarten (Dutch part)",
    "code": "SX",
    "dial_code": ""
  },
  {"flag": "🇸🇨", "name": "Seychelles", "code": "SC", "dial_code": ""},
  {
    "flag": "🇸🇾",
    "name": "Syrian Arab Republic",
    "code": "SY",
    "dial_code": ""
  },
  {
    "flag": "🇹🇨",
    "name": "Turks and Caicos Islands",
    "code": "TC",
    "dial_code": ""
  },
  {"flag": "🇹🇩", "name": "Chad", "code": "TD", "dial_code": ""},
  {"flag": "🇹🇬", "name": "Togo", "code": "TG", "dial_code": ""},
  {"flag": "🇹🇭", "name": "Thailand", "code": "TH", "dial_code": ""},
  {"flag": "🇹🇯", "name": "Tajikistan", "code": "TJ", "dial_code": ""},
  {"flag": "🇹🇰", "name": "Tokelau", "code": "TK", "dial_code": ""},
  {"flag": "🇹🇲", "name": "Turkmenistan", "code": "TM", "dial_code": ""},
  {"flag": "🇹🇱", "name": "Timor-Leste", "code": "TL", "dial_code": ""},
  {"flag": "🇹🇴", "name": "Tonga", "code": "TO", "dial_code": ""},
  {
    "flag": "🇹🇹",
    "name": "Trinidad and Tobago",
    "code": "TT",
    "dial_code": ""
  },
  {"flag": "🇹🇳", "name": "Tunisia", "code": "TN", "dial_code": ""},
  {"flag": "🇹🇷", "name": "Turkey", "code": "TR", "dial_code": ""},
  {"flag": "🇹🇻", "name": "Tuvalu", "code": "TV", "dial_code": ""},
  {
    "flag": "🇹🇼",
    "name": "Taiwan, Province of China",
    "code": "TW",
    "dial_code": ""
  },
  {
    "flag": "🇹🇿",
    "name": "Tanzania, United Republic of",
    "code": "TZ",
    "dial_code": ""
  },
  {"flag": "🇺🇬", "name": "Uganda", "code": "UG", "dial_code": ""},
  {"flag": "🇺🇦", "name": "Ukraine", "code": "UA", "dial_code": ""},
  {
    "flag": "🇺🇲",
    "name": "United States Minor Outlying Islands",
    "code": "UM",
    "dial_code": ""
  },
  {"flag": "🇺🇾", "name": "Uruguay", "code": "UY", "dial_code": ""},
  {"flag": "🇺🇸", "name": "United States", "code": "US", "dial_code": "+1"},
  {"flag": "🇺🇿", "name": "Uzbekistan", "code": "UZ", "dial_code": ""},
  {
    "flag": "🇻🇦",
    "name": "Holy See (Vatican City State)",
    "code": "VA",
    "dial_code": ""
  },
  {
    "flag": "🇻🇨",
    "name": "Saint Vincent and the Grenadines",
    "code": "VC",
    "dial_code": ""
  },
  {
    "flag": "🇻🇪",
    "name": "Venezuela, Bolivarian Republic of",
    "code": "VE",
    "dial_code": ""
  },
  {
    "flag": "🇻🇬",
    "name": "Virgin Islands, British",
    "code": "VG",
    "dial_code": ""
  },
  {
    "flag": "🇻🇮",
    "name": "Virgin Islands, U.S.",
    "code": "VI",
    "dial_code": ""
  },
  {"flag": "🇻🇳", "name": "Viet Nam", "code": "VN", "dial_code": ""},
  {"flag": "🇻🇺", "name": "Vanuatu", "code": "VU", "dial_code": ""},
  {"flag": "🇼🇫", "name": "Wallis and Futuna", "code": "WF", "dial_code": ""},
  {"flag": "🇼🇸", "name": "Samoa", "code": "WS", "dial_code": ""},
  {"flag": "🇾🇪", "name": "Yemen", "code": "YE", "dial_code": ""},
  {"flag": "🇿🇦", "name": "South Africa", "code": "ZA", "dial_code": "+27"},
  {"flag": "🇿🇲", "name": "Zambia", "code": "ZM", "dial_code": ""},
  {"flag": "🇿🇼", "name": "Zimbabwe", "code": "ZW", "dial_code": ""}
];
