import 'dart:convert';
import 'dart:developer';

import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
import 'package:carezyadminapp/src/services/repo/service_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../res/enums/enums.dart';
import '../../../services/get_it.dart';

class AddServiceViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<ServiceRepo>();
  final custRepo = getIt.get<CustomerRepo>();

  String? currentOodometerReading;
  String? nextServiceReading;

  List<Garage> garageList = [];
  Garage? selectedGarage;

  List<Customer> customerList = [];
  Customer? selectedCustomer;

  bool enableButton = false;

  String? remainingOil;

  /// Engine Data Variables
  Selection? engineOil;
  String? oilLife;
  //
  Selection? oilFilter;
  String? oilFilterLife;
  //
  Selection? airFilter;
  String? airFilterLife;
  //
  Selection? acFilter;
  String? acFilterLife;
  //
  Selection? sparkPlug;
  String? sparkPlugLife;
  //
  Selection? ignitionCoil;
  String? ignitionCoilLife;
  //
  Selection? valveCowerGasket;
  String? valveCowerGasketLife;
  //
  Selection? plugSeal;
  String? plugSealLife;
  //
  Selection? engineBelt;
  String? engineBeltLife;
  //
  Selection? engineBeltTentioner;
  String? engineBeltTentionerLife;
  //
  Selection? idlPulley;
  String? idlPulleyLife;
  //
  Selection? injectors;
  String? injectorsLife;
  //
  Selection? selfMotor;
  String? selfMotorLife;

  Selection? radiator;
  String? radiatorLife;
  String? radiatorPercentage;

  Selection? radiatorHose;
  String? radiatorHoseLife;
  String? radiatorHosePercentage;

  Selection? thermostat;
  String? thermostatLife;
  String? thermostatPercentage;

  Selection? engineCoolar;
  String? engineCoolarLife;
  String? engineCoolarPercentage;

  Selection? radiatorCap;
  String? radiatorCapLife;
  String? radiatorCapPercentage;

  Selection? coolantSpareTank;
  String? coolantSpareTankLife;
  String? coolantSpareTankPercentage;

  Selection? radiatorFanMotor;
  String? radiatorFanMotorLife;
  String? radiatorFanMotorPercentage;

  Selection? engineColant;
  String? engineCoolantLife;

  //
  Selection? engineCoolantLevel;
  String? engineCoolantLevelLife;
  String? engineCoolantLevelPercentage;

  //
  Selection? engineMount;
  String? engineMountLife;
  //
  String? numberOfEngineMounts;

  //? -------

  final remainingOilController = TextEditingController();
  final nextOilChangeODOlController = TextEditingController();
  final currentODOController = TextEditingController();

  //! Oil filter
  final remainingOilFilterController = TextEditingController();
  final oilFilterOdoController = TextEditingController();

  //! ----------
  //-----------
  //! Air Filter
  final remainingAirFilterController = TextEditingController();
  final nextAirFilterChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! AC Filter
  final remainingAcFilterController = TextEditingController();
  final nextAcFilterChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Spark Plug
  final remainingSparkPlugController = TextEditingController();
  final nextSparkPlugChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Ignition Coil
  final remainingIgnitionCoilController = TextEditingController();
  final nextIgnitionCoilChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Valve Cower Gasket
  final remainingValveCowerGasketController = TextEditingController();
  final nextValveCowerGasketChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Plug Seal
  final remainingPlugSealController = TextEditingController();
  final nextPlugSealChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Engine Belt
  final remainingEngineBeltController = TextEditingController();
  final nextEngineBeltChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Engine Belt Tentioner
  final remainingEngineBeltTentionerController = TextEditingController();
  final nextEngineBeltTentionerChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! IDL Pulley
  final remainingIDLPulleyController = TextEditingController();
  final nextIDLPulleyChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Injectors
  final remainingInjectorsController = TextEditingController();
  final nextInjectorsChangeODOlController = TextEditingController();

  //! ----------
  //-----------
  //! Self Motor
  final remainingSelfMotorController = TextEditingController();
  final nextSelfMotorChangeODOlController = TextEditingController();

  //! Engine Coolant
  final remainingEngineCoolantLevelController = TextEditingController();
  final nextEngineCoolantLevelController = TextEditingController();

  //! ----------
  //-----------
  //! Engine Mount
  final remainingEngineMountController = TextEditingController();
  final nextEngineMountChangeODOlController = TextEditingController();

  //! ----------
  final remainingRadiatorController = TextEditingController();
  final nextRadiatorController = TextEditingController();
  //-----------
  final remainingRadiatorHoseController = TextEditingController();
  final nextRadiatorHoseController = TextEditingController();

  final remainingThermostatController = TextEditingController();
  final nextThermostatController = TextEditingController();

  final remainingCoolantController = TextEditingController();
  final nextCoolantController = TextEditingController();

  final remainingEngineCoolarController = TextEditingController();
  final nextEngineCoolarController = TextEditingController();

  final remainingRadiatorCapController = TextEditingController();
  final nextRadiatorCapController = TextEditingController();

  final remainingCoolantSpareTankController = TextEditingController();
  final nextCoolantSpareTankController = TextEditingController();

  final remainingRadiatorFanMotorController = TextEditingController();
  final nextRadiatorFanMotorController = TextEditingController();

  //! Engine Mount
  final remainingEngineMountController2 = TextEditingController();
  final nextEngineMountChangeODOlController2 = TextEditingController();

  //! ----------
  //! Gear Oil
  final remainingGearOilController = TextEditingController();
  final nextGearOilChangeODOlController = TextEditingController();

  //! ----------
  //! Transmission Control Oil
  final remainingTransmissionControlOilController = TextEditingController();
  final nextTransmissionControlOilChangeODOlController =
      TextEditingController();

  //! ----------
  //! Gear Gasket
  final remainingGearGasketController = TextEditingController();
  final nextGearGasketChangeODOlController = TextEditingController();

  //! ----------
  //! Gear Mount
  final remainingGearMountController = TextEditingController();
  final nextGearMountChangeODOlController = TextEditingController();

  //! ----------
  //! Gear Mount
  final remainingGearCoolarController = TextEditingController();
  final nextGearCoolarODOController = TextEditingController();

  //! ----------
  //! Shaft Status
  final remainingShaftStatusController = TextEditingController();
  final nextShaftStatusChangeODOlController = TextEditingController();

  //! ----------
  //! Shaft Seals
  final remainingShaftSealsController = TextEditingController();
  final nextShaftSealsChangeODOlController = TextEditingController();

  //! ----------
  //! Differential Bushes
  final remainingDifferentialBushesController = TextEditingController();
  final nextDifferentialBushesChangeODOlController = TextEditingController();

  //! ----------
  //! Front Left Break Disc
  final remainingFrontLeftBreakDiscController = TextEditingController();
  final nextFrontLeftBreakDiscChangeODOlController = TextEditingController();

  //! ----------
  //! Front Right Break Disc
  final remainingFrontRightBreakDiscController = TextEditingController();
  final nextFrontRightBreakDiscChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Left Break Disc
  final remainingRearLeftBreakDiscController = TextEditingController();
  final nextRearLeftBreakDiscChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Right Break Disc
  final remainingRearRightBreakDiscController = TextEditingController();
  final nextRearRightBreakDiscChangeODOlController = TextEditingController();

  //! ----------
  //! Front Break Pad
  final remainingFrontBreakPadController = TextEditingController();
  final nextFrontBreakPadChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Break Pad
  final remainingRearBreakPadController = TextEditingController();
  final nextRearBreakPadChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Break Shoe
  final remainingRearBreakShoeController = TextEditingController();
  final nextRearBreakShoeChangeODOlController = TextEditingController();

  //! ----------
  //! Break Fluid
  final remainingBreakFluidController = TextEditingController();
  final nextBreakFluidChangeODOlController = TextEditingController();

  //! ----------
  //! Front Left Lower Arm
  final remainingFrontLeftLowerArmController = TextEditingController();
  final nextFrontLeftLowerArmChangeODOlController = TextEditingController();

  //! ----------
  //! Front Right Lower Arm
  final remainingFrontRightLowerArmController = TextEditingController();
  final nextFrontRightLowerArmChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Left Lower Arm
  final remainingRearLeftLowerArmController = TextEditingController();
  final nextRearLeftLowerArmChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Right Lower Arm
  final remainingRearRightLowerArmController = TextEditingController();
  final nextRearRightLowerArmChangeODOlController = TextEditingController();

  //! ----------
  //! Upper Arm Front Left
  final remainingUpperArmFrontLeftController = TextEditingController();
  final nextUpperArmFrontLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Upper Arm Front Right
  final remainingUpperArmFrontRightController = TextEditingController();
  final nextUpperArmFrontRightChangeODOlController = TextEditingController();

  //! ----------
  //! Trailor Arm Rear
  final remainingTrailorArmRearController = TextEditingController();
  final nextTrailorArmRearChangeODOlController = TextEditingController();

  //! ----------
  //! Axle Boot Left Inner
  final remainingAxleBootLeftInnerController = TextEditingController();
  final nextAxleBootLeftInnerChangeODOlController = TextEditingController();

  //! ----------
  //! Axle Boot Right Inner
  final remainingAxleBootRightInnerController = TextEditingController();
  final nextAxleBootRightInnerChangeODOlController = TextEditingController();

  //! ----------
  //! Axle Boot Right Outer
  final remainingAxleBootRightOuterController = TextEditingController();

  final nextAxleBootRightOuterChangeODOlController = TextEditingController();

  //! ----------
  //! Axle Boot Left Outer
  final remainingAxleBootLeftOuterController = TextEditingController();
  final nextAxleBootLeftOuterChangeODOlController = TextEditingController();

  //! ----------
  //! Link Rod Front Left
  final remainingLinkRodFrontLeftController = TextEditingController();
  final nextLinkRodFrontLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Link Rod Front Right
  final remainingLinkRodFrontRightController = TextEditingController();

  final nextLinkRodFrontRightChangeODOlController = TextEditingController();

  //! ----------
  //! Link Rod Rear Left
  final remainingLinkRodRearLeftController = TextEditingController();

  final nextLinkRodRearLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Link Rod Rear Right
  final remainingLinkRodRearRightController = TextEditingController();

  final nextLinkRodRearRightChangeODOlController = TextEditingController();

  //! ----------
  //! Balance Rod Bush Front
  final remainingBalanceRodBushFrontController = TextEditingController();

  final nextBalanceRodBushFrontChangeODOlController = TextEditingController();

  //! ----------
  //! Balance Rod Bush Rear
  final remainingBalanceRodBushRearController = TextEditingController();

  final nextBalanceRodBushRearChangeODOlController = TextEditingController();

  //! ----------
  //! AC Gas
  final remainingAcGasController = TextEditingController();

  final nextAcGasChangeODOlController = TextEditingController();

  //! ----------
  //! Compressor
  final remainingCompressorController = TextEditingController();

  final nextCompressorChangeODOlController = TextEditingController();

  //! ----------
  //! Condenser
  final remainingCondenserController = TextEditingController();

  final nextCondenserChangeODOlController = TextEditingController();

  //! ----------
  //! Evaporator
  final remainingEvaporatorController = TextEditingController();

  final nextEvaporatorChangeODOlController = TextEditingController();

  //! ----------
  //! Ex Valve
  final remainingExValveController = TextEditingController();

  final nextExValveChangeODOlController = TextEditingController();

  //! ----------
  //! Steering Boot Left
  final remainingSteeringBootLeftController = TextEditingController();

  final nextSteeringBootLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Steering Boot Right
  final remainingSteeringBootRightController = TextEditingController();

  final nextSteeringBootRightChangeODOlController = TextEditingController();

  //! ----------
  //! Steering End Left
  final remainingSteeringEndLeftController = TextEditingController();

  final nextSteeringEndLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Steering End Right
  final remainingSteeringEndRightController = TextEditingController();

  final nextSteeringEndRightChangeODOlController = TextEditingController();

  //! ----------
  //! Ball Joint Left
  final remainingBallJointLeftController = TextEditingController();
  final nextBallJointLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Ball Joint Right
  final remainingBallJointRightController = TextEditingController();
  final nextBallJointRightChangeODOlController = TextEditingController();

  //! ----------
  //! Head Light
  final remainingHeadLightController = TextEditingController();
  final nextHeadLightChangeODOlController = TextEditingController();

  //! ----------
  //! Park Light
  final remainingParkLightController = TextEditingController();

  final nextParkLightChangeODOlController = TextEditingController();

  //! ----------
  //! Indicators
  final remainingIndicatorsController = TextEditingController();

  final nextIndicatorsChangeODOlController = TextEditingController();

  //! ----------
  //! Reverse Gear
  final remainingReverseGearController = TextEditingController();

  final nextReverseGearChangeODOlController = TextEditingController();

  //! ----------
  //! Dim Bright
  final remainingDimBrightController = TextEditingController();

  final nextDimBrightChangeODOlController = TextEditingController();

  //! ----------
  //! Fog Lamps
  final remainingFogLampsController = TextEditingController();

  final nextFogLampsChangeODOlController = TextEditingController();

  //! ----------
  //! Fuel Pump
  final remainingFuelPumpController = TextEditingController();

  final nextFuelPumpChangeODOlController = TextEditingController();

  //! ----------
  //! Fuel Filter
  final remainingFuelFilterController = TextEditingController();

  final nextFuelFilterChangeODOlController = TextEditingController();

  //! ----------
  //! Canister
  final remainingCanisterController = TextEditingController();

  final nextCanisterChangeODOlController = TextEditingController();

  //! ----------
  //! Fuel Tank
  final remainingFuelTankController = TextEditingController();

  final nextFuelTankChangeODOlController = TextEditingController();

  //! ----------
  //! Tyre Pressure Front Right
  final remainingTyrePressureFrontRightController = TextEditingController();

  final nextTyrePressureFrontRightChangeODOlController =
      TextEditingController();

  //! ----------
  //! Tyre Pressure Front Left
  final remainingTyrePressureFrontLeftController = TextEditingController();

  final nextTyrePressureFrontLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Tyre Pressure Rear Right
  final remainingTyrePressureRearRightController = TextEditingController();

  final nextTyrePressureRearRightChangeODOlController = TextEditingController();

  //! ----------
  //! Tyre Pressure Rear Left
  final remainingTyrePressureRearLeftController = TextEditingController();
  final nextTyrePressureRearLeftChangeODOlController = TextEditingController();

  //! ----------
  //! Gear Filter
  final remainingGearFilterController = TextEditingController();
  final nextGearFilterChangeODOlController = TextEditingController();

  //! ----------
  //! Four Wheel Oil
  final remainingFourWheelOilController = TextEditingController();
  final nextFourWheelOilChangeODOlController = TextEditingController();

  //! ----------

  /// Gear Data Variables
  Selection? gearOil;
  String? gearOilLife;
  Selection? gearFilter;
  String? gearFilterLife;
  Selection? fourWheelOil;
  String? fourOilLife;
  Selection? transmissionControlModule;
  String? transmissionControlModuleLife;
  Selection? gearGasket;
  String? gearGasketLife;
  Selection? gearMount;
  String? gearMountLife;
  String? noOfGearMounts;
  Selection? gearCoolar;
  String? gearCoolarLife;

  /// Differential Data Variables
  Selection? frontDifferentialOil;
  String? frontDifferentialOilLife;
  Selection? shaftStatus;
  String? shaftStatusLife;
  Selection? shaftSeals;
  String? shaftSealsLife;
  Selection? rearDifferentialOil;
  String? rearDifferentialOilLife;
  Selection? differentialBushes;
  String? differentialBushesLife;

  /// Break System Data Variables
  Selection? flBreakDisc;
  String? flbdPercentage;
  String? flBreakDiscLife;

  Selection? frBreakDisc;
  String? frbdPercentage;
  String? frBreakDiscLife;

  Selection? rlBreakDisc;
  String? rlbdPercentage;
  String? rlBreakDiscLife;

  Selection? rrBreakDisc;
  String? rrbdPercentage;
  String? rrBreakDiscLife;

  Selection? fbPad;
  String? fbPadPercentage;
  String? fbPadLife;

  Selection? rbPad;
  String? rbPadPercentage;
  String? rbPadLife;

  Selection? rbShoe;
  String? rbShoePercentage;
  String? rbShoeLife;

  Selection? breakFluid;
  String? breakFluidPercentage;
  String? breakFluidLife;

  /// Suspension System Data Variables
  SuspensionSelection? flla;
  String? fllaLife;

  SuspensionSelection? frla;
  String? frlaLife;

  SuspensionSelection? rlla;
  String? rllaLife;

  SuspensionSelection? rrla;
  String? rrlaLife;

  SuspensionSelection? uafl;
  String? uaflLife;

  SuspensionSelection? uafr;
  String? uafrLife;

  SuspensionSelection? tar;
  String? tarLife;

  SuspensionSelection? abli;
  String? abliLife;

  SuspensionSelection? abri;
  String? abriLife;

  SuspensionSelection? abro;
  String? abroLife;

  SuspensionSelection? ablo;
  String? abloLife;

  SuspensionSelection? lrfl;
  String? lrflLife;

  SuspensionSelection? lrfr;
  String? lrfrLife;

  SuspensionSelection? lrrl;
  String? lrrlLife;

  SuspensionSelection? lrrr;
  String? lrrrLife;

  SuspensionSelection? brbf;
  String? brbfLife;

  SuspensionSelection? brbr;
  String? brbrLife;

  SuspensionSelection? abrir;
  String? abrirLife;

  SuspensionSelection? abrrr;
  String? abrrrLife;

  SuspensionSelection? abror;
  String? abrorife;

  SuspensionSelection? ablor;
  String? ablorLife;

  SuspensionSelection? fshockl;
  String? fshocklLife;

  SuspensionSelection? fshockr;
  String? fshockrLife;

  SuspensionSelection? rshockl;
  String? rshocklLife;

  SuspensionSelection? rshockr;
  String? rshockrLife;

  SuspensionSelection? wlbearfl;
  String? wlbearflLife;

  SuspensionSelection? wlbearfr;
  String? wlbearfrLife;

  SuspensionSelection? wlbearrl;
  String? wlbearrlLife;

  SuspensionSelection? wlbearrr;
  String? wlbearrrLife;

  /// AC Data Variables
  Selection? acGas;
  String? acGasLife;

  Selection? compressor;
  String? compressorLife;

  Selection? condenser;
  String? condenserLife;

  Selection? evaporator;
  String? evaporatorLife;

  Selection? exValve;
  String? exValveLife;

  /// Steering System Data Variables
  Selection? sbl;
  String? sblLife;

  Selection? sbr;
  String? sbrLife;

  Selection? sel;
  String? selLife;

  Selection? ser;
  String? serLife;

  Selection? bjl;
  String? bjlLife;

  Selection? bjr;
  String? bjrLife;

  /// Light System Data Variables
  LightSelection? headLight;
  String? headLightLife;

  LightSelection? parkLight;
  String? parkLightLife;

  LightSelection? indicators;
  String? indicatorsLife;

  LightSelection? reverseGearLight;
  String? reverseGearLightLife;

  LightSelection? dimBright;
  String? dimBrightLife;

  LightSelection? fogLamps;
  String? fogLampsLife;

  /// Fuel System Data Variables
  Selection? fuelPump;
  String? fuelPumpLife;

  Selection? fuelFilter;
  String? fuelFilterLife;

  Selection? canister;
  String? canisterLife;

  Selection? fuelTank;
  String? fuelTankLife;

  /// Tyre Pressure Data Variables
  String? frPressure;
  String? flPressure;
  String? rrPressure;
  String? rlPressure;

  /// Other Data Variables
  Selection? centerLock;
  String? clRemarks;
  String? centerLockLife;
  Selection? windowLifter;
  String? wlRemarks;
  String? windowLifterLife;
  Selection? alignment;
  String? alignmentLife;
  Selection? wheelBalance;
  String? wheelBalanceLife;

  Selection? wiperBladeFront;
  Selection? wiperBladeRear;
  Selection? batterySelection;
  String? batteryAmpere;
  String? batteryBrand;
  String? batteryType;

  //! Alignment
  final remainingAlignmentController = TextEditingController();
  String? remainingAlignment;
  final nextAlignmentChangeODOlController = TextEditingController();
  String? nextAlignmentChangeODO;

  //! ----------
  //! Wheel Balance
  final remainingWheelBalanceController = TextEditingController();
  String? remainingWheelBalance;
  final nextWheelBalanceChangeODOlController = TextEditingController();
  String? nextWheelBalanceChangeODO;

  //! ----------
  //! Wiper Blade Front
  final remainingWiperBladeFrontController = TextEditingController();
  String? remainingWiperBladeFront;
  final nextWiperBladeFrontChangeODOlController = TextEditingController();
  String? nextWiperBladeFrontChangeODO;

  //! ----------
  //! Wiper Blade Rear
  final remainingWiperBladeRearController = TextEditingController();
  String? remainingWiperBladeRear;
  final nextWiperBladeRearChangeODOlController = TextEditingController();
  String? nextWiperBladeRearChangeODO;

  //! ----------
  //! Front Differential Oil
  final frontDifferentialOilLifeController = TextEditingController();
  final nextFrontDifferentialOilChangeODOlController = TextEditingController();

  //! ----------
  //! Rear Differential Oil
  final rearDifferentialOilLifeController = TextEditingController();
  final nextRearDifferentialOilChangeODOlController = TextEditingController();

  //! ----------
  //! Center Lock
  final remainingCenterLockController = TextEditingController();
  String? remainingCenterLock;
  final nextCenterLockChangeODOlController = TextEditingController();
  String? nextCenterLockChangeODO;

  //! ----------
  //! Window Lifter
  final remainingWindowLifterController = TextEditingController();
  String? remainingWindowLifter;
  final nextWindowLifterChangeODOlController = TextEditingController();
  String? nextWindowLifterChangeODO;

  final remainingAbriRearController = TextEditingController();
  final nextAbriRearChangeODOController = TextEditingController();

  final remainingAbrrRearController = TextEditingController();
  final nextAbrrRearChangeODOController = TextEditingController();

  final remainingAbroRearController = TextEditingController();
  final nextAbroRearChangeODOController = TextEditingController();

  final remainingAbloRearController = TextEditingController();
  final nextAbloRearChangeODOController = TextEditingController();

  final remainingFshocklController = TextEditingController();
  final nextFshocklChangeODOController = TextEditingController();

  final remainingFshockrController = TextEditingController();
  final nextFshockrChangeODOController = TextEditingController();

  final remainingRshocklController = TextEditingController();
  final nextRshocklChangeODOController = TextEditingController();

  final remainingRshockrController = TextEditingController();
  final nextRshockrChangeODOController = TextEditingController();

  final remainingWlbearflController = TextEditingController();
  final nextWlbearflChangeODOController = TextEditingController();

  final remainingWlbearfrController = TextEditingController();
  final nextWlbearfrChangeODOController = TextEditingController();

  final remainingWlbearrlController = TextEditingController();
  final nextWlbearrlChangeODOController = TextEditingController();

  final remainingWlbearrrController = TextEditingController();
  final nextWlbearrrChangeODOController = TextEditingController();

  //! ----------

  //
  update({required Function() callBack}) {
    callBack.call();
    notifyListeners();
  }

  checkAddButtonEnable() {
    enableButton = selectedCustomer != null && selectedGarage != null;
    notifyListeners();
  }

