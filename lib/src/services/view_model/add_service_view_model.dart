import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
import 'package:carezyadminapp/src/services/repo/service_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';

import '../../../res/enums/enums.dart';
import '../../../services/get_it.dart';

class AddServiceViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<ServiceRepo>();
  final custRepo = getIt.get<CustomerRepo>();

  List<Garage> garageList = [];
  Garage? selectedGarage;

  List<Customer> customerList = [];
  Customer? selectedCustomer;

  bool enableButton = false;

  /// Engine Data Variables
  Selection? engineOil;
  String? oilLife;
  String? nextOilChangeODO;
  Selection? oilFilter;
  Selection? airFilter;
  Selection? acFilter;
  Selection? sparkPlug;
  Selection? ignitionCoil;
  Selection? valveCowerGasket;
  Selection? plugSeal;
  Selection? engineBelt;
  Selection? engineBeltTentioner;
  Selection? idlPulley;
  Selection? injectors;
  Selection? selfMotor;
  Selection? engineMount;
  String? numberOfEngineMounts;

  /// Gear Data Variables
  Selection? gearOil;
  String? gearOilLife;
  String? nextGearOilChangeODO;
  Selection? gearFilter;
  Selection? fourWheelOil;
  String? fourOilLife;
  String? nextFourOilChangeODO;
  Selection? transmissionControlModule;
  Selection? gearGasket;
  Selection? gearMount;
  String? noOfGearMounts;

  /// Differential Data Variables
  Selection? frontDifferentialOil;
  String? frontDifferentialOilLife;
  String? nextFrontDifferentialOilChangeODO;
  Selection? shaftStatus;
  Selection? shaftSeals;
  Selection? rearDifferentialOil;
  String? rearDifferentialOilLife;
  String? nextRearDifferentialOilChangeODO;
  Selection? differentialBushes;

  /// Break System Data Variables
  Selection? flBreakDisc;
  String? flbdPercentage;
  Selection? frBreakDisc;
  String? frbdPercentage;
  Selection? rlBreakDisc;
  String? rlbdPercentage;
  Selection? rrBreakDisc;
  String? rrbdPercentage;
  Selection? fbPad;
  String? fbPadPercentage;
  Selection? rbPad;
  String? rbPadPercentage;
  Selection? rbShoe;
  String? rbShoePercentage;
  Selection? breakFluid;
  String? breakFluidPercentage;

  /// Suspension System Data Variables
  SuspensionSelection? flla;
  SuspensionSelection? frla;
  SuspensionSelection? rlla;
  SuspensionSelection? rrla;
  SuspensionSelection? uafl;
  SuspensionSelection? uafr;
  SuspensionSelection? tar;
  SuspensionSelection? abli;
  SuspensionSelection? abri;
  SuspensionSelection? abro;
  SuspensionSelection? ablo;
  SuspensionSelection? lrfl;
  SuspensionSelection? lrfr;
  SuspensionSelection? lrrl;
  SuspensionSelection? lrrr;
  SuspensionSelection? brbf;
  SuspensionSelection? brbr;

  /// AC Data Variables
  Selection? acGas;
  Selection? compressor;
  Selection? condenser;
  Selection? evaporator;
  Selection? exValve;

  /// Steering System Data Variables
  Selection? sbl;
  Selection? sbr;
  Selection? sel;
  Selection? ser;
  Selection? bjl;
  Selection? bjr;

  /// Light System Data Variables
  LightSelection? headLight;
  LightSelection? parkLight;
  LightSelection? indicators;
  LightSelection? reverseGearLight;
  LightSelection? dimBright;
  LightSelection? fogLamps;

  /// Fuel System Data Variables
  Selection? fuelPump;
  Selection? fuelFilter;
  Selection? canister;
  Selection? fuelTank;

  /// Tyre Pressure Data Variables
  String? frPressure;
  String? flPressure;
  String? rrPressure;
  String? rlPressure;

  /// Other Data Variables
  Selection? centerLock;
  String? clRemarks;
  Selection? windowLifter;
  String? wlRemarks;
  Selection? alignment;
  Selection? wheelBalance;
  Selection? wiperBladeFront;
  Selection? wiperBladeRear;

  //
  update({required Function() callBack}) {
    callBack.call();
    notifyListeners();
  }

  checkAddButtonEnable() {
    enableButton = selectedCustomer != null && selectedGarage != null;
    notifyListeners();
  }

  Future<bool?> getGarages() async {
    garageList = [];
    updateGarageLoader(true);
    return await custRepo.getGarages().fold(
      (left) {
        updateGarageLoader(false);
        return false;
      },
      (right) {
        updateGarageLoader(false);
        garageList = [];
        final isSuccess = right.status ?? false;
        garageList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateGarageLoader(false);
      return false;
    });
  }

  String getSelection({Selection? selection}) {
    return switch (selection) {
      Selection.changed => "Changed",
      Selection.notChanged => "Not Changed",
      null => '',
    };
  }

  String getSuspensionSelection({SuspensionSelection? selection}) {
    return switch (selection) {
      SuspensionSelection.changed => "Changed",
      SuspensionSelection.notChanged => "Not Changed",
      SuspensionSelection.bush => "Bush",
      null => '',
    };
  }

  String getLampSelection({LightSelection? selection}) {
    return switch (selection) {
      LightSelection.changed => "Changed",
      LightSelection.notChanged => "Not Changed",
      LightSelection.lampReplace => "Lamp Replace",
      null => '',
    };
  }

  Map<String, dynamic> get params => {
        "customer_id": selectedCustomer?.id,
        "garage": selectedGarage?.id,
        "engine": [
          if (engineOil != null)
            {
              "component": 1,
              "status": getSelection(selection: engineOil),
              "oil_life": oilLife ?? "",
              "next_service_odo": nextOilChangeODO ?? ""
            },
          if (oilFilter != null)
            {"component": 2, "status": getSelection(selection: oilFilter)},
          if (airFilter != null)
            {"component": 3, "status": getSelection(selection: airFilter)},
          if (acFilter != null)
            {"component": 4, "status": getSelection(selection: acFilter)},
          if (sparkPlug != null)
            {"component": 5, "status": getSelection(selection: sparkPlug)},
          if (ignitionCoil != null)
            {"component": 6, "status": getSelection(selection: ignitionCoil)},
          if (valveCowerGasket != null)
            {
              "component": 7,
              "status": getSelection(selection: valveCowerGasket)
            },
          if (plugSeal != null)
            {"component": 8, "status": getSelection(selection: plugSeal)},
          if (engineBelt != null)
            {"component": 9, "status": getSelection(selection: engineBelt)},
          if (engineBeltTentioner != null)
            {
              "component": 10,
              "status": getSelection(selection: engineBeltTentioner)
            },
          if (idlPulley != null)
            {"component": 11, "status": getSelection(selection: idlPulley)},
          if (injectors != null)
            {"component": 12, "status": getSelection(selection: injectors)},
          if (selfMotor != null)
            {"component": 13, "status": getSelection(selection: selfMotor)},
          if (engineMount != null)
            {
              "component": 14,
              "status": getSelection(selection: engineMount),
              "no_of_mounts": numberOfEngineMounts ?? ''
            },
        ],
        "gear": [
          if (gearOil != null)
            {
              "component": 1,
              "status": getSelection(selection: gearOil),
              "oil_life": oilLife ?? '',
              "next_service_odo": nextOilChangeODO ?? ""
            },
          if (gearFilter != null)
            {"component": 2, "status": getSelection(selection: gearFilter)},
          if (gearGasket != null)
            {"component": 3, "status": getSelection(selection: gearGasket)},
          if (fourWheelOil != null)
            {
              "component": 4,
              "status": getSelection(selection: fourWheelOil),
              "oil_life": fourOilLife ?? '',
              "next_service_odo": nextFourOilChangeODO ?? ""
            },
          if (transmissionControlModule != null)
            {
              "component": 5,
              "status": getSelection(selection: transmissionControlModule)
            },
          if (gearMount != null)
            {
              "component": 6,
              "status": getSelection(selection: gearMount),
              "no_of_mounts": noOfGearMounts ?? ''
            },
        ],
        "differential": [
          if (frontDifferentialOil != null)
            {
              "component": 1,
              "status": getSelection(selection: frontDifferentialOil),
              "oil_life": frontDifferentialOilLife ?? '',
              "next_service_odo": nextFrontDifferentialOilChangeODO ?? ""
            },
          if (rearDifferentialOil != null)
            {
              "component": 2,
              "status": getSelection(selection: rearDifferentialOil),
              "oil_life": rearDifferentialOilLife ?? '',
              "next_service_odo": nextRearDifferentialOilChangeODO ?? ""
            },
          if (differentialBushes != null)
            {
              "component": 3,
              "status": getSelection(selection: differentialBushes)
            },
          if (shaftStatus != null)
            {"component": 4, "status": getSelection(selection: shaftStatus)},
          if (shaftSeals != null)
            {"component": 5, "status": getSelection(selection: shaftSeals)}
        ],
        "break": [
          {
            "component": 1,
            "status": getSelection(selection: flBreakDisc),
            "thickness": flbdPercentage ?? ""
          },
          {
            "component": 2,
            "status": getSelection(selection: frBreakDisc),
            "thickness": frbdPercentage ?? ""
          },
          {
            "component": 3,
            "status": getSelection(selection: rlBreakDisc),
            "thickness": rlbdPercentage ?? ""
          },
          {
            "component": 4,
            "status": getSelection(selection: rrBreakDisc),
            "thickness": rrbdPercentage ?? ""
          },
          {
            "component": 5,
            "status": getSelection(selection: fbPad),
            "thickness": fbPadPercentage ?? ""
          },
          {
            "component": 6,
            "status": getSelection(selection: rbPad),
            "thickness": rbPadPercentage ?? ""
          },
          {
            "component": 7,
            "status": getSelection(selection: rbShoe),
            "thickness": rbShoePercentage ?? ""
          },
          {
            "component": 8,
            "status": getSelection(selection: breakFluid),
            "thickness": breakFluidPercentage ?? ""
          },
        ],
        "suspension": [
          {"component": 1, "status": getSuspensionSelection(selection: flla)},
          {"component": 2, "status": getSuspensionSelection(selection: frla)},
          {"component": 3, "status": getSuspensionSelection(selection: rlla)},
          {"component": 4, "status": getSuspensionSelection(selection: rrla)},
          {"component": 5, "status": getSuspensionSelection(selection: uafl)},
          {"component": 6, "status": getSuspensionSelection(selection: uafr)},
          {"component": 7, "status": getSuspensionSelection(selection: tar)},
          {"component": 8, "status": getSuspensionSelection(selection: abli)},
          {"component": 9, "status": getSuspensionSelection(selection: abri)},
          {"component": 10, "status": getSuspensionSelection(selection: abro)},
          {"component": 11, "status": getSuspensionSelection(selection: ablo)},
          {"component": 12, "status": getSuspensionSelection(selection: lrfl)},
          {"component": 13, "status": getSuspensionSelection(selection: lrfr)},
          {"component": 14, "status": getSuspensionSelection(selection: lrrl)},
          {"component": 15, "status": getSuspensionSelection(selection: lrrr)},
          {"component": 16, "status": getSuspensionSelection(selection: brbf)},
          {"component": 17, "status": getSuspensionSelection(selection: brbr)},
        ],
        "ac": [
          {"component": 1, "status": getSelection(selection: acGas)},
          {"component": 2, "status": getSelection(selection: compressor)},
          {"component": 3, "status": getSelection(selection: condenser)},
          {"component": 4, "status": getSelection(selection: evaporator)},
          {"component": 5, "status": getSelection(selection: exValve)}
        ],
        "steering": [
          {"component": 1, "status": getSelection(selection: sbl)},
          {"component": 2, "status": getSelection(selection: sbr)},
          {"component": 3, "status": getSelection(selection: sel)},
          {"component": 4, "status": getSelection(selection: ser)},
          {"component": 5, "status": getSelection(selection: bjl)},
          {"component": 6, "status": getSelection(selection: bjr)},
        ],
        "light": [
          {"component": 1, "status": getLampSelection(selection: headLight)},
          {"component": 2, "status": getLampSelection(selection: parkLight)},
          {"component": 3, "status": getLampSelection(selection: indicators)},
          {
            "component": 4,
            "status": getLampSelection(selection: reverseGearLight)
          },
          {"component": 5, "status": getLampSelection(selection: dimBright)},
          {"component": 6, "status": getLampSelection(selection: fogLamps)},
        ],
        "fuel": [
          {"component": 1, "status": getSelection(selection: fuelPump)},
          {"component": 2, "status": getSelection(selection: fuelFilter)},
          {"component": 3, "status": getSelection(selection: canister)},
          {"component": 4, "status": getSelection(selection: fuelTank)},
        ],
        "other": [
          {
            "component": 1,
            "status": getSelection(selection: centerLock),
            "remarks": clRemarks ?? ""
          },
          {
            "component": 2,
            "status": getSelection(selection: windowLifter),
            "remarks": wlRemarks ?? ""
          },
          {"component": 3, "status": getSelection(selection: alignment)},
          {"component": 4, "status": getSelection(selection: wheelBalance)},
          {"component": 5, "status": getSelection(selection: wiperBladeFront)},
          {"component": 6, "status": getSelection(selection: wiperBladeRear)},
          {
            "component": 7,
            "front_right": frPressure,
            "front_left": flPressure,
            "rear_right": rrPressure,
            "rear_left": rlPressure
          }
        ]
      };

  Future<bool?> addService() async {
    updateLoader(true);
    return await repo.addService(params: params).fold(
      (left) {
        updateLoader(false);
        return false;
      },
      (right) {
        bool isSuccess = right['status'] ?? false;
        updateLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  Future<bool?> searchCustomers(String phoneNumber) async {
    customerList = [];
    updateSearchLoader(true);
    return await repo.getCustomers(phoneNumber: phoneNumber).fold(
      (left) {
        updateSearchLoader(false);
        return false;
      },
      (right) {
        customerList = [];
        final isSuccess = right.status ?? false;
        customerList.addAll(right.results?.data ?? []);
        updateSearchLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateSearchLoader(false);
      return false;
    });
  }

  @override
  updateLoader(bool value) {
    isServiceAdding = value;
    notifyListeners();
  }

  @override
  updateGarageLoader(bool value) {
    isGarageLoader = value;
    notifyListeners();
  }

  @override
  updateSearchLoader(bool value) {
    isSearchLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isServiceAdding = false;
  bool isGarageLoader = false;
  bool isSearchLoading = false;
  updateLoader(bool value);
  updateGarageLoader(bool value);
  updateSearchLoader(bool value);
}
