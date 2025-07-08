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
  //? -------
  final oilLifeController = TextEditingController();
  final remainingOilController = TextEditingController();
  String? remainingOil;
  final nextOilChangeODOlController = TextEditingController();
  final currentODOController = TextEditingController();
  //! Oil filter
  final remainingOilFilterController = TextEditingController();
  String? remainingOilFilter;
  final nextOilFilterChangeODOlController = TextEditingController();
  String? nextOilFilterChangeODO;
  //! ----------
  //-----------
  //! Air Filter
  final remainingAirFilterController = TextEditingController();
  String? remainingAirFilter;
  final nextAirFilterChangeODOlController = TextEditingController();
  String? nextAirFilterChangeODO;
  //! ----------
  //-----------
  //! AC Filter
  final remainingAcFilterController = TextEditingController();
  String? remainingAcFilter;
  final nextAcFilterChangeODOlController = TextEditingController();
  String? nextAcFilterChangeODO;
  //! ----------
  //-----------
  //! Spark Plug
  final remainingSparkPlugController = TextEditingController();
  String? remainingSparkPlug;
  final nextSparkPlugChangeODOlController = TextEditingController();
  String? nextSparkPlugChangeODO;
  //! ----------
  //-----------
  //! Ignition Coil
  final remainingIgnitionCoilController = TextEditingController();
  String? remainingIgnitionCoil;
  final nextIgnitionCoilChangeODOlController = TextEditingController();
  String? nextIgnitionCoilChangeODO;
  //! ----------
  //-----------
  //! Valve Cower Gasket
  final remainingValveCowerGasketController = TextEditingController();
  String? remainingValveCowerGasket;
  final nextValveCowerGasketChangeODOlController = TextEditingController();
  String? nextValveCowerGasketChangeODO;
  //! ----------
  //-----------
  //! Plug Seal
  final remainingPlugSealController = TextEditingController();
  String? remainingPlugSeal;
  final nextPlugSealChangeODOlController = TextEditingController();
  String? nextPlugSealChangeODO;
  //! ----------
  //-----------
  //! Engine Belt
  final remainingEngineBeltController = TextEditingController();
  String? remainingEngineBelt;
  final nextEngineBeltChangeODOlController = TextEditingController();
  String? nextEngineBeltChangeODO;
  //! ----------
  //-----------
  //! Engine Belt Tentioner
  final remainingEngineBeltTentionerController = TextEditingController();
  String? remainingEngineBeltTentioner;
  final nextEngineBeltTentionerChangeODOlController = TextEditingController();
  String? nextEngineBeltTentionerChangeODO;
  //! ----------
  //-----------
  //! IDL Pulley
  final remainingIDLPulleyController = TextEditingController();
  String? remainingIDLPulley;
  final nextIDLPulleyChangeODOlController = TextEditingController();
  String? nextIDLPulleyChangeODO;
  //! ----------
  //-----------
  //! Injectors
  final remainingInjectorsController = TextEditingController();
  String? remainingInjectors;
  final nextInjectorsChangeODOlController = TextEditingController();
  String? nextInjectorsChangeODO;
  //! ----------
  //-----------
  //! Self Motor
  final remainingSelfMotorController = TextEditingController();
  String? remainingSelfMotor;
  final nextSelfMotorChangeODOlController = TextEditingController();
  String? nextSelfMotorChangeODO;
  //! ----------
  //-----------
  //! Engine Mount
  final remainingEngineMotorController = TextEditingController();
  String? remainingEngineMotor;
  final nextEngineMotorChangeODOlController = TextEditingController();
  String? nextEngineMotorrChangeODO;
  //! ----------
  //! Gear Oil
  final remainingGearOilController = TextEditingController();
  String? remainingGearOil;
  final nextGearOilChangeODOlController = TextEditingController();
  String? nextGearOilChangeODO;
  //! ----------
  //! Transmission Control Oil
  final remainingTransmissionControlOilController = TextEditingController();
  String? remainingTransmissionControlOil;
  final nextTransmissionControlOilChangeODOlController =
      TextEditingController();
  String? nextTransmissionControlOilChangeODO;
  //! ----------
  //! Gear Gasket
  final remainingGearGasketController = TextEditingController();
  String? remainingGearGasket;
  final nextGearGasketChangeODOlController = TextEditingController();
  String? nextGearGasketChangeODO;
  //! ----------
  //! Gear Mount
  final remainingGearMountController = TextEditingController();
  String? remainingGearMount;
  final nextGearMountChangeODOlController = TextEditingController();
  String? nextGearMountChangeODO;
  //! ----------
  //! Shaft Status
  final remainingShaftStatusController = TextEditingController();
  String? remainingShaftStatus;
  final nextShaftStatusChangeODOlController = TextEditingController();
  String? nextShaftStatusChangeODO;
  //! ----------
  //! Shaft Seals
  final remainingShaftSealsController = TextEditingController();
  String? remainingShaftSeals;
  final nextShaftSealsChangeODOlController = TextEditingController();
  String? nextShaftSealsChangeODO;
  //! ----------
  //! Differential Bushes
  final remainingDifferentialBushesController = TextEditingController();
  String? remainingDifferentialBushes;
  final nextDifferentialBushesChangeODOlController = TextEditingController();
  String? nextDifferentialBushesChangeODO;
  //! ----------
  //! Front Left Break Disc
  final remainingFrontLeftBreakDiscController = TextEditingController();
  String? remainingFrontLeftBreakDisc;
  final nextFrontLeftBreakDiscChangeODOlController = TextEditingController();
  String? nextFrontLeftBreakDiscChangeODO;
  //! ----------
  //! Front Right Break Disc
  final remainingFrontRightBreakDiscController = TextEditingController();
  String? remainingFrontRightBreakDisc;
  final nextFrontRightBreakDiscChangeODOlController = TextEditingController();
  String? nextFrontRightBreakDiscChangeODO;
  //! ----------
  //! Rear Left Break Disc
  final remainingRearLeftBreakDiscController = TextEditingController();
  String? remainingRearLeftBreakDisc;
  final nextRearLeftBreakDiscChangeODOlController = TextEditingController();
  String? nextRearLeftBreakDiscChangeODO;
  //! ----------
  //! Rear Right Break Disc
  final remainingRearRightBreakDiscController = TextEditingController();
  String? remainingRearRightBreakDisc;
  final nextRearRightBreakDiscChangeODOlController = TextEditingController();
  String? nextRearRightBreakDiscChangeODO;
  //! ----------
  //! Front Break Pad
  final remainingFrontBreakPadController = TextEditingController();
  String? remainingFrontBreakPad;
  final nextFrontBreakPadChangeODOlController = TextEditingController();
  String? nextFrontBreakPadChangeODO;
  //! ----------
  //! Rear Break Pad
  final remainingRearBreakPadController = TextEditingController();
  String? remainingRearBreakPad;
  final nextRearBreakPadChangeODOlController = TextEditingController();
  String? nextRearBreakPadChangeODO;
  //! ----------
  //! Rear Break Shoe
  final remainingRearBreakShoeController = TextEditingController();
  String? remainingRearBreakShoe;
  final nextRearBreakShoeChangeODOlController = TextEditingController();
  String? nextRearBreakShoeChangeODO;
  //! ----------
  //! Break Fluid
  final remainingBreakFluidController = TextEditingController();
  String? remainingBreakFluid;
  final nextBreakFluidChangeODOlController = TextEditingController();
  String? nextBreakFluidChangeODO;
  //! ----------
  //! Front Left Lower Arm
  final remainingFrontLeftLowerArmController = TextEditingController();
  String? remainingFrontLeftLowerArm;
  final nextFrontLeftLowerArmChangeODOlController = TextEditingController();
  String? nextFrontLeftLowerArmChangeODO;
  //! ----------
  //! Front Right Lower Arm
  final remainingFrontRightLowerArmController = TextEditingController();
  String? remainingFrontRightLowerArm;
  final nextFrontRightLowerArmChangeODOlController = TextEditingController();
  String? nextFrontRightLowerArmChangeODO;
  //! ----------
  //! Rear Left Lower Arm
  final remainingRearLeftLowerArmController = TextEditingController();
  String? remainingRearLeftLowerArm;
  final nextRearLeftLowerArmChangeODOlController = TextEditingController();
  String? nextRearLeftLowerArmChangeODO;
  //! ----------
  //! Rear Right Lower Arm
  final remainingRearRightLowerArmController = TextEditingController();
  String? remainingRearRightLowerArm;
  final nextRearRightLowerArmChangeODOlController = TextEditingController();
  String? nextRearRightLowerArmChangeODO;
  //! ----------
  //! Upper Arm Front Left
  final remainingUpperArmFrontLeftController = TextEditingController();
  String? remainingUpperArmFrontLeft;
  final nextUpperArmFrontLeftChangeODOlController = TextEditingController();
  String? nextUpperArmFrontLeftChangeODO;
  //! ----------
  //! Upper Arm Front Right
  final remainingUpperArmFrontRightController = TextEditingController();
  String? remainingUpperArmFrontRight;
  final nextUpperArmFrontRightChangeODOlController = TextEditingController();
  String? nextUpperArmFrontRightChangeODO;
  //! ----------
  //! Trailor Arm Rear
  final remainingTrailorArmRearController = TextEditingController();
  String? remainingTrailorArmRear;
  final nextTrailorArmRearChangeODOlController = TextEditingController();
  String? nextTrailorArmRearChangeODO;
  //! ----------
  //! Axle Boot Left Inner
  final remainingAxleBootLeftInnerController = TextEditingController();
  String? remainingAxleBootLeftInner;
  final nextAxleBootLeftInnerChangeODOlController = TextEditingController();
  String? nextAxleBootLeftInnerChangeODO;
  //! ----------
  //! Axle Boot Right Inner
  final remainingAxleBootRightInnerController = TextEditingController();
  String? remainingAxleBootRightInner;
  final nextAxleBootRightInnerChangeODOlController = TextEditingController();
  String? nextAxleBootRightInnerChangeODO;
  //! ----------
  //! Axle Boot Right Outer
  final remainingAxleBootRightOuterController = TextEditingController();
  String? remainingAxleBootRightOuter;
  final nextAxleBootRightOuterChangeODOlController = TextEditingController();
  String? nextAxleBootRightOuterChangeODO;
  //! ----------
  //! Axle Boot Left Outer
  final remainingAxleBootLeftOuterController = TextEditingController();
  String? remainingAxleBootLeftOuter;
  final nextAxleBootLeftOuterChangeODOlController = TextEditingController();
  String? nextAxleBootLeftOuterChangeODO;
  //! ----------
  //! Link Rod Front Left
  final remainingLinkRodFrontLeftController = TextEditingController();
  String? remainingLinkRodFrontLeft;
  final nextLinkRodFrontLeftChangeODOlController = TextEditingController();
  String? nextLinkRodFrontLeftChangeODO;
  //! ----------
  //! Link Rod Front Right
  final remainingLinkRodFrontRightController = TextEditingController();
  String? remainingLinkRodFrontRight;
  final nextLinkRodFrontRightChangeODOlController = TextEditingController();
  String? nextLinkRodFrontRightChangeODO;
  //! ----------
  //! Link Rod Rear Left
  final remainingLinkRodRearLeftController = TextEditingController();
  String? remainingLinkRodRearLeft;
  final nextLinkRodRearLeftChangeODOlController = TextEditingController();
  String? nextLinkRodRearLeftChangeODO;
  //! ----------
  //! Link Rod Rear Right
  final remainingLinkRodRearRightController = TextEditingController();
  String? remainingLinkRodRearRight;
  final nextLinkRodRearRightChangeODOlController = TextEditingController();
  String? nextLinkRodRearRightChangeODO;
  //! ----------
  //! Balance Rod Bush Front
  final remainingBalanceRodBushFrontController = TextEditingController();
  String? remainingBalanceRodBushFront;
  final nextBalanceRodBushFrontChangeODOlController = TextEditingController();
  String? nextBalanceRodBushFrontChangeODO;
  //! ----------
  //! Balance Rod Bush Rear
  final remainingBalanceRodBushRearController = TextEditingController();
  String? remainingBalanceRodBushRear;
  final nextBalanceRodBushRearChangeODOlController = TextEditingController();
  String? nextBalanceRodBushRearChangeODO;
  //! ----------
  //! AC Gas
  final remainingAcGasController = TextEditingController();
  String? remainingAcGas;
  final nextAcGasChangeODOlController = TextEditingController();
  String? nextAcGasChangeODO;
  //! ----------
  //! Compressor
  final remainingCompressorController = TextEditingController();
  String? remainingCompressor;
  final nextCompressorChangeODOlController = TextEditingController();
  String? nextCompressorChangeODO;
  //! ----------
  //! Condenser
  final remainingCondenserController = TextEditingController();
  String? remainingCondenser;
  final nextCondenserChangeODOlController = TextEditingController();
  String? nextCondenserChangeODO;
  //! ----------
  //! Evaporator
  final remainingEvaporatorController = TextEditingController();
  String? remainingEvaporator;
  final nextEvaporatorChangeODOlController = TextEditingController();
  String? nextEvaporatorChangeODO;
  //! ----------
  //! Ex Valve
  final remainingExValveController = TextEditingController();
  String? remainingExValve;
  final nextExValveChangeODOlController = TextEditingController();
  String? nextExValveChangeODO;
  //! ----------
  //! Steering Boot Left
  final remainingSteeringBootLeftController = TextEditingController();
  String? remainingSteeringBootLeft;
  final nextSteeringBootLeftChangeODOlController = TextEditingController();
  String? nextSteeringBootLeftChangeODO;
  //! ----------
  //! Steering Boot Right
  final remainingSteeringBootRightController = TextEditingController();
  String? remainingSteeringBootRight;
  final nextSteeringBootRightChangeODOlController = TextEditingController();
  String? nextSteeringBootRightChangeODO;
  //! ----------
  //! Steering End Left
  final remainingSteeringEndLeftController = TextEditingController();
  String? remainingSteeringEndLeft;
  final nextSteeringEndLeftChangeODOlController = TextEditingController();
  String? nextSteeringEndLeftChangeODO;
  //! ----------
  //! Steering End Right
  final remainingSteeringEndRightController = TextEditingController();
  String? remainingSteeringEndRight;
  final nextSteeringEndRightChangeODOlController = TextEditingController();
  String? nextSteeringEndRightChangeODO;
  //! ----------
  //! Ball Joint Left
  final remainingBallJointLeftController = TextEditingController();
  String? remainingBallJointLeft;
  final nextBallJointLeftChangeODOlController = TextEditingController();
  String? nextBallJointLeftChangeODO;
  //! ----------
  //! Ball Joint Right
  final remainingBallJointRightController = TextEditingController();
  String? remainingBallJointRight;
  final nextBallJointRightChangeODOlController = TextEditingController();
  String? nextBallJointRightChangeODO;
  //! ----------
  //! Head Light
  final remainingHeadLightController = TextEditingController();
  String? remainingHeadLight;
  final nextHeadLightChangeODOlController = TextEditingController();
  String? nextHeadLightChangeODO;
  //! ----------
  //! Park Light
  final remainingParkLightController = TextEditingController();
  String? remainingParkLight;
  final nextParkLightChangeODOlController = TextEditingController();
  String? nextParkLightChangeODO;
  //! ----------
  //! Indicators
  final remainingIndicatorsController = TextEditingController();
  String? remainingIndicators;
  final nextIndicatorsChangeODOlController = TextEditingController();
  String? nextIndicatorsChangeODO;
  //! ----------
  //! Reverse Gear
  final remainingReverseGearController = TextEditingController();
  String? remainingReverseGear;
  final nextReverseGearChangeODOlController = TextEditingController();
  String? nextReverseGearChangeODO;
  //! ----------
  //! Dim Bright
  final remainingDimBrightController = TextEditingController();
  String? remainingDimBright;
  final nextDimBrightChangeODOlController = TextEditingController();
  String? nextDimBrightChangeODO;
  //! ----------
  //! Fog Lamps
  final remainingFogLampsController = TextEditingController();
  String? remainingFogLamps;
  final nextFogLampsChangeODOlController = TextEditingController();
  String? nextFogLampsChangeODO;
  //! ----------
  //! Fuel Pump
  final remainingFuelPumpController = TextEditingController();
  String? remainingFuelPump;
  final nextFuelPumpChangeODOlController = TextEditingController();
  String? nextFuelPumpChangeODO;
  //! ----------
  //! Fuel Filter
  final remainingFuelFilterController = TextEditingController();
  String? remainingFuelFilter;
  final nextFuelFilterChangeODOlController = TextEditingController();
  String? nextFuelFilterChangeODO;
  //! ----------
  //! Canister
  final remainingCanisterController = TextEditingController();
  String? remainingCanister;
  final nextCanisterChangeODOlController = TextEditingController();
  String? nextCanisterChangeODO;
  //! ----------
  //! Fuel Tank
  final remainingFuelTankController = TextEditingController();
  String? remainingFuelTank;
  final nextFuelTankChangeODOlController = TextEditingController();
  String? nextFuelTankChangeODO;
  //! ----------
  //! Tyre Pressure Front Right
  final remainingTyrePressureFrontRightController = TextEditingController();
  String? remainingTyrePressureFrontRight;
  final nextTyrePressureFrontRightChangeODOlController =
      TextEditingController();
  String? nextTyrePressureFrontRightChangeODO;
  //! ----------
  //! Tyre Pressure Front Left
  final remainingTyrePressureFrontLeftController = TextEditingController();
  String? remainingTyrePressureFrontLeft;
  final nextTyrePressureFrontLeftChangeODOlController = TextEditingController();
  String? nextTyrePressureFrontLeftChangeODO;
  //! ----------
  //! Tyre Pressure Rear Right
  final remainingTyrePressureRearRightController = TextEditingController();
  String? remainingTyrePressureRearRight;
  final nextTyrePressureRearRightChangeODOlController = TextEditingController();
  String? nextTyrePressureRearRightChangeODO;
  //! ----------
  //! Tyre Pressure Rear Left
  final remainingTyrePressureRearLeftController = TextEditingController();
  String? remainingTyrePressureRearLeft;
  final nextTyrePressureRearLeftChangeODOlController = TextEditingController();
  String? nextTyrePressureRearLeftChangeODO;
  //! ----------
  //! Gear Filter
  final remainingGearFilterController = TextEditingController();
  String? remainingGearFilter;
  final nextGearFilterChangeODOlController = TextEditingController();
  String? nextGearFilterChangeODO;
  //! ----------
  //! Four Wheel Oil
  final remainingFourWheelOilController = TextEditingController();
  String? remainingFourWheelOil;
  final nextFourWheelOilChangeODOlController = TextEditingController();
  String? nextFourWheelOilChangeODO;
  //! ----------

  /// Gear Data Variables
  Selection? gearOil;
  String? gearOilLife;
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
    remainingAcFilterController.text = remainingAirFilterController.text =
        remainingOilFilterController.text = remainingOil ?? '';
    remainingSparkPlugController.text = remainingOil ?? '';
    remainingIgnitionCoilController.text = remainingOil ?? '';
    remainingValveCowerGasketController.text = remainingOil ?? '';
    remainingPlugSealController.text = remainingOil ?? '';
    remainingEngineBeltController.text = remainingOil ?? '';
    remainingEngineBeltTentionerController.text = remainingOil ?? '';
    remainingIDLPulleyController.text = remainingOil ?? '';
    remainingInjectorsController.text = remainingOil ?? '';
    remainingSelfMotorController.text = remainingOil ?? '';
    remainingEngineMotorController.text = remainingOil ?? '';
    remainingGearOilController.text = remainingOil ?? '';
    remainingTransmissionControlOilController.text = remainingOil ?? '';
    remainingGearGasketController.text = remainingOil ?? '';
    remainingGearMountController.text = remainingOil ?? '';
    remainingShaftStatusController.text = remainingOil ?? '';
    remainingShaftSealsController.text = remainingOil ?? '';
    remainingDifferentialBushesController.text = remainingOil ?? '';
    remainingFrontLeftBreakDiscController.text = remainingOil ?? '';
    remainingFrontRightBreakDiscController.text = remainingOil ?? '';
    remainingRearLeftBreakDiscController.text = remainingOil ?? '';
    remainingRearRightBreakDiscController.text = remainingOil ?? '';
    remainingFrontBreakPadController.text = remainingOil ?? '';
    remainingRearBreakPadController.text = remainingOil ?? '';
    remainingRearBreakShoeController.text = remainingOil ?? '';
    remainingBreakFluidController.text = remainingOil ?? '';
    remainingFrontLeftLowerArmController.text = remainingOil ?? '';
    remainingFrontRightLowerArmController.text = remainingOil ?? '';
    remainingRearLeftLowerArmController.text = remainingOil ?? '';
    remainingRearRightLowerArmController.text = remainingOil ?? '';
    remainingUpperArmFrontLeftController.text = remainingOil ?? '';
    remainingUpperArmFrontRightController.text = remainingOil ?? '';
    remainingTrailorArmRearController.text = remainingOil ?? '';
    remainingAxleBootLeftInnerController.text = remainingOil ?? '';
    remainingAxleBootRightInnerController.text = remainingOil ?? '';
    remainingAxleBootRightOuterController.text = remainingOil ?? '';
    remainingAxleBootLeftOuterController.text = remainingOil ?? '';
    remainingLinkRodFrontLeftController.text = remainingOil ?? '';
    remainingLinkRodFrontRightController.text = remainingOil ?? '';
    remainingLinkRodRearLeftController.text = remainingOil ?? '';
    remainingLinkRodRearRightController.text = remainingOil ?? '';
    remainingBalanceRodBushFrontController.text = remainingOil ?? '';
    remainingBalanceRodBushRearController.text = remainingOil ?? '';
    remainingAcGasController.text = remainingOil ?? '';
    remainingCompressorController.text = remainingOil ?? '';
    remainingCondenserController.text = remainingOil ?? '';
    remainingEvaporatorController.text = remainingOil ?? '';
    remainingExValveController.text = remainingOil ?? '';
    remainingSteeringBootLeftController.text = remainingOil ?? '';
    remainingSteeringBootRightController.text = remainingOil ?? '';
    remainingSteeringEndLeftController.text = remainingOil ?? '';
    remainingSteeringEndRightController.text = remainingOil ?? '';
    remainingBallJointLeftController.text = remainingOil ?? '';
    remainingBallJointRightController.text = remainingOil ?? '';
    remainingHeadLightController.text = remainingOil ?? '';
    remainingParkLightController.text = remainingOil ?? '';
    remainingIndicatorsController.text = remainingOil ?? '';
    remainingReverseGearController.text = remainingOil ?? '';
    remainingDimBrightController.text = remainingOil ?? '';
    remainingFogLampsController.text = remainingOil ?? '';
    remainingFuelPumpController.text = remainingOil ?? '';
    remainingFuelFilterController.text = remainingOil ?? '';
    remainingCanisterController.text = remainingOil ?? '';
    remainingFuelTankController.text = remainingOil ?? '';
    remainingTyrePressureFrontRightController.text = remainingOil ?? '';
    remainingTyrePressureFrontLeftController.text = remainingOil ?? '';
    remainingTyrePressureRearRightController.text = remainingOil ?? '';
    remainingTyrePressureRearLeftController.text = remainingOil ?? '';
    remainingGearFilterController.text = remainingOil ?? '';
    remainingFourWheelOilController.text = remainingOil ?? '';
    remainingAlignmentController.text = remainingOil ?? '';
    remainingWheelBalanceController.text = remainingOil ?? '';
    remainingWiperBladeFrontController.text = remainingOil ?? '';
    remainingWiperBladeRearController.text = remainingOil ?? '';
    remainingCenterLockController.text = remainingOil ?? '';
    remainingWindowLifterController.text = remainingOil ?? '';
    frontDifferentialOilLifeController.text = remainingOil ?? '';
    rearDifferentialOilLifeController.text = remainingOil ?? '';

    if ((remainingOil?.isNotEmpty ?? false) &&
        (currentOodometerReading?.isNotEmpty ?? false)) {
      final value = (int.parse(remainingOil ?? '') +
              int.parse(currentOodometerReading ?? ''))
          .toString();

      nextOilFilterChangeODOlController.text = value;
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
      nextEngineMotorChangeODOlController.text = value;
      nextGearOilChangeODOlController.text = value;
      nextTransmissionControlOilChangeODOlController.text = value;
      nextGearGasketChangeODOlController.text = value;
      nextGearMountChangeODOlController.text = value;
      nextShaftStatusChangeODOlController.text = value;
      nextShaftSealsChangeODOlController.text = value;
      nextDifferentialBushesChangeODOlController.text = value;
      nextFrontLeftBreakDiscChangeODOlController.text = value;
      nextFrontRightBreakDiscChangeODOlController.text = value;
      nextRearLeftBreakDiscChangeODOlController.text = value;
      nextRearRightBreakDiscChangeODOlController.text = value;
      nextFrontBreakPadChangeODOlController.text = value;
      nextRearBreakPadChangeODOlController.text = value;
      nextRearBreakShoeChangeODOlController.text = value;
      nextBreakFluidChangeODOlController.text = value;
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
      nextLinkRodFrontLeftChangeODOlController.text = value;
      nextLinkRodFrontRightChangeODOlController.text = value;
      nextLinkRodRearLeftChangeODOlController.text = value;
      nextLinkRodRearRightChangeODOlController.text = value;
      nextBalanceRodBushFrontChangeODOlController.text = value;
      nextBalanceRodBushRearChangeODOlController.text = value;
      nextAcGasChangeODOlController.text = value;
      nextCompressorChangeODOlController.text = value;
      nextCondenserChangeODOlController.text = value;
      nextEvaporatorChangeODOlController.text = value;
      nextExValveChangeODOlController.text = value;
      nextSteeringBootLeftChangeODOlController.text = value;
      nextSteeringBootRightChangeODOlController.text = value;
      nextSteeringEndLeftChangeODOlController.text = value;
      nextSteeringEndRightChangeODOlController.text = value;
      nextBallJointLeftChangeODOlController.text = value;
      nextBallJointRightChangeODOlController.text = value;
      nextHeadLightChangeODOlController.text = value;
      nextParkLightChangeODOlController.text = value;
      nextIndicatorsChangeODOlController.text = value;
      nextReverseGearChangeODOlController.text = value;
      nextDimBrightChangeODOlController.text = value;
      nextFogLampsChangeODOlController.text = value;
      nextFuelPumpChangeODOlController.text = value;
      nextFuelFilterChangeODOlController.text = value;
      nextCanisterChangeODOlController.text = value;
      nextFuelTankChangeODOlController.text = value;
      nextTyrePressureFrontRightChangeODOlController.text = value;
      nextTyrePressureFrontLeftChangeODOlController.text = value;
      nextTyrePressureRearRightChangeODOlController.text = value;
      nextTyrePressureRearLeftChangeODOlController.text = value;
      nextGearFilterChangeODOlController.text = value;
      nextFourWheelOilChangeODOlController.text = value;
      nextAlignmentChangeODOlController.text = value;
      nextWheelBalanceChangeODOlController.text = value;
      nextWiperBladeFrontChangeODOlController.text = value;
      nextWiperBladeRearChangeODOlController.text = value;
      nextCenterLockChangeODOlController.text = value;
      nextWindowLifterChangeODOlController.text = value;
      nextFrontDifferentialOilChangeODOlController.text = value;
      nextRearDifferentialOilChangeODOlController.text = value;
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
          if (engineOil != null)
            {
              "component": 1,
              "status": getSelection(selection: engineOil),
              "oil_life": oilLife ?? "",
              "remaining_km": remainingOil ?? "",
              "next_service_odo": nextOilChangeODO ?? "",
            },
          if (oilFilter != null)
            {
              "component": 2,
              "status": getSelection(selection: oilFilter),
              "remaining_km": remainingOilFilterController.text.isEmpty
                  ? remainingOilFilter
                  : remainingOilFilterController.text,
              "next_service_odo": nextOilFilterChangeODOlController.text.isEmpty
                  ? nextOilFilterChangeODO
                  : nextOilFilterChangeODOlController.text,
            },
          if (airFilter != null)
            {
              "component": 3,
              "status": getSelection(selection: airFilter),
              "remaining_km": (remainingAirFilter?.isEmpty ?? false)
                  ? remainingAirFilterController.text
                  : remainingAirFilter,
              "next_service_odo": nextAirFilterChangeODOlController.text.isEmpty
                  ? nextAirFilterChangeODO
                  : nextAirFilterChangeODOlController.text,
            },
          if (acFilter != null)
            {
              "component": 4,
              "status": getSelection(selection: acFilter),
              "remaining_km": remainingAcFilterController.text.isEmpty
                  ? remainingAcFilter
                  : remainingAcFilterController.text,
              "next_service_odo": nextAcFilterChangeODOlController.text.isEmpty
                  ? nextAcFilterChangeODO
                  : nextAcFilterChangeODOlController.text,
            },
          if (sparkPlug != null)
            {
              "component": 5,
              "status": getSelection(selection: sparkPlug),
              "remaining_km": remainingSparkPlugController.text.isEmpty
                  ? remainingSparkPlug
                  : remainingSparkPlugController.text,
              "next_service_odo": nextSparkPlugChangeODOlController.text.isEmpty
                  ? nextSparkPlugChangeODO
                  : nextSparkPlugChangeODOlController.text,
            },
          if (ignitionCoil != null)
            {
              "component": 6,
              "status": getSelection(selection: ignitionCoil),
              "remaining_km": remainingIgnitionCoilController.text.isEmpty
                  ? remainingIgnitionCoil
                  : remainingIgnitionCoilController.text,
              "next_service_odo":
                  nextIgnitionCoilChangeODOlController.text.isEmpty
                      ? nextIgnitionCoilChangeODO
                      : nextIgnitionCoilChangeODOlController.text,
            },
          if (valveCowerGasket != null)
            {
              "component": 7,
              "status": getSelection(selection: valveCowerGasket),
              "remaining_km": remainingValveCowerGasketController.text.isEmpty
                  ? remainingValveCowerGasket
                  : remainingValveCowerGasketController.text,
              "next_service_odo":
                  nextValveCowerGasketChangeODOlController.text.isEmpty
                      ? nextValveCowerGasketChangeODO
                      : nextValveCowerGasketChangeODOlController.text,
            },
          if (plugSeal != null)
            {
              "component": 8,
              "status": getSelection(selection: plugSeal),
              "remaining_km": remainingPlugSealController.text.isEmpty
                  ? remainingPlugSeal
                  : remainingPlugSealController.text,
              "next_service_odo": nextPlugSealChangeODOlController.text.isEmpty
                  ? nextPlugSealChangeODO
                  : nextPlugSealChangeODOlController.text,
            },
          if (engineBelt != null)
            {
              "component": 9,
              "status": getSelection(selection: engineBelt),
              "remaining_km": remainingEngineBeltController.text.isEmpty
                  ? remainingEngineBelt
                  : remainingEngineBeltController.text,
              "next_service_odo":
                  nextEngineBeltChangeODOlController.text.isEmpty
                      ? nextEngineBeltChangeODO
                      : nextEngineBeltChangeODOlController.text,
            },
          if (engineBeltTentioner != null)
            {
              "component": 10,
              "status": getSelection(selection: engineBeltTentioner),
              "remaining_km":
                  remainingEngineBeltTentionerController.text.isEmpty
                      ? remainingEngineBeltTentioner
                      : remainingEngineBeltTentionerController.text,
              "next_service_odo":
                  nextEngineBeltTentionerChangeODOlController.text.isEmpty
                      ? nextEngineBeltTentionerChangeODO
                      : nextEngineBeltTentionerChangeODOlController.text,
            },
          if (idlPulley != null)
            {
              "component": 11,
              "status": getSelection(selection: idlPulley),
              "remaining_km": remainingIDLPulleyController.text.isEmpty
                  ? remainingIDLPulley
                  : remainingIDLPulleyController.text,
              "next_service_odo": nextIDLPulleyChangeODOlController.text.isEmpty
                  ? nextIDLPulleyChangeODO
                  : nextIDLPulleyChangeODOlController.text,
            },
          if (injectors != null)
            {
              "component": 12,
              "status": getSelection(selection: injectors),
              "remaining_km": remainingInjectorsController.text.isEmpty
                  ? remainingInjectors
                  : remainingInjectorsController.text,
              "next_service_odo": nextInjectorsChangeODOlController.text.isEmpty
                  ? nextInjectorsChangeODO
                  : nextInjectorsChangeODOlController.text,
            },
          if (selfMotor != null)
            {
              "component": 13,
              "status": getSelection(selection: selfMotor),
              "remaining_km": remainingSelfMotorController.text.isEmpty
                  ? remainingSelfMotor
                  : remainingSelfMotorController.text,
              "next_service_odo": nextSelfMotorChangeODOlController.text.isEmpty
                  ? nextSelfMotorChangeODO
                  : nextSelfMotorChangeODOlController.text,
            },
          if (engineMount != null)
            {
              "component": 14,
              "status": getSelection(selection: engineMount),
              "no_of_mounts": numberOfEngineMounts ?? '',
            },
        ],
        "gear": [
          if (gearOil != null)
            {
              "component": 1,
              "status": getSelection(selection: gearOil),
              "remaining_km": remainingGearOilController.text.isEmpty
                  ? remainingGearOil
                  : remainingGearOilController.text,
              "next_service_odo": nextGearOilChangeODOlController.text.isEmpty
                  ? nextGearOilChangeODO
                  : nextGearOilChangeODOlController.text,
            },
          if (gearFilter != null)
            {
              "component": 2,
              "status": getSelection(selection: gearFilter),
              "remaining_km": remainingGearFilterController.text.isEmpty
                  ? remainingGearFilter
                  : remainingGearFilterController.text,
              "next_service_odo":
                  nextGearFilterChangeODOlController.text.isEmpty
                      ? nextGearFilterChangeODO
                      : nextGearFilterChangeODOlController.text,
            },
          if (gearGasket != null)
            {
              "component": 3,
              "status": getSelection(selection: gearGasket),
              "remaining_km": remainingGearGasketController.text.isEmpty
                  ? remainingGearGasket
                  : remainingGearGasketController.text,
              "next_service_odo":
                  nextGearGasketChangeODOlController.text.isEmpty
                      ? nextGearGasketChangeODO
                      : nextGearGasketChangeODOlController.text,
            },
          if (fourWheelOil != null)
            {
              "component": 4,
              "status": getSelection(selection: fourWheelOil),
              "next_service_odo":
                  nextFourWheelOilChangeODOlController.text.isEmpty
                      ? nextFourWheelOilChangeODO
                      : nextFourWheelOilChangeODOlController.text,
              "remaining_km": remainingFourWheelOilController.text.isEmpty
                  ? remainingFourWheelOil
                  : remainingFourWheelOilController.text,
            },
          if (transmissionControlModule != null)
            {
              "component": 5,
              "status": getSelection(selection: transmissionControlModule),
              "remaining_km":
                  remainingTransmissionControlOilController.text.isEmpty
                      ? remainingTransmissionControlOil
                      : remainingTransmissionControlOilController.text,
              "next_service_odo":
                  nextTransmissionControlOilChangeODOlController.text.isEmpty
                      ? nextTransmissionControlOilChangeODO
                      : nextTransmissionControlOilChangeODOlController.text,
            },
          if (gearMount != null)
            {
              "component": 6,
              "status": getSelection(selection: gearMount),
              "no_of_mounts": noOfGearMounts ?? '',
              "remaining_km": remainingGearMountController.text.isEmpty
                  ? remainingGearMount
                  : remainingGearMountController.text,
              "next_service_odo": nextGearMountChangeODOlController.text.isEmpty
                  ? nextGearMountChangeODO
                  : nextGearMountChangeODOlController.text,
            },
        ],
        "differential": [
          if (frontDifferentialOil != null)
            {
              "component": 1,
              "status": getSelection(selection: frontDifferentialOil),
              "remaining_km": frontDifferentialOilLifeController.text.isEmpty
                  ? frontDifferentialOilLife
                  : frontDifferentialOilLifeController.text,
              "next_service_odo":
                  nextFrontDifferentialOilChangeODOlController.text.isEmpty
                      ? nextFrontDifferentialOilChangeODO
                      : nextFrontDifferentialOilChangeODOlController.text,
            },
          if (rearDifferentialOil != null)
            {
              "component": 2,
              "status": getSelection(selection: rearDifferentialOil),
              "remaining_km": rearDifferentialOilLifeController.text.isEmpty
                  ? rearDifferentialOilLife
                  : rearDifferentialOilLifeController.text,
              "next_service_odo":
                  nextRearDifferentialOilChangeODOlController.text.isEmpty
                      ? nextRearDifferentialOilChangeODO
                      : nextRearDifferentialOilChangeODOlController.text,
            },
          if (differentialBushes != null)
            {
              "component": 3,
              "status": getSelection(selection: differentialBushes),
              "remaining_km": remainingDifferentialBushesController.text.isEmpty
                  ? remainingDifferentialBushes
                  : remainingDifferentialBushesController.text,
              "next_service_odo":
                  nextDifferentialBushesChangeODOlController.text.isEmpty
                      ? nextDifferentialBushesChangeODO
                      : nextDifferentialBushesChangeODOlController.text,
            },
          if (shaftStatus != null)
            {
              "component": 4,
              "status": getSelection(selection: shaftStatus),
              "remaining_km": remainingShaftStatusController.text.isEmpty
                  ? remainingShaftStatus
                  : remainingShaftStatusController.text,
              "next_service_odo":
                  nextShaftStatusChangeODOlController.text.isEmpty
                      ? nextShaftStatusChangeODO
                      : nextShaftStatusChangeODOlController.text,
            },
          if (shaftSeals != null)
            {
              "component": 5,
              "status": getSelection(selection: shaftSeals),
              "remaining_km": remainingShaftSealsController.text.isEmpty
                  ? remainingShaftSeals
                  : remainingShaftSealsController.text,
              "next_service_odo":
                  nextShaftSealsChangeODOlController.text.isEmpty
                      ? nextShaftSealsChangeODO
                      : nextShaftSealsChangeODOlController.text,
            }
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
          {
            "component": 1,
            "status": getSuspensionSelection(selection: flla),
            "remaining_km": remainingFrontLeftLowerArmController.text.isEmpty
                ? remainingFrontLeftLowerArm
                : remainingFrontLeftLowerArmController.text,
            "next_service_odo":
                nextFrontLeftLowerArmChangeODOlController.text.isEmpty
                    ? nextFrontLeftLowerArmChangeODO
                    : nextFrontLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSuspensionSelection(selection: frla),
            "remaining_km": remainingFrontRightLowerArmController.text.isEmpty
                ? remainingFrontRightLowerArm
                : remainingFrontRightLowerArmController.text,
            "next_service_odo":
                nextFrontRightLowerArmChangeODOlController.text.isEmpty
                    ? nextFrontRightLowerArmChangeODO
                    : nextFrontRightLowerArmChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSuspensionSelection(selection: rlla),
            "remaining_km": remainingRearLeftLowerArmController.text.isEmpty
                ? remainingRearLeftLowerArm
                : remainingRearLeftLowerArmController.text,
            "next_service_odo":
                nextRearLeftLowerArmChangeODOlController.text.isEmpty
                    ? nextRearLeftLowerArmChangeODO
                    : nextRearLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSuspensionSelection(selection: rrla),
            "remaining_km": remainingRearRightLowerArmController.text.isEmpty
                ? remainingRearRightLowerArm
                : remainingRearRightLowerArmController.text,
            "next_service_odo":
                nextRearRightLowerArmChangeODOlController.text.isEmpty
                    ? nextRearRightLowerArmChangeODO
                    : nextRearRightLowerArmChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSuspensionSelection(selection: uafl),
            "remaining_km": remainingUpperArmFrontLeftController.text.isEmpty
                ? remainingUpperArmFrontLeft
                : remainingUpperArmFrontLeftController.text,
            "next_service_odo":
                nextUpperArmFrontLeftChangeODOlController.text.isEmpty
                    ? nextUpperArmFrontLeftChangeODO
                    : nextUpperArmFrontLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSuspensionSelection(selection: uafr),
            "remaining_km": remainingUpperArmFrontRightController.text.isEmpty
                ? remainingUpperArmFrontRight
                : remainingUpperArmFrontRightController.text,
            "next_service_odo":
                nextUpperArmFrontRightChangeODOlController.text.isEmpty
                    ? nextUpperArmFrontRightChangeODO
                    : nextUpperArmFrontRightChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSuspensionSelection(selection: tar),
            "remaining_km": remainingTrailorArmRearController.text.isEmpty
                ? remainingTrailorArmRear
                : remainingTrailorArmRearController.text,
            "next_service_odo":
                nextTrailorArmRearChangeODOlController.text.isEmpty
                    ? nextTrailorArmRearChangeODO
                    : nextTrailorArmRearChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSuspensionSelection(selection: abli),
            "remaining_km": remainingAxleBootLeftInnerController.text.isEmpty
                ? remainingAxleBootLeftInner
                : remainingAxleBootLeftInnerController.text,
            "next_service_odo":
                nextAxleBootLeftInnerChangeODOlController.text.isEmpty
                    ? nextAxleBootLeftInnerChangeODO
                    : nextAxleBootLeftInnerChangeODOlController.text,
          },
          {
            "component": 9,
            "status": getSuspensionSelection(selection: abri),
            "remaining_km": remainingAxleBootRightInnerController.text.isEmpty
                ? remainingAxleBootRightInner
                : remainingAxleBootRightInnerController.text,
            "next_service_odo":
                nextAxleBootRightInnerChangeODOlController.text.isEmpty
                    ? nextAxleBootRightInnerChangeODO
                    : nextAxleBootRightInnerChangeODOlController.text,
          },
          {
            "component": 10,
            "status": getSuspensionSelection(selection: abro),
            "remaining_km": remainingAxleBootRightOuterController.text.isEmpty
                ? remainingAxleBootRightOuter
                : remainingAxleBootRightOuterController.text,
            "next_service_odo":
                nextAxleBootRightOuterChangeODOlController.text.isEmpty
                    ? nextAxleBootRightOuterChangeODO
                    : nextAxleBootRightOuterChangeODOlController.text,
          },
          {
            "component": 11,
            "status": getSuspensionSelection(selection: ablo),
            "remaining_km": remainingAxleBootLeftOuterController.text.isEmpty
                ? remainingAxleBootLeftOuter
                : remainingAxleBootLeftOuterController.text,
            "next_service_odo":
                nextAxleBootLeftOuterChangeODOlController.text.isEmpty
                    ? nextAxleBootLeftOuterChangeODO
                    : nextAxleBootLeftOuterChangeODOlController.text,
          },
          {
            "component": 12,
            "status": getSuspensionSelection(selection: lrfl),
            "remaining_km": remainingLinkRodFrontLeftController.text.isEmpty
                ? remainingLinkRodFrontLeft
                : remainingLinkRodFrontLeftController.text,
            "next_service_odo":
                nextLinkRodFrontLeftChangeODOlController.text.isEmpty
                    ? nextLinkRodFrontLeftChangeODO
                    : nextLinkRodFrontLeftChangeODOlController.text,
          },
          {
            "component": 13,
            "status": getSuspensionSelection(selection: lrfr),
            "remaining_km": remainingLinkRodFrontRightController.text.isEmpty
                ? remainingLinkRodFrontRight
                : remainingLinkRodFrontRightController.text,
            "next_service_odo":
                nextLinkRodFrontRightChangeODOlController.text.isEmpty
                    ? nextLinkRodFrontRightChangeODO
                    : nextLinkRodFrontRightChangeODOlController.text,
          },
          {
            "component": 14,
            "status": getSuspensionSelection(selection: lrrl),
            "remaining_km": remainingLinkRodRearLeftController.text.isEmpty
                ? remainingLinkRodRearLeft
                : remainingLinkRodRearLeftController.text,
            "next_service_odo":
                nextLinkRodRearLeftChangeODOlController.text.isEmpty
                    ? nextLinkRodRearLeftChangeODO
                    : nextLinkRodRearLeftChangeODOlController.text,
          },
          {
            "component": 15,
            "status": getSuspensionSelection(selection: lrrr),
            "remaining_km": remainingLinkRodRearRightController.text.isEmpty
                ? remainingLinkRodRearRight
                : remainingLinkRodRearRightController.text,
            "next_service_odo":
                nextLinkRodRearRightChangeODOlController.text.isEmpty
                    ? nextLinkRodRearRightChangeODO
                    : nextLinkRodRearRightChangeODOlController.text,
          },
          {
            "component": 16,
            "status": getSuspensionSelection(selection: brbf),
            "remaining_km": remainingBalanceRodBushFrontController.text.isEmpty
                ? remainingBalanceRodBushFront
                : remainingBalanceRodBushFrontController.text,
            "next_service_odo":
                nextBalanceRodBushFrontChangeODOlController.text.isEmpty
                    ? nextBalanceRodBushFrontChangeODO
                    : nextBalanceRodBushFrontChangeODOlController.text,
          },
          {
            "component": 17,
            "status": getSuspensionSelection(selection: brbr),
            "remaining_km": remainingBalanceRodBushRearController.text.isEmpty
                ? remainingBalanceRodBushRear
                : remainingBalanceRodBushRearController.text,
            "next_service_odo":
                nextBalanceRodBushRearChangeODOlController.text.isEmpty
                    ? nextBalanceRodBushRearChangeODO
                    : nextBalanceRodBushRearChangeODOlController.text,
          },
        ],
        "ac": [
          {
            "component": 1,
            "status": getSelection(selection: acGas),
            "remaining_km": remainingAcGasController.text.isEmpty
                ? remainingAcGas
                : remainingAcGasController.text,
            "next_service_odo": nextAcGasChangeODOlController.text.isEmpty
                ? nextAcGasChangeODO
                : nextAcGasChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: compressor),
            "remaining_km": remainingCompressorController.text.isEmpty
                ? remainingCompressor
                : remainingCompressorController.text,
            "next_service_odo": nextCompressorChangeODOlController.text.isEmpty
                ? nextCompressorChangeODO
                : nextCompressorChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: condenser),
            "remaining_km": remainingCondenserController.text.isEmpty
                ? remainingCondenser
                : remainingCondenserController.text,
            "next_service_odo": nextCondenserChangeODOlController.text.isEmpty
                ? nextCondenserChangeODO
                : nextCondenserChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: evaporator),
            "remaining_km": remainingEvaporatorController.text.isEmpty
                ? remainingEvaporator
                : remainingEvaporatorController.text,
            "next_service_odo": nextEvaporatorChangeODOlController.text.isEmpty
                ? nextEvaporatorChangeODO
                : nextEvaporatorChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: exValve),
            "remaining_km": remainingExValveController.text.isEmpty
                ? remainingExValve
                : remainingExValveController.text,
            "next_service_odo": nextExValveChangeODOlController.text.isEmpty
                ? nextExValveChangeODO
                : nextExValveChangeODOlController.text,
          },
        ],
        "steering": [
          {
            "component": 1,
            "status": getSelection(selection: sbl),
            "remaining_km": remainingSteeringBootLeftController.text.isEmpty
                ? remainingSteeringBootLeft
                : remainingSteeringBootLeftController.text,
            "next_service_odo":
                nextSteeringBootLeftChangeODOlController.text.isEmpty
                    ? nextSteeringBootLeftChangeODO
                    : nextSteeringBootLeftChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: sbr),
            "remaining_km": remainingSteeringBootRightController.text.isEmpty
                ? remainingSteeringBootRight
                : remainingSteeringBootRightController.text,
            "next_service_odo":
                nextSteeringBootRightChangeODOlController.text.isEmpty
                    ? nextSteeringBootRightChangeODO
                    : nextSteeringBootRightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: sel),
            "remaining_km": remainingSteeringEndLeftController.text.isEmpty
                ? remainingSteeringEndLeft
                : remainingSteeringEndLeftController.text,
            "next_service_odo":
                nextSteeringEndLeftChangeODOlController.text.isEmpty
                    ? nextSteeringEndLeftChangeODO
                    : nextSteeringEndLeftChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: ser),
            "remaining_km": remainingSteeringEndRightController.text.isEmpty
                ? remainingSteeringEndRight
                : remainingSteeringEndRightController.text,
            "next_service_odo":
                nextSteeringEndRightChangeODOlController.text.isEmpty
                    ? nextSteeringEndRightChangeODO
                    : nextSteeringEndRightChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: bjl),
            "remaining_km": remainingBallJointLeftController.text.isEmpty
                ? remainingBallJointLeft
                : remainingBallJointLeftController.text,
            "next_service_odo":
                nextBallJointLeftChangeODOlController.text.isEmpty
                    ? nextBallJointLeftChangeODO
                    : nextBallJointLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: bjr),
            "remaining_km": remainingBallJointRightController.text.isEmpty
                ? remainingBallJointRight
                : remainingBallJointRightController.text,
            "next_service_odo":
                nextBallJointRightChangeODOlController.text.isEmpty
                    ? nextBallJointRightChangeODO
                    : nextBallJointRightChangeODOlController.text,
          },
        ],
        "light": [
          {
            "component": 1,
            "status": getLampSelection(selection: headLight),
            "remaining_km": remainingHeadLightController.text.isEmpty
                ? remainingHeadLight
                : remainingHeadLightController.text,
            "next_service_odo": nextHeadLightChangeODOlController.text.isEmpty
                ? nextHeadLightChangeODO
                : nextHeadLightChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getLampSelection(selection: parkLight),
            "remaining_km": remainingParkLightController.text.isEmpty
                ? remainingParkLight
                : remainingParkLightController.text,
            "next_service_odo": nextParkLightChangeODOlController.text.isEmpty
                ? nextParkLightChangeODO
                : nextParkLightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getLampSelection(selection: indicators),
            "remaining_km": remainingIndicatorsController.text.isEmpty
                ? remainingIndicators
                : remainingIndicatorsController.text,
            "next_service_odo": nextIndicatorsChangeODOlController.text.isEmpty
                ? nextIndicatorsChangeODO
                : nextIndicatorsChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getLampSelection(selection: reverseGearLight),
            "remaining_km": remainingReverseGearController.text.isEmpty
                ? remainingReverseGear
                : remainingReverseGearController.text,
            "next_service_odo": nextReverseGearChangeODOlController.text.isEmpty
                ? nextReverseGearChangeODO
                : nextReverseGearChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getLampSelection(selection: dimBright),
            "remaining_km": remainingDimBrightController.text.isEmpty
                ? remainingDimBright
                : remainingDimBrightController.text,
            "next_service_odo": nextDimBrightChangeODOlController.text.isEmpty
                ? nextDimBrightChangeODO
                : nextDimBrightChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getLampSelection(selection: fogLamps),
            "remaining_km": remainingFogLampsController.text.isEmpty
                ? remainingFogLamps
                : remainingFogLampsController.text,
            "next_service_odo": nextFogLampsChangeODOlController.text.isEmpty
                ? nextFogLampsChangeODO
                : nextFogLampsChangeODOlController.text,
          },
        ],
        "fuel": [
          {
            "component": 1,
            "status": getSelection(selection: fuelPump),
            "remaining_km": remainingFuelPumpController.text.isEmpty
                ? remainingFuelPump
                : remainingFuelPumpController.text,
            "next_service_odo": nextFuelPumpChangeODOlController.text.isEmpty
                ? nextFuelPumpChangeODO
                : nextFuelPumpChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: fuelFilter),
            "remaining_km": remainingFuelFilterController.text.isEmpty
                ? remainingFuelFilter
                : remainingFuelFilterController.text,
            "next_service_odo": nextFuelFilterChangeODOlController.text.isEmpty
                ? nextFuelFilterChangeODO
                : nextFuelFilterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: canister),
            "remaining_km": remainingCanisterController.text.isEmpty
                ? remainingCanister
                : remainingCanisterController.text,
            "next_service_odo": nextCanisterChangeODOlController.text.isEmpty
                ? nextCanisterChangeODO
                : nextCanisterChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: fuelTank),
            "remaining_km": remainingFuelTankController.text.isEmpty
                ? remainingFuelTank
                : remainingFuelTankController.text,
            "next_service_odo": nextFuelTankChangeODOlController.text.isEmpty
                ? nextFuelTankChangeODO
                : nextFuelTankChangeODOlController.text,
          },
        ],
        "other": [
          {
            "component": 1,
            "status": getSelection(selection: centerLock),
            "remarks": clRemarks ?? "",
            "remaining_km": remainingCenterLockController.text.isEmpty
                ? remainingCenterLock
                : remainingCenterLockController.text,
            "next_service_odo": nextCenterLockChangeODOlController.text.isEmpty
                ? nextCenterLockChangeODO
                : nextCenterLockChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: windowLifter),
            "remarks": wlRemarks ?? "",
            "remaining_km": remainingWindowLifterController.text.isEmpty
                ? remainingWindowLifter
                : remainingWindowLifterController.text,
            "next_service_odo":
                nextWindowLifterChangeODOlController.text.isEmpty
                    ? nextWindowLifterChangeODO
                    : nextWindowLifterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: alignment),
            "remaining_km": remainingAlignmentController.text.isEmpty
                ? remainingAlignment
                : remainingAlignmentController.text,
            "next_service_odo": nextAlignmentChangeODOlController.text.isEmpty
                ? nextAlignmentChangeODO
                : nextAlignmentChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: wheelBalance),
            "remaining_km": remainingWheelBalanceController.text.isEmpty
                ? remainingWheelBalance
                : remainingWheelBalanceController.text,
            "next_service_odo":
                nextWheelBalanceChangeODOlController.text.isEmpty
                    ? nextWheelBalanceChangeODO
                    : nextWheelBalanceChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: wiperBladeFront),
            "remaining_km": remainingWiperBladeFrontController.text.isEmpty
                ? remainingWiperBladeFront
                : remainingWiperBladeFrontController.text,
            "next_service_odo":
                nextWiperBladeFrontChangeODOlController.text.isEmpty
                    ? nextWiperBladeFrontChangeODO
                    : nextWiperBladeFrontChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: wiperBladeRear),
            "remaining_km": remainingWiperBladeRearController.text.isEmpty
                ? remainingWiperBladeRear
                : remainingWiperBladeRearController.text,
            "next_service_odo":
                nextWiperBladeRearChangeODOlController.text.isEmpty
                    ? nextWiperBladeRearChangeODO
                    : nextWiperBladeRearChangeODOlController.text,
          },
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
    log(params.toString());
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