// Remaining values set automaticaly
  setValuesForAllRemainingFields() {
    // engine
    remainingOilController.text = remainingOil ?? '';
    remainingOilFilterController.text = remainingOil ?? '';
    remainingAirFilterController.text = remainingOil ?? '';
    remainingAcFilterController.text = remainingOil ?? '';
    remainingSparkPlugController.text = remainingOil ?? '';
    remainingIgnitionCoilController.text = remainingOil ?? '';
    remainingValveCowerGasketController.text = remainingOil ?? '';
    remainingPlugSealController.text = remainingOil ?? '';
    remainingEngineBeltController.text = remainingOil ?? '';
    remainingEngineBeltTentionerController.text = remainingOil ?? '';
    remainingIDLPulleyController.text = remainingOil ?? '';
    remainingInjectorsController.text = remainingOil ?? '';
    remainingSelfMotorController.text = remainingOil ?? '';
    remainingRadiatorController.text = remainingOil ?? '';
    remainingRadiatorHoseController.text = remainingOil ?? '';
    remainingThermostatController.text = remainingOil ?? '';
    remainingCoolantController.text = remainingOil ?? '';
    remainingEngineCoolarController.text = remainingOil ?? '';
    remainingRadiatorCapController.text = remainingOil ?? '';
    remainingCoolantSpareTankController.text = remainingOil ?? '';
    remainingRadiatorFanMotorController.text = remainingOil ?? '';
    remainingEngineCoolantLevelController.text = remainingOil ?? '';
    remainingEngineMountController.text = remainingOil ?? '';
    // gear
    remainingGearOilController.text = remainingOil ?? '';
    remainingGearFilterController.text = remainingOil ?? '';
    remainingFourWheelOilController.text = remainingOil ?? '';
    remainingTransmissionControlOilController.text = remainingOil ?? '';
    remainingGearGasketController.text = remainingOil ?? "";
    remainingGearMountController.text = remainingOil ?? "";
    remainingGearCoolarController.text = remainingOil ?? "";
    // differential
    frontDifferentialOilLifeController.text = remainingOil ?? "";
    remainingShaftStatusController.text = remainingOil ?? "";
    remainingShaftSealsController.text = remainingOil ?? "";
    rearDifferentialOilLifeController.text = remainingOil ?? "";
    remainingDifferentialBushesController.text = remainingOil ?? "";
    // break system
    remainingFrontLeftBreakDiscController.text = remainingOil ?? "";
    remainingFrontRightBreakDiscController.text = remainingOil ?? "";
    remainingRearLeftBreakDiscController.text = remainingOil ?? "";
    remainingRearRightBreakDiscController.text = remainingOil ?? "";
    remainingFrontBreakPadController.text = remainingOil ?? "";
    remainingRearBreakPadController.text = remainingOil ?? "";
    remainingRearBreakShoeController.text = remainingOil ?? "";
    remainingBreakFluidController.text = remainingOil ?? "";
    // suspension system
    remainingFrontLeftLowerArmController.text = remainingOil ?? "";
    remainingFrontRightLowerArmController.text = remainingOil ?? "";
    remainingRearLeftLowerArmController.text = remainingOil ?? "";
    remainingRearRightLowerArmController.text = remainingOil ?? "";
    remainingUpperArmFrontLeftController.text = remainingOil ?? "";
    remainingUpperArmFrontRightController.text = remainingOil ?? "";
    remainingTrailorArmRearController.text = remainingOil ?? "";
    remainingAxleBootLeftInnerController.text = remainingOil ?? "";
    remainingAxleBootRightInnerController.text = remainingOil ?? "";
    remainingAxleBootRightOuterController.text = remainingOil ?? "";
    remainingAxleBootLeftOuterController.text = remainingOil ?? "";
    remainingAbriRearController.text = remainingOil ?? "";
    remainingAbrrRearController.text = remainingOil ?? "";
    remainingAbroRearController.text = remainingOil ?? "";
    remainingAbloRearController.text = remainingOil ?? "";
    remainingLinkRodFrontLeftController.text = remainingOil ?? "";
    remainingLinkRodFrontRightController.text = remainingOil ?? "";
    remainingLinkRodRearLeftController.text = remainingOil ?? "";
    remainingLinkRodRearRightController.text = remainingOil ?? "";
    remainingBalanceRodBushFrontController.text = remainingOil ?? "";
    remainingBalanceRodBushRearController.text = remainingOil ?? "";
    remainingFshocklController.text = remainingOil ?? "";
    remainingFshockrController.text = remainingOil ?? "";
    remainingRshocklController.text = remainingOil ?? "";
    remainingRshockrController.text = remainingOil ?? "";
    remainingWlbearflController.text = remainingOil ?? "";
    remainingWlbearfrController.text = remainingOil ?? "";
    remainingWlbearrlController.text = remainingOil ?? "";
    remainingWlbearrrController.text = remainingOil ?? "";
    // ac compartments
    remainingAcGasController.text = remainingOil ?? "";
    remainingCompressorController.text = remainingOil ?? "";
    remainingCondenserController.text = remainingOil ?? "";
    remainingEvaporatorController.text = remainingOil ?? "";
    remainingExValveController.text = remainingOil ?? "";
    // steering
    remainingSteeringBootLeftController.text = remainingOil ?? "";
    remainingSteeringBootRightController.text = remainingOil ?? "";
    remainingSteeringEndLeftController.text = remainingOil ?? "";
    remainingSteeringEndRightController.text = remainingOil ?? "";
    remainingBallJointLeftController.text = remainingOil ?? "";
    remainingBallJointRightController.text = remainingOil ?? "";
    // light system
    remainingHeadLightController.text = remainingOil ?? "";
    remainingParkLightController.text = remainingOil ?? "";
    remainingIndicatorsController.text = remainingOil ?? "";
    remainingReverseGearController.text = remainingOil ?? "";
    remainingDimBrightController.text = remainingOil ?? "";
    remainingFogLampsController.text = remainingOil ?? "";
    // fuel system
    remainingFuelPumpController.text = remainingOil ?? "";
    remainingFuelFilterController.text = remainingOil ?? "";
    remainingCanisterController.text = remainingOil ?? "";
    remainingFuelTankController.text = remainingOil ?? "";
    // other accessories
    remainingCenterLockController.text = remainingOil ?? "";
    remainingWindowLifterController.text = remainingOil ?? "";
    remainingAlignmentController.text = remainingOil ?? "";
    remainingWheelBalanceController.text = remainingOil ?? "";

    if ((remainingOil?.isNotEmpty ?? false) &&
        (currentOodometerReading?.isNotEmpty ?? false)) {
      final value = (int.parse(remainingOil ?? '') +
              int.parse(currentOodometerReading ?? ''))
          .toString();

      // engine
      nextOilChangeODOlController.text = value;
      oilFilterOdoController.text = value;
      nextAirFilterChangeODOlController.text = value;
      nextAcFilterChangeODOlController.text = value;
      nextSparkPlugChangeODOlController.text = value;
      nextIgnitionCoilChangeODOlController.text = value;
      nextValveCowerGasketChangeODOlController.text = value;
      nextPlugSealChangeODOlController.text = value;
      nextEngineBeltChangeODOlController.text = value;
      nextEngineBeltTentionerChangeODOlController.text = value;
      nextIDLPulleyChangeODOlController.text = value;
      nextInjectorsChangeODOlController.text = value;
      nextSelfMotorChangeODOlController.text = value;
      nextRadiatorController.text = value;
      nextRadiatorHoseController.text = value;
      nextThermostatController.text = value;
      nextCoolantController.text = value;
      nextEngineCoolarController.text = value;
      nextRadiatorCapController.text = value;
      nextCoolantSpareTankController.text = value;
      nextRadiatorFanMotorController.text = value;
      nextEngineCoolantLevelController.text = value;
      nextEngineMountChangeODOlController.text = value;
      // gear
      nextGearOilChangeODOlController.text = value;
      nextGearFilterChangeODOlController.text = value;
      nextFourWheelOilChangeODOlController.text = value;
      nextTransmissionControlOilChangeODOlController.text = value;
      nextGearGasketChangeODOlController.text = value;
      nextGearMountChangeODOlController.text = value;
      nextGearCoolarODOController.text = value;
      // differential
      nextFrontDifferentialOilChangeODOlController.text = value;
      nextShaftStatusChangeODOlController.text = value;
      nextShaftSealsChangeODOlController.text = value;
      nextRearDifferentialOilChangeODOlController.text = value;
      nextDifferentialBushesChangeODOlController.text = value;
      // break system
      nextFrontLeftBreakDiscChangeODOlController.text = value;
      nextFrontRightBreakDiscChangeODOlController.text = value;
      nextRearLeftBreakDiscChangeODOlController.text = value;
      nextRearRightBreakDiscChangeODOlController.text = value;
      nextFrontBreakPadChangeODOlController.text = value;
      nextRearBreakPadChangeODOlController.text = value;
      nextRearBreakShoeChangeODOlController.text = value;
      nextBreakFluidChangeODOlController.text = value;
      // suspension system
      nextFrontLeftLowerArmChangeODOlController.text = value;
      nextFrontRightLowerArmChangeODOlController.text = value;
      nextRearLeftLowerArmChangeODOlController.text = value;
      nextRearRightLowerArmChangeODOlController.text = value;
      nextUpperArmFrontLeftChangeODOlController.text = value;
      nextUpperArmFrontRightChangeODOlController.text = value;
      nextTrailorArmRearChangeODOlController.text = value;
      nextAxleBootLeftInnerChangeODOlController.text = value;
      nextAxleBootRightInnerChangeODOlController.text = value;
      nextAxleBootRightOuterChangeODOlController.text = value;
      nextAxleBootLeftOuterChangeODOlController.text = value;
      nextAbriRearChangeODOController.text = value;
      nextAbrrRearChangeODOController.text = value;
      nextAbroRearChangeODOController.text = value;
      nextAbloRearChangeODOController.text = value;
      nextLinkRodFrontLeftChangeODOlController.text = value;
      nextLinkRodFrontRightChangeODOlController.text = value;
      nextLinkRodRearLeftChangeODOlController.text = value;
      nextLinkRodRearRightChangeODOlController.text = value;
      nextBalanceRodBushRearChangeODOlController.text = value;
      nextBalanceRodBushRearChangeODOlController.text = value;
      nextFshocklChangeODOController.text = value;
      nextFshockrChangeODOController.text = value;
      nextRshocklChangeODOController.text = value;
      nextRshockrChangeODOController.text = value;
      nextWlbearflChangeODOController.text = value;
      nextWlbearfrChangeODOController.text = value;
      nextWlbearrlChangeODOController.text = value;
      nextWlbearrrChangeODOController.text = value;
      // ac compartment
      nextAcGasChangeODOlController.text = value;
      nextCompressorChangeODOlController.text = value;
      nextCondenserChangeODOlController.text = value;
      nextEvaporatorChangeODOlController.text = value;
      nextExValveChangeODOlController.text = value;
      // steering system
      nextSteeringBootLeftChangeODOlController.text = value;
      nextSteeringBootRightChangeODOlController.text = value;
      nextSteeringEndLeftChangeODOlController.text = value;
      nextSteeringEndRightChangeODOlController.text = value;
      nextBallJointLeftChangeODOlController.text = value;
      nextBallJointRightChangeODOlController.text = value;
      // light system
      nextHeadLightChangeODOlController.text = value;
      nextParkLightChangeODOlController.text = value;
      nextIndicatorsChangeODOlController.text = value;
      nextReverseGearChangeODOlController.text = value;
      nextDimBrightChangeODOlController.text = value;
      nextFogLampsChangeODOlController.text = value;
      // fuel system
      nextFuelPumpChangeODOlController.text = value;
      nextFuelFilterChangeODOlController.text = value;
      nextCanisterChangeODOlController.text = value;
      nextFuelTankChangeODOlController.text = value;
      // other accessories
      nextCenterLockChangeODOlController.text = value;
      nextWindowLifterChangeODOlController.text = value;
      nextAlignmentChangeODOlController.text = value;
      nextWheelBalanceChangeODOlController.text = value;
    }
    notifyListeners();
  }

//

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

  Future<bool?> getOodoReadingAndOthers(int customerID) async {
    currentOodometerReading = null;
    updateOodoReading(true);
    return await custRepo.getOodoReading(customerID: customerID).fold(
      (left) {
        updateOodoReading(false);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        if (right.results?.data != null) {
          currentOodometerReading =
              right.results?.data?.currentKilometer ?? '0';
          currentODOController.text = currentOodometerReading ?? '__';
          // right.results?.data?.currentKilometer ?? '0';
        }
        updateOodoReading(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateOodoReading(false);
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
        "current_kilometer": currentOodometerReading,
        "engine": [
          {
            "component": 1,
            "status": getSelection(selection: engineOil),
            "oil_life": oilLife ?? "",
            "remaining_km": remainingOil ?? "",
            "next_service_odo": nextOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: oilFilter),
            "oil_life": oilFilterLife ?? "",
            "remaining_km": remainingOilFilterController.text,
            "next_service_odo": oilFilterOdoController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: airFilter),
            "oil_life": airFilterLife ?? "",
            "remaining_km": remainingAirFilterController.text,
            "next_service_odo": nextAirFilterChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: acFilter),
            "oil_life": acFilterLife ?? "",
            "remaining_km": remainingAcFilterController.text,
            "next_service_odo": nextAcFilterChangeODOlController.text,
          },
          {
            "component": 5,
            "oil_life": sparkPlugLife ?? "",
            "status": getSelection(selection: sparkPlug),
            "remaining_km": remainingSparkPlugController.text,
            "next_service_odo": nextSparkPlugChangeODOlController.text,
          },
          {
            "component": 6,
            "oil_life": ignitionCoilLife ?? "",
            "status": getSelection(selection: ignitionCoil),
            "remaining_km": remainingIgnitionCoilController.text,
            "next_service_odo": nextIgnitionCoilChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: valveCowerGasket),
            "oil_life": valveCowerGasketLife ?? "",
            "remaining_km": remainingValveCowerGasketController.text,
            "next_service_odo": nextValveCowerGasketChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSelection(selection: plugSeal),
            "oil_life": plugSealLife ?? "",
            "remaining_km": remainingPlugSealController.text,
            "next_service_odo": nextPlugSealChangeODOlController.text,
          },
          {
            "component": 9,
            "oil_life": engineBeltLife ?? "",
            "status": getSelection(selection: engineBelt),
            "remaining_km": remainingEngineBeltController.text,
            "next_service_odo": nextEngineBeltChangeODOlController.text,
          },
          {
            "component": 10,
            "oil_life": engineBeltTentionerLife ?? "",
            "status": getSelection(selection: engineBeltTentioner),
            "remaining_km": remainingEngineBeltTentionerController.text,
            "next_service_odo":
                nextEngineBeltTentionerChangeODOlController.text,
          },
          {
            "component": 11,
            "status": getSelection(selection: idlPulley),
            "oil_life": idlPulleyLife ?? "",
            "remaining_km": remainingIDLPulleyController.text,
            "next_service_odo": nextIDLPulleyChangeODOlController.text,
          },
          {
            "component": 12,
            "oil_life": injectorsLife ?? "",
            "status": getSelection(selection: injectors),
            "remaining_km": remainingInjectorsController.text,
            "next_service_odo": nextInjectorsChangeODOlController.text,
          },
          {
            "component": 13,
            "oil_life": selfMotorLife ?? "",
            "status": getSelection(selection: selfMotor),
            "remaining_km": remainingSelfMotorController.text,
            "next_service_odo": nextSelfMotorChangeODOlController.text,
          },
          {
            "component": 14,
            "status": getSelection(selection: engineMount),
            "no_of_mounts": numberOfEngineMounts ?? '',
            "oil_life": engineMountLife ?? "",
            "remaining_km": remainingEngineMountController.text,
            "next_service_odo": nextEngineMountChangeODOlController.text,
          },
          {
            "component": 15,
            "status": getSelection(selection: radiator),
            "oil_life": radiatorLife ?? "",
            "remaining_km": remainingRadiatorController.text,
            "next_service_odo": nextRadiatorController.text,
          },
          {
            "component": 16,
            "status": getSelection(selection: radiatorHose),
            "oil_life": radiatorHoseLife ?? "",
            "remaining_km": remainingRadiatorHoseController.text,
            "next_service_odo": nextRadiatorHoseController.text,
          },
          {
            "component": 17,
            "status": getSelection(selection: thermostat),
            "oil_life": thermostatLife ?? "",
            "remaining_km": remainingThermostatController.text,
            "next_service_odo": nextThermostatController.text,
          },
          {
            "component": 18,
            "status": getSelection(selection: engineColant),
            "oil_life": engineCoolantLife ?? "",
            "remaining_km": remainingCoolantController.text,
            "next_service_odo": nextCoolantController.text,
          },
          {
            "component": 19,
            "status": getSelection(selection: engineCoolar),
            "oil_life": engineCoolarLife ?? "",
            "remaining_km": remainingEngineCoolarController.text,
            "next_service_odo": nextEngineCoolarController.text,
          },
          {
            "component": 20,
            "status": getSelection(selection: radiatorCap),
            "oil_life": radiatorCapLife ?? "",
            "remaining_km": remainingRadiatorCapController.text,
            "next_service_odo": nextRadiatorCapController.text,
          },
          {
            "component": 21,
            "status": getSelection(selection: coolantSpareTank),
            "oil_life": coolantSpareTankLife ?? "",
            "remaining_km": remainingCoolantSpareTankController.text,
            "next_service_odo": nextCoolantSpareTankController.text,
          },
          {
            "component": 22,
            "status": getSelection(selection: radiatorFanMotor),
            "oil_life": radiatorFanMotorLife ?? "",
            "remaining_km": remainingRadiatorFanMotorController.text,
            "next_service_odo": nextRadiatorFanMotorController.text,
          },
          {
            "component": 23,
            "status": getSelection(selection: engineCoolantLevel),
            "oil_life": engineCoolantLevelLife ?? "",
            "remaining_km": remainingEngineCoolantLevelController.text,
            "next_service_odo": nextEngineCoolantLevelController.text,
            "percentage": engineCoolantLevelPercentage,
          },
        ],
        "gear": [
          {
            "component": 1,
            "status": getSelection(selection: gearOil),
            "oil_life": gearOilLife,
            "remaining_km": remainingGearOilController.text,
            "next_service_odo": nextGearOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: gearFilter),
            "oil_life": gearFilterLife,
            "remaining_km": remainingGearFilterController.text,
            "next_service_odo": nextGearFilterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: gearGasket),
            "oil_life": gearGasketLife,
            "remaining_km": remainingGearGasketController.text,
            "next_service_odo": nextGearGasketChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: fourWheelOil),
            "oil_life": fourOilLife,
            "next_service_odo": nextFourWheelOilChangeODOlController.text,
            "remaining_km": remainingFourWheelOilController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: transmissionControlModule),
            "oil_life": transmissionControlModuleLife,
            "remaining_km": remainingTransmissionControlOilController.text,
            "next_service_odo":
                nextTransmissionControlOilChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: gearMount),
            "no_of_mounts": noOfGearMounts ?? '',
            "oil_life": gearMountLife,
            "remaining_km": remainingGearMountController.text,
            "next_service_odo": nextGearMountChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: gearCoolar),
            "oil_life": gearCoolarLife,
            "remaining_km": remainingGearCoolarController.text,
            "next_service_odo": nextGearCoolarODOController.text,
          },
        ],
        "differential": [
          {
            "component": 1,
            "status": getSelection(selection: frontDifferentialOil),
            "oil_life": frontDifferentialOilLife,
            "remaining_km": frontDifferentialOilLifeController.text,
            "next_service_odo":
                nextFrontDifferentialOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: rearDifferentialOil),
            "oil_life": rearDifferentialOilLife,
            "remaining_km": rearDifferentialOilLifeController.text,
            "next_service_odo":
                nextRearDifferentialOilChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: differentialBushes),
            "oil_life": differentialBushesLife,
            "remaining_km": remainingDifferentialBushesController.text,
            "next_service_odo": nextDifferentialBushesChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: shaftStatus),
            "oil_life": shaftStatusLife,
            "remaining_km": remainingShaftStatusController.text,
            "next_service_odo": nextShaftStatusChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: shaftSeals),
            "oil_life": shaftSealsLife,
            "remaining_km": remainingShaftSealsController.text,
            "next_service_odo": nextShaftSealsChangeODOlController.text,
          }
        ],
        "break": [
          {
            "component": 1,
            "status": getSelection(selection: flBreakDisc),
            "thickness": flbdPercentage ?? "",
            "component_life": flBreakDiscLife,
            "remaining_km": remainingFrontLeftBreakDiscController.text,
            "next_service_odo": nextFrontLeftBreakDiscChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: frBreakDisc),
            "thickness": frbdPercentage ?? "",
            "component_life": frBreakDiscLife,
            "remaining_km": remainingFrontRightBreakDiscController.text,
            "next_service_odo":
                nextFrontRightBreakDiscChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: rlBreakDisc),
            "thickness": rlbdPercentage ?? "",
            "component_life": rlBreakDiscLife,
            "remaining_km": remainingRearLeftBreakDiscController.text,
            "next_service_odo": nextRearLeftBreakDiscChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: rrBreakDisc),
            "thickness": rrbdPercentage ?? "",
            "component_life": rrBreakDiscLife,
            "remaining_km": remainingRearRightBreakDiscController.text,
            "next_service_odo": nextRearRightBreakDiscChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: fbPad),
            "thickness": fbPadPercentage ?? "",
            "component_life": fbPadLife,
            "remaining_km": remainingFrontBreakPadController.text,
            "next_service_odo": nextFrontBreakPadChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: rbPad),
            "thickness": rbPadPercentage ?? "",
            "component_life": rbPadLife,
            "remaining_km": remainingRearBreakPadController.text,
            "next_service_odo": nextRearBreakPadChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: rbShoe),
            "thickness": rbShoePercentage ?? "",
            "component_life": rbShoeLife,
            "remaining_km": remainingRearBreakShoeController.text,
            "next_service_odo": nextRearBreakShoeChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSelection(selection: breakFluid),
            "thickness": breakFluidPercentage ?? "",
            "component_life": breakFluidLife,
            "remaining_km": remainingBreakFluidController.text,
            "next_service_odo": nextBreakFluidChangeODOlController.text,
          },
        ],
        "suspension": [
          {
            "component": 1,
            "status": getSuspensionSelection(selection: flla),
            "component_life": fllaLife,
            "remaining_km": remainingFrontLeftLowerArmController.text,
            "next_service_odo": nextFrontLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSuspensionSelection(selection: frla),
            "component_life": frlaLife,
            "remaining_km": remainingFrontRightLowerArmController.text,
            "next_service_odo": nextFrontRightLowerArmChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSuspensionSelection(selection: rlla),
            "component_life": rllaLife,
            "remaining_km": remainingRearLeftLowerArmController.text,
            "next_service_odo": nextRearLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSuspensionSelection(selection: rrla),
            "component_life": rrlaLife,
            "remaining_km": remainingRearRightLowerArmController.text,
            "next_service_odo": nextRearRightLowerArmChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSuspensionSelection(selection: uafl),
            "component_life": uaflLife,
            "remaining_km": remainingUpperArmFrontLeftController.text,
            "next_service_odo": nextUpperArmFrontLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSuspensionSelection(selection: uafr),
            "component_life": uafrLife,
            "remaining_km": remainingUpperArmFrontRightController.text,
            "next_service_odo": nextUpperArmFrontRightChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSuspensionSelection(selection: tar),
            "component_life": tarLife,
            "remaining_km": remainingTrailorArmRearController.text,
            "next_service_odo": nextTrailorArmRearChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSuspensionSelection(selection: abli),
            "component_life": abliLife,
            "remaining_km": remainingAxleBootLeftInnerController.text,
            "next_service_odo": nextAxleBootLeftInnerChangeODOlController.text,
          },
          {
            "component": 9,
            "status": getSuspensionSelection(selection: abri),
            "component_life": abriLife,
            "remaining_km": remainingAxleBootRightInnerController.text,
            "next_service_odo": nextAxleBootRightInnerChangeODOlController.text,
          },
          {
            "component": 10,
            "status": getSuspensionSelection(selection: abro),
            "component_life": abroLife,
            "remaining_km": remainingAxleBootRightOuterController.text,
            "next_service_odo": nextAxleBootRightOuterChangeODOlController.text,
          },
          {
            "component": 11,
            "status": getSuspensionSelection(selection: ablo),
            "component_life": abloLife,
            "remaining_km": remainingAxleBootLeftOuterController.text,
            "next_service_odo": nextAxleBootLeftOuterChangeODOlController.text,
          },
          {
            "component": 12,
            "status": getSuspensionSelection(selection: abrir),
            "component_life": abrirLife,
            "remaining_km": remainingAbriRearController.text,
            "next_service_odo": nextAbriRearChangeODOController.text,
          },
          {
            "component": 13,
            "status": getSuspensionSelection(selection: abrrr),
            "component_life": abrrrLife,
            "remaining_km": remainingAbrrRearController.text,
            "next_service_odo": nextAbrrRearChangeODOController.text,
          },
          {
            "component": 14,
            "status": getSuspensionSelection(selection: abror),
            "component_life": abrorife,
            "remaining_km": remainingAbroRearController.text,
            "next_service_odo": nextAbroRearChangeODOController.text,
          },
          {
            "component": 15,
            "status": getSuspensionSelection(selection: ablor),
            "component_life": ablorLife,
            "remaining_km": remainingAbloRearController.text,
            "next_service_odo": nextAbloRearChangeODOController.text,
          },
          {
            "component": 16,
            "status": getSuspensionSelection(selection: lrfl),
            "component_life": lrflLife,
            "remaining_km": remainingLinkRodFrontLeftController.text,
            "next_service_odo": nextLinkRodFrontLeftChangeODOlController.text,
          },
          {
            "component": 17,
            "status": getSuspensionSelection(selection: lrfr),
            "component_life": lrfrLife,
            "remaining_km": remainingLinkRodFrontRightController.text,
            "next_service_odo": nextLinkRodFrontRightChangeODOlController.text,
          },
          {
            "component": 18,
            "status": getSuspensionSelection(selection: lrrl),
            "component_life": lrrlLife,
            "remaining_km": remainingLinkRodRearLeftController.text,
            "next_service_odo": nextLinkRodRearLeftChangeODOlController.text,
          },
          {
            "component": 19,
            "status": getSuspensionSelection(selection: lrrr),
            "component_life": lrrrLife,
            "remaining_km": remainingLinkRodRearRightController.text,
            "next_service_odo": nextLinkRodRearRightChangeODOlController.text,
          },
          {
            "component": 20,
            "status": getSuspensionSelection(selection: brbf),
            "component_life": brbfLife,
            "remaining_km": remainingBalanceRodBushFrontController.text,
            "next_service_odo": nextBalanceRodBushRearChangeODOlController.text,
          },
          {
            "component": 21,
            "status": getSuspensionSelection(selection: brbr),
            "component_life": brbrLife,
            "remaining_km": remainingBalanceRodBushRearController.text,
            "next_service_odo": nextBalanceRodBushRearChangeODOlController.text,
          },
          {
            "component": 22,
            "status": getSuspensionSelection(selection: fshockl),
            "component_life": fshocklLife,
            "remaining_km": remainingFshocklController.text,
            "next_service_odo": nextFshocklChangeODOController.text,
          },
          {
            "component": 23,
            "status": getSuspensionSelection(selection: fshockr),
            "component_life": fshockrLife,
            "remaining_km": remainingFshockrController.text,
            "next_service_odo": nextFshockrChangeODOController.text,
          },
          {
            "component": 24,
            "status": getSuspensionSelection(selection: rshockl),
            "component_life": rshocklLife,
            "remaining_km": remainingRshocklController.text,
            "next_service_odo": nextRshocklChangeODOController.text,
          },
          {
            "component": 25,
            "status": getSuspensionSelection(selection: rshockr),
            "component_life": rshockrLife,
            "remaining_km": remainingRshockrController.text,
            "next_service_odo": nextRshockrChangeODOController.text,
          },
          {
            "component": 26,
            "status": getSuspensionSelection(selection: wlbearfl),
            "component_life": wlbearflLife,
            "remaining_km": remainingWlbearflController.text,
            "next_service_odo": nextWlbearflChangeODOController.text,
          },
          {
            "component": 27,
            "status": getSuspensionSelection(selection: wlbearfr),
            "component_life": wlbearfrLife,
            "remaining_km": remainingWlbearfrController.text,
            "next_service_odo": nextWlbearfrChangeODOController.text,
          },
          {
            "component": 28,
            "status": getSuspensionSelection(selection: wlbearrl),
            "component_life": wlbearrlLife,
            "remaining_km": remainingWlbearrlController.text,
            "next_service_odo": nextWlbearrlChangeODOController.text,
          },
          {
            "component": 29,
            "status": getSuspensionSelection(selection: wlbearrr),
            "component_life": wlbearrrLife,
            "remaining_km": remainingWlbearrrController.text,
            "next_service_odo": nextWlbearrrChangeODOController.text,
          },
        ],
        "ac": [
          {
            "component": 1,
            "status": getSelection(selection: acGas),
            "component_life": acGasLife,
            "remaining_km": remainingAcGasController.text,
            "next_service_odo": nextAcGasChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: compressor),
            "component_life": compressorLife,
            "remaining_km": remainingCompressorController.text,
            "next_service_odo": nextCompressorChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: condenser),
            "component_life": condenserLife,
            "remaining_km": remainingCondenserController.text,
            "next_service_odo": nextCondenserChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: evaporator),
            "component_life": evaporatorLife,
            "remaining_km": remainingEvaporatorController.text,
            "next_service_odo": nextEvaporatorChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: exValve),
            "component_life": exValveLife,
            "remaining_km": remainingExValveController.text,
            "next_service_odo": nextExValveChangeODOlController.text,
          },
        ],
        "steering": [
          {
            "component": 1,
            "status": getSelection(selection: sbl),
            "component_life": sblLife,
            "remaining_km": remainingSteeringBootLeftController.text,
            "next_service_odo": nextSteeringBootLeftChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: sbr),
            "component_life": sbrLife,
            "remaining_km": remainingSteeringBootRightController.text,
            "next_service_odo": nextSteeringBootRightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: sel),
            "component_life": selLife,
            "remaining_km": remainingSteeringEndLeftController.text,
            "next_service_odo": nextSteeringEndLeftChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: ser),
            "component_life": serLife,
            "remaining_km": remainingSteeringEndRightController.text,
            "next_service_odo": nextSteeringEndRightChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: bjl),
            "component_life": bjlLife,
            "remaining_km": remainingBallJointLeftController.text,
            "next_service_odo": nextBallJointLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: bjr),
            "component_life": bjrLife,
            "remaining_km": remainingBallJointRightController.text,
            "next_service_odo": nextBallJointRightChangeODOlController.text,
          },
        ],
        "light": [
          {
            "component": 1,
            "status": getLampSelection(selection: headLight),
            "component_life": headLightLife,
            "remaining_km": remainingHeadLightController.text,
            "next_service_odo": nextHeadLightChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getLampSelection(selection: parkLight),
            "component_life": parkLightLife,
            "remaining_km": remainingParkLightController.text,
            "next_service_odo": nextParkLightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getLampSelection(selection: indicators),
            "component_life": indicatorsLife,
            "remaining_km": remainingIndicatorsController.text,
            "next_service_odo": nextIndicatorsChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getLampSelection(selection: reverseGearLight),
            "component_life": reverseGearLightLife,
            "remaining_km": remainingReverseGearController.text,
            "next_service_odo": nextReverseGearChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getLampSelection(selection: dimBright),
            "component_life": dimBrightLife,
            "remaining_km": remainingDimBrightController.text,
            "next_service_odo": nextDimBrightChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getLampSelection(selection: fogLamps),
            "component_life": fogLampsLife,
            "remaining_km": remainingFogLampsController.text,
            "next_service_odo": nextFogLampsChangeODOlController.text,
          },
        ],
        "fuel": [
          {
            "component": 1,
            "status": getSelection(selection: fuelPump),
            "component_life": fuelPumpLife,
            "remaining_km": remainingFuelPumpController.text,
            "next_service_odo": nextFuelPumpChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: fuelFilter),
            "component_life": fuelFilterLife,
            "remaining_km": remainingFuelFilterController.text,
            "next_service_odo": nextFuelFilterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: canister),
            "component_life": canisterLife,
            "remaining_km": remainingCanisterController.text,
            "next_service_odo": nextCanisterChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: fuelTank),
            "component_life": fuelTankLife,
            "remaining_km": remainingFuelTankController.text,
            "next_service_odo": nextFuelTankChangeODOlController.text,
          },
        ],
        "other": [
          {
            "component": 1,
            "status": getSelection(selection: centerLock),
            "remarks": clRemarks ?? "",
            "component_life": centerLockLife,
            "remaining_km": remainingCenterLockController.text,
            "next_service_odo": nextCenterLockChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: windowLifter),
            "remarks": wlRemarks ?? "",
            "component_life": windowLifterLife,
            "remaining_km": remainingWindowLifterController.text,
            "next_service_odo": nextWindowLifterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: alignment),
            "component_life": alignmentLife,
            "remaining_km": remainingAlignmentController.text,
            "next_service_odo": nextAlignmentChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: wheelBalance),
            "component_life": wheelBalanceLife,
            "remaining_km": remainingWheelBalanceController.text,
            "next_service_odo": nextWheelBalanceChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: wiperBladeFront),
          },
          {
            "component": 6,
            "status": getSelection(selection: wiperBladeRear),
          },
          {
            "component": 7,
            "front_right": frPressure,
            "front_left": flPressure,
            "rear_right": rrPressure,
            "rear_left": rlPressure
          },
          {
            "component": 8, //Battery
            "status": getSelection(selection: batterySelection),
            "ah": batteryAmpere,
            "type": batteryType,
            "brand": batteryBrand
          }
        ]
      };

  Future<bool?> addService() async {
    updateLoader(true);
    log(jsonEncode(params.toString()).toString());
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

  @override
  updateOodoReading(bool value) {
    isOodoReadingLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isServiceAdding = false;
  bool isGarageLoader = false;
  bool isSearchLoading = false;
  bool isOodoReadingLoading = false;

  updateLoader(bool value);

  updateGarageLoader(bool value);

  updateSearchLoader(bool value);

  updateOodoReading(bool value);
}
