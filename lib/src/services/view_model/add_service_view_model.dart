import 'dart:convert';
import 'dart:developer';

import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
import 'package:carezyadminapp/src/services/model/oodo_model.dart';
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
  String? oilLife;

  List<Garage> garageList = [];
  Garage? selectedGarage;

  List<Customer> customerList = [];
  Customer? selectedCustomer;

  bool enableButton = false;

  String? remainingOil;

  /// Engine Data Variables
  Selection? engineOil;
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
  Selection? radiator;

  String? radiatorPercentage;

  Selection? radiatorHose;
  Selection? thermostat;
  Selection? engineCoolar;
  Selection? radiatorCap;
  Selection? coolantSpareTank;
  Selection? radiatorFanMotor;
  Selection? engineColant;
  Selection? engineCoolantLevel;
  String? engineCoolantLevelLife;
  String? engineCoolantLevelPercentage;

  //
  Selection? engineMount;
  String? engineMountLife;
  //
  String? numberOfEngineMounts;

  /// engine
  final lifeOilController = TextEditingController();
  final lifeOilFilterController = TextEditingController();
  final lifeAirFilterController = TextEditingController();
  final lifeAcFilterController = TextEditingController();
  final lifeSparkPlugController = TextEditingController();
  final lifeIgnitionCoilController = TextEditingController();
  final lifeValveCowerGasketController = TextEditingController();
  final lifePlugSealController = TextEditingController();
  final lifeEngineBeltController = TextEditingController();
  final lifeEngineBeltTentionerController = TextEditingController();
  final lifeIDLPulleyController = TextEditingController();
  final lifeInjectorsController = TextEditingController();
  final lifeSelfMotorController = TextEditingController();
  final lifeRadiatorController = TextEditingController();
  final lifeRadiatorHoseController = TextEditingController();
  final lifeThermostatController = TextEditingController();
  final lifeCoolantController = TextEditingController();
  final lifeEngineCoolarController = TextEditingController();
  final lifeRadiatorCapController = TextEditingController();
  final lifeCoolantSpareTankController = TextEditingController();
  final lifeRadiatorFanMotorController = TextEditingController();
  final lifeEngineCoolantLevelController = TextEditingController();
  final lifeEngineMountController = TextEditingController();
  // gear
  final lifeGearOilController = TextEditingController();
  final lifeGearFilterController = TextEditingController();
  final lifeFourWheelOilController = TextEditingController();
  final lifeTransmissionControlModuleController = TextEditingController();
  final lifeGearGasketController = TextEditingController();
  final lifeGearMountController = TextEditingController();
  final lifeGearCoolarController = TextEditingController();
  // differential
  final lifeFrontDifferentialOilController = TextEditingController();
  final lifeShaftStatusController = TextEditingController();
  final lifeShaftSealsController = TextEditingController();
  final lifeRearDifferentialOilController = TextEditingController();
  final lifeDifferentialBushesController = TextEditingController();
  // break system
  final lifeFrontLeftBreakDiscController = TextEditingController();
  final lifeFrontRightBreakDiscController = TextEditingController();
  final lifeRearLeftBreakDiscController = TextEditingController();
  final lifeRearRightBreakDiscController = TextEditingController();
  final lifeFrontBreakPadController = TextEditingController();
  final lifeRearBreakPadController = TextEditingController();
  final lifeRearBreakShoeController = TextEditingController();
  final lifeBreakFluidController = TextEditingController();
  // suspension system
  final lifeFrontLeftLowerArmController = TextEditingController();
  final lifeFrontRightLowerArmController = TextEditingController();
  final lifeRearLeftLowerArmController = TextEditingController();
  final lifeRearRightLowerArmController = TextEditingController();
  final lifeUpperArmFrontLeftController = TextEditingController();
  final lifeUpperArmFrontRightController = TextEditingController();
  final lifeTrailorArmRearController = TextEditingController();
  final lifeAxleBootLeftInnerController = TextEditingController();
  final lifeAxleBootRightInnerController = TextEditingController();
  final lifeAxleBootRightOuterController = TextEditingController();
  final lifeAxleBootRearLeftInnerController = TextEditingController();
  final lifeAxleBootLeftOuterController = TextEditingController();
  final lifeAbriRearController = TextEditingController();
  final lifeAbrrRearController = TextEditingController();
  final lifeAbroRearController = TextEditingController();
  final lifeAbloRearController = TextEditingController();
  final lifeLinkRodFrontLeftController = TextEditingController();
  final lifeLinkRodFrontRightController = TextEditingController();
  final lifeLinkRodRearLeftController = TextEditingController();
  final lifeLinkRodRearRightController = TextEditingController();
  final lifeBalanceRodBushFrontController = TextEditingController();
  final lifeBalanceRodBushRearController = TextEditingController();
  final lifeFshocklController = TextEditingController();
  final lifeFshockrController = TextEditingController();
  final lifeRshocklController = TextEditingController();
  final lifeRshockrController = TextEditingController();
  final lifeWlbearflController = TextEditingController();
  final lifeWlbearfrController = TextEditingController();
  final lifeWlbearrlController = TextEditingController();
  final lifeWlbearrrController = TextEditingController();
  // ac compartments
  final lifeAcGasController = TextEditingController();
  final lifeCompressorController = TextEditingController();
  final lifeCondenserController = TextEditingController();
  final lifeEvaporatorController = TextEditingController();
  final lifeExValveController = TextEditingController();
  // steering
  final lifeSteeringBootLeftController = TextEditingController();
  final lifeSteeringBootRightController = TextEditingController();
  final lifeSteeringEndLeftController = TextEditingController();
  final lifeSteeringEndRightController = TextEditingController();
  final lifeBallJointLeftController = TextEditingController();
  final lifeBallJointRightController = TextEditingController();
  // light system
  final lifeHeadLightController = TextEditingController();
  final lifeParkLightController = TextEditingController();
  final lifeIndicatorsController = TextEditingController();
  final lifeReverseGearController = TextEditingController();
  final lifeDimBrightController = TextEditingController();
  final lifeFogLampsController = TextEditingController();
  // fuel system
  final lifeFuelPumpController = TextEditingController();
  final lifeFuelFilterController = TextEditingController();
  final lifeCanisterController = TextEditingController();
  final lifeFuelTankController = TextEditingController();
  // other accessories
  final lifeCenterLockController = TextEditingController();
  final lifeWindowLifterController = TextEditingController();
  final lifeAlignmentController = TextEditingController();
  final lifeWheelBalanceController = TextEditingController();

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
  Selection? gearFilter;
  Selection? fourWheelOil;
  Selection? transmissionControlModule;
  Selection? gearGasket;
  Selection? gearMount;
  String? noOfGearMounts;
  Selection? gearCoolar;

  /// Differential Data Variables
  Selection? frontDifferentialOil;
  Selection? shaftStatus;
  Selection? shaftSeals;
  Selection? rearDifferentialOil;
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
  SuspensionSelection? abrir;
  SuspensionSelection? abrrr;
  SuspensionSelection? abror;
  SuspensionSelection? ablor;
  SuspensionSelection? fshockl;
  SuspensionSelection? fshockr;
  SuspensionSelection? rshockl;
  SuspensionSelection? rshockr;
  SuspensionSelection? wlbearfl;
  SuspensionSelection? wlbearfr;
  SuspensionSelection? wlbearrl;
  SuspensionSelection? wlbearrr;

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
  Selection? mainBatterySelection;
  String? mainBatteryAmpere;
  String? mainBatteryBrand;
  String? mainBatteryType;

  Selection? auxiliaryBatterySelection;
  String? auxiliaryBatteryAmpere;
  String? auxiliaryBatteryBrand;
  String? auxiliaryBatteryType;

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

  final remainingAbriRearLeftController = TextEditingController();
  final nextAbriRearLeftChangeODOController = TextEditingController();

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

  List<Component> componentList = [];

  Future<bool?> getOodoReadingAndOthers(int customerID) async {
    clearAllControllers();
    currentOodometerReading = null;
    componentList = [];
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
          componentList.addAll(right.results?.data?.components ?? []);
          assignAllValues();
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
            "oil_life": lifeOilController.text,
            "remaining_km": remainingOilController.text,
            "next_service_odo": nextOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: oilFilter),
            "oil_life": oilFilterOdoController.text,
            "remaining_km": remainingOilFilterController.text,
            "next_service_odo": oilFilterOdoController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: airFilter),
            "oil_life": lifeAirFilterController.text,
            "remaining_km": remainingAirFilterController.text,
            "next_service_odo": nextAirFilterChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: acFilter),
            "oil_life": lifeAcFilterController.text,
            "remaining_km": remainingAcFilterController.text,
            "next_service_odo": nextAcFilterChangeODOlController.text,
          },
          {
            "component": 5,
            "oil_life": lifeSparkPlugController.text,
            "status": getSelection(selection: sparkPlug),
            "remaining_km": remainingSparkPlugController.text,
            "next_service_odo": nextSparkPlugChangeODOlController.text,
          },
          {
            "component": 6,
            "oil_life": lifeIgnitionCoilController.text,
            "status": getSelection(selection: ignitionCoil),
            "remaining_km": remainingIgnitionCoilController.text,
            "next_service_odo": nextIgnitionCoilChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: valveCowerGasket),
            "oil_life": lifeValveCowerGasketController.text,
            "remaining_km": remainingValveCowerGasketController.text,
            "next_service_odo": nextValveCowerGasketChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSelection(selection: plugSeal),
            "oil_life": lifePlugSealController.text,
            "remaining_km": remainingPlugSealController.text,
            "next_service_odo": nextPlugSealChangeODOlController.text,
          },
          {
            "component": 9,
            "oil_life": lifeEngineBeltController.text,
            "status": getSelection(selection: engineBelt),
            "remaining_km": remainingEngineBeltController.text,
            "next_service_odo": nextEngineBeltChangeODOlController.text,
          },
          {
            "component": 10,
            "oil_life": lifeEngineBeltTentionerController.text,
            "status": getSelection(selection: engineBeltTentioner),
            "remaining_km": remainingEngineBeltTentionerController.text,
            "next_service_odo":
                nextEngineBeltTentionerChangeODOlController.text,
          },
          {
            "component": 11,
            "status": getSelection(selection: idlPulley),
            "oil_life": lifeIDLPulleyController.text,
            "remaining_km": remainingIDLPulleyController.text,
            "next_service_odo": nextIDLPulleyChangeODOlController.text,
          },
          {
            "component": 12,
            "oil_life": lifeInjectorsController.text,
            "status": getSelection(selection: injectors),
            "remaining_km": remainingInjectorsController.text,
            "next_service_odo": nextInjectorsChangeODOlController.text,
          },
          {
            "component": 13,
            "oil_life": lifeSelfMotorController.text,
            "status": getSelection(selection: selfMotor),
            "remaining_km": remainingSelfMotorController.text,
            "next_service_odo": nextSelfMotorChangeODOlController.text,
          },
          {
            "component": 14,
            "status": getSelection(selection: engineMount),
            "no_of_mounts": numberOfEngineMounts ?? '',
            "oil_life": lifeEngineMountController.text,
            "remaining_km": remainingEngineMountController.text,
            "next_service_odo": nextEngineMountChangeODOlController.text,
          },
          {
            "component": 15,
            "status": getSelection(selection: radiator),
            "oil_life": lifeRadiatorController.text,
            "remaining_km": remainingRadiatorController.text,
            "next_service_odo": nextRadiatorController.text,
          },
          {
            "component": 16,
            "status": getSelection(selection: radiatorHose),
            "oil_life": lifeRadiatorHoseController.text,
            "remaining_km": remainingRadiatorHoseController.text,
            "next_service_odo": nextRadiatorHoseController.text,
          },
          {
            "component": 17,
            "status": getSelection(selection: thermostat),
            "oil_life": lifeThermostatController.text,
            "remaining_km": remainingThermostatController.text,
            "next_service_odo": nextThermostatController.text,
          },
          {
            "component": 18,
            "status": getSelection(selection: engineColant),
            "oil_life": lifeCoolantController.text,
            "remaining_km": remainingCoolantController.text,
            "next_service_odo": nextCoolantController.text,
          },
          {
            "component": 19,
            "status": getSelection(selection: engineCoolar),
            "oil_life": lifeEngineCoolarController.text,
            "remaining_km": remainingEngineCoolarController.text,
            "next_service_odo": nextEngineCoolarController.text,
          },
          {
            "component": 20,
            "status": getSelection(selection: radiatorCap),
            "oil_life": lifeRadiatorCapController.text,
            "remaining_km": remainingRadiatorCapController.text,
            "next_service_odo": nextRadiatorCapController.text,
          },
          {
            "component": 21,
            "status": getSelection(selection: coolantSpareTank),
            "oil_life": lifeCoolantSpareTankController.text,
            "remaining_km": remainingCoolantSpareTankController.text,
            "next_service_odo": nextCoolantSpareTankController.text,
          },
          {
            "component": 22,
            "status": getSelection(selection: radiatorFanMotor),
            "oil_life": lifeRadiatorFanMotorController.text,
            "remaining_km": remainingRadiatorFanMotorController.text,
            "next_service_odo": nextRadiatorFanMotorController.text,
          },
          {
            "component": 23,
            "status": getSelection(selection: engineCoolantLevel),
            "oil_life": lifeEngineCoolantLevelController.text,
            "remaining_km": remainingEngineCoolantLevelController.text,
            "next_service_odo": nextEngineCoolantLevelController.text,
            "percentage": engineCoolantLevelPercentage,
          },
        ],
        "gear": [
          {
            "component": 1,
            "status": getSelection(selection: gearOil),
            "oil_life": lifeGearOilController.text,
            "remaining_km": remainingGearOilController.text,
            "next_service_odo": nextGearOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: gearFilter),
            "oil_life": lifeGearFilterController.text,
            "remaining_km": remainingGearFilterController.text,
            "next_service_odo": nextGearFilterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: gearGasket),
            "oil_life": lifeGearGasketController.text,
            "remaining_km": remainingGearGasketController.text,
            "next_service_odo": nextGearGasketChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: fourWheelOil),
            "oil_life": lifeFourWheelOilController.text,
            "next_service_odo": nextFourWheelOilChangeODOlController.text,
            "remaining_km": remainingFourWheelOilController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: transmissionControlModule),
            "oil_life": lifeTransmissionControlModuleController.text,
            "remaining_km": remainingTransmissionControlOilController.text,
            "next_service_odo":
                nextTransmissionControlOilChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: gearMount),
            "no_of_mounts": noOfGearMounts ?? '',
            "oil_life": lifeGearMountController.text,
            "remaining_km": remainingGearMountController.text,
            "next_service_odo": nextGearMountChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: gearCoolar),
            "oil_life": lifeGearCoolarController.text,
            "remaining_km": remainingGearCoolarController.text,
            "next_service_odo": nextGearCoolarODOController.text,
          },
        ],
        "differential": [
          {
            "component": 1,
            "status": getSelection(selection: frontDifferentialOil),
            "oil_life": lifeFrontDifferentialOilController.text,
            "remaining_km": frontDifferentialOilLifeController.text,
            "next_service_odo":
                nextFrontDifferentialOilChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: rearDifferentialOil),
            "oil_life": lifeRearDifferentialOilController.text,
            "remaining_km": rearDifferentialOilLifeController.text,
            "next_service_odo":
                nextRearDifferentialOilChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: differentialBushes),
            "oil_life": lifeDifferentialBushesController.text,
            "remaining_km": remainingDifferentialBushesController.text,
            "next_service_odo": nextDifferentialBushesChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: shaftStatus),
            "oil_life": lifeShaftStatusController.text,
            "remaining_km": remainingShaftStatusController.text,
            "next_service_odo": nextShaftStatusChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: shaftSeals),
            "oil_life": lifeShaftSealsController.text,
            "remaining_km": remainingShaftSealsController.text,
            "next_service_odo": nextShaftSealsChangeODOlController.text,
          }
        ],
        "break": [
          {
            "component": 1,
            "status": getSelection(selection: flBreakDisc),
            "thickness": flbdPercentage ?? "",
            "component_life": lifeFrontLeftBreakDiscController.text,
            "remaining_km": remainingFrontLeftBreakDiscController.text,
            "next_service_odo": nextFrontLeftBreakDiscChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: frBreakDisc),
            "thickness": frbdPercentage ?? "",
            "component_life": lifeFrontRightBreakDiscController.text,
            "remaining_km": remainingFrontRightBreakDiscController.text,
            "next_service_odo":
                nextFrontRightBreakDiscChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: rlBreakDisc),
            "thickness": rlbdPercentage ?? "",
            "component_life": lifeRearLeftBreakDiscController.text,
            "remaining_km": remainingRearLeftBreakDiscController.text,
            "next_service_odo": nextRearLeftBreakDiscChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: rrBreakDisc),
            "thickness": rrbdPercentage ?? "",
            "component_life": lifeRearRightBreakDiscController.text,
            "remaining_km": remainingRearRightBreakDiscController.text,
            "next_service_odo": nextRearRightBreakDiscChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: fbPad),
            "thickness": fbPadPercentage ?? "",
            "component_life": lifeFrontBreakPadController.text,
            "remaining_km": remainingFrontBreakPadController.text,
            "next_service_odo": nextFrontBreakPadChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: rbPad),
            "thickness": rbPadPercentage ?? "",
            "component_life": lifeRearBreakPadController.text,
            "remaining_km": remainingRearBreakPadController.text,
            "next_service_odo": nextRearBreakPadChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSelection(selection: rbShoe),
            "thickness": rbShoePercentage ?? "",
            "component_life": lifeRearBreakShoeController.text,
            "remaining_km": remainingRearBreakShoeController.text,
            "next_service_odo": nextRearBreakShoeChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSelection(selection: breakFluid),
            "thickness": breakFluidPercentage ?? "",
            "component_life": lifeBreakFluidController.text,
            "remaining_km": remainingBreakFluidController.text,
            "next_service_odo": nextBreakFluidChangeODOlController.text,
          },
        ],
        "suspension": [
          {
            "component": 1,
            "status": getSuspensionSelection(selection: flla),
            "component_life": lifeFrontLeftLowerArmController.text,
            "remaining_km": remainingFrontLeftLowerArmController.text,
            "next_service_odo": nextFrontLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSuspensionSelection(selection: frla),
            "component_life": lifeFrontRightLowerArmController.text,
            "remaining_km": remainingFrontRightLowerArmController.text,
            "next_service_odo": nextFrontRightLowerArmChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSuspensionSelection(selection: rlla),
            "component_life": lifeRearLeftLowerArmController.text,
            "remaining_km": remainingRearLeftLowerArmController.text,
            "next_service_odo": nextRearLeftLowerArmChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSuspensionSelection(selection: rrla),
            "component_life": lifeRearRightLowerArmController.text,
            "remaining_km": remainingRearRightLowerArmController.text,
            "next_service_odo": nextRearRightLowerArmChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSuspensionSelection(selection: uafl),
            "component_life": lifeUpperArmFrontLeftController.text,
            "remaining_km": remainingUpperArmFrontLeftController.text,
            "next_service_odo": nextUpperArmFrontLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSuspensionSelection(selection: uafr),
            "component_life": lifeUpperArmFrontRightController.text,
            "remaining_km": remainingUpperArmFrontRightController.text,
            "next_service_odo": nextUpperArmFrontRightChangeODOlController.text,
          },
          {
            "component": 7,
            "status": getSuspensionSelection(selection: tar),
            "component_life": lifeTrailorArmRearController.text,
            "remaining_km": remainingTrailorArmRearController.text,
            "next_service_odo": nextTrailorArmRearChangeODOlController.text,
          },
          {
            "component": 8,
            "status": getSuspensionSelection(selection: abli),
            "component_life": lifeAxleBootLeftInnerController.text,
            "remaining_km": remainingAxleBootLeftInnerController.text,
            "next_service_odo": nextAxleBootLeftInnerChangeODOlController.text,
          },
          {
            "component": 9,
            "status": getSuspensionSelection(selection: abri),
            "component_life": lifeAxleBootRightInnerController.text,
            "remaining_km": remainingAxleBootRightInnerController.text,
            "next_service_odo": nextAxleBootRightInnerChangeODOlController.text,
          },
          {
            "component": 10,
            "status": getSuspensionSelection(selection: abro),
            "component_life": lifeAxleBootRightOuterController.text,
            "remaining_km": remainingAxleBootRightOuterController.text,
            "next_service_odo": nextAxleBootRightOuterChangeODOlController.text,
          },
          {
            "component": 11,
            "status": getSuspensionSelection(selection: ablo),
            "component_life": lifeAxleBootLeftOuterController.text,
            "remaining_km": remainingAxleBootLeftOuterController.text,
            "next_service_odo": nextAxleBootLeftOuterChangeODOlController.text,
          },
          {
            "component": 12,
            "status": getSuspensionSelection(selection: abrir),
            "component_life": lifeAbriRearController.text,
            "remaining_km": remainingAbriRearController.text,
            "next_service_odo": nextAbriRearChangeODOController.text,
          },
          {
            "component": 13,
            "status": getSuspensionSelection(selection: abrrr),
            "component_life": lifeAbrrRearController.text,
            "remaining_km": remainingAbrrRearController.text,
            "next_service_odo": nextAbrrRearChangeODOController.text,
          },
          {
            "component": 14,
            "status": getSuspensionSelection(selection: abror),
            "component_life": lifeAbroRearController.text,
            "remaining_km": remainingAbroRearController.text,
            "next_service_odo": nextAbroRearChangeODOController.text,
          },
          {
            "component": 15,
            "status": getSuspensionSelection(selection: ablor),
            "component_life": lifeAbloRearController.text,
            "remaining_km": remainingAbloRearController.text,
            "next_service_odo": nextAbloRearChangeODOController.text,
          },
          {
            "component": 16,
            "status": getSuspensionSelection(selection: lrfl),
            "component_life": lifeLinkRodFrontLeftController.text,
            "remaining_km": remainingLinkRodFrontLeftController.text,
            "next_service_odo": nextLinkRodFrontLeftChangeODOlController.text,
          },
          {
            "component": 17,
            "status": getSuspensionSelection(selection: lrfr),
            "component_life": lifeLinkRodFrontRightController.text,
            "remaining_km": remainingLinkRodFrontRightController.text,
            "next_service_odo": nextLinkRodFrontRightChangeODOlController.text,
          },
          {
            "component": 18,
            "status": getSuspensionSelection(selection: lrrl),
            "component_life": lifeLinkRodRearLeftController.text,
            "remaining_km": remainingLinkRodRearLeftController.text,
            "next_service_odo": nextLinkRodRearLeftChangeODOlController.text,
          },
          {
            "component": 19,
            "status": getSuspensionSelection(selection: lrrr),
            "component_life": lifeLinkRodRearRightController.text,
            "remaining_km": remainingLinkRodRearRightController.text,
            "next_service_odo": nextLinkRodRearRightChangeODOlController.text,
          },
          {
            "component": 20,
            "status": getSuspensionSelection(selection: brbf),
            "component_life": lifeBalanceRodBushFrontController.text,
            "remaining_km": remainingBalanceRodBushFrontController.text,
            "next_service_odo": nextBalanceRodBushRearChangeODOlController.text,
          },
          {
            "component": 21,
            "status": getSuspensionSelection(selection: brbr),
            "component_life": lifeBalanceRodBushRearController.text,
            "remaining_km": remainingBalanceRodBushRearController.text,
            "next_service_odo": nextBalanceRodBushRearChangeODOlController.text,
          },
          {
            "component": 22,
            "status": getSuspensionSelection(selection: fshockl),
            "component_life": lifeFshocklController.text,
            "remaining_km": remainingFshocklController.text,
            "next_service_odo": nextFshocklChangeODOController.text,
          },
          {
            "component": 23,
            "status": getSuspensionSelection(selection: fshockr),
            "component_life": lifeFshockrController.text,
            "remaining_km": remainingFshockrController.text,
            "next_service_odo": nextFshockrChangeODOController.text,
          },
          {
            "component": 24,
            "status": getSuspensionSelection(selection: rshockl),
            "component_life": lifeRshocklController.text,
            "remaining_km": remainingRshocklController.text,
            "next_service_odo": nextRshocklChangeODOController.text,
          },
          {
            "component": 25,
            "status": getSuspensionSelection(selection: rshockr),
            "component_life": lifeRshockrController.text,
            "remaining_km": remainingRshockrController.text,
            "next_service_odo": nextRshockrChangeODOController.text,
          },
          {
            "component": 26,
            "status": getSuspensionSelection(selection: wlbearfl),
            "component_life": lifeWlbearflController.text,
            "remaining_km": remainingWlbearflController.text,
            "next_service_odo": nextWlbearflChangeODOController.text,
          },
          {
            "component": 27,
            "status": getSuspensionSelection(selection: wlbearfr),
            "component_life": lifeWlbearfrController.text,
            "remaining_km": remainingWlbearfrController.text,
            "next_service_odo": nextWlbearfrChangeODOController.text,
          },
          {
            "component": 28,
            "status": getSuspensionSelection(selection: wlbearrl),
            "component_life": lifeWlbearrlController.text,
            "remaining_km": remainingWlbearrlController.text,
            "next_service_odo": nextWlbearrlChangeODOController.text,
          },
          {
            "component": 29,
            "status": getSuspensionSelection(selection: wlbearrr),
            "component_life": lifeWlbearrrController.text,
            "remaining_km": remainingWlbearrrController.text,
            "next_service_odo": nextWlbearrrChangeODOController.text,
          },
        ],
        "ac": [
          {
            "component": 1,
            "status": getSelection(selection: acGas),
            "component_life": lifeAcGasController.text,
            "remaining_km": remainingAcGasController.text,
            "next_service_odo": nextAcGasChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: compressor),
            "component_life": lifeCompressorController.text,
            "remaining_km": remainingCompressorController.text,
            "next_service_odo": nextCompressorChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: condenser),
            "component_life": lifeCondenserController.text,
            "remaining_km": remainingCondenserController.text,
            "next_service_odo": nextCondenserChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: evaporator),
            "component_life": lifeEvaporatorController.text,
            "remaining_km": remainingEvaporatorController.text,
            "next_service_odo": nextEvaporatorChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: exValve),
            "component_life": lifeExValveController.text,
            "remaining_km": remainingExValveController.text,
            "next_service_odo": nextExValveChangeODOlController.text,
          },
        ],
        "steering": [
          {
            "component": 1,
            "status": getSelection(selection: sbl),
            "component_life": lifeSteeringBootLeftController.text,
            "remaining_km": remainingSteeringBootLeftController.text,
            "next_service_odo": nextSteeringBootLeftChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: sbr),
            "component_life": lifeSteeringBootRightController.text,
            "remaining_km": remainingSteeringBootRightController.text,
            "next_service_odo": nextSteeringBootRightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: sel),
            "component_life": lifeSteeringEndLeftController.text,
            "remaining_km": remainingSteeringEndLeftController.text,
            "next_service_odo": nextSteeringEndLeftChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: ser),
            "component_life": lifeSteeringEndRightController.text,
            "remaining_km": remainingSteeringEndRightController.text,
            "next_service_odo": nextSteeringEndRightChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getSelection(selection: bjl),
            "component_life": lifeBallJointLeftController.text,
            "remaining_km": remainingBallJointLeftController.text,
            "next_service_odo": nextBallJointLeftChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getSelection(selection: bjr),
            "component_life": lifeBallJointRightController.text,
            "remaining_km": remainingBallJointRightController.text,
            "next_service_odo": nextBallJointRightChangeODOlController.text,
          },
        ],
        "light": [
          {
            "component": 1,
            "status": getLampSelection(selection: headLight),
            "component_life": lifeHeadLightController.text,
            "remaining_km": remainingHeadLightController.text,
            "next_service_odo": nextHeadLightChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getLampSelection(selection: parkLight),
            "component_life": lifeParkLightController.text,
            "remaining_km": remainingParkLightController.text,
            "next_service_odo": nextParkLightChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getLampSelection(selection: indicators),
            "component_life": lifeIndicatorsController.text,
            "remaining_km": remainingIndicatorsController.text,
            "next_service_odo": nextIndicatorsChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getLampSelection(selection: reverseGearLight),
            "component_life": lifeReverseGearController.text,
            "remaining_km": remainingReverseGearController.text,
            "next_service_odo": nextReverseGearChangeODOlController.text,
          },
          {
            "component": 5,
            "status": getLampSelection(selection: dimBright),
            "component_life": lifeDimBrightController.text,
            "remaining_km": remainingDimBrightController.text,
            "next_service_odo": nextDimBrightChangeODOlController.text,
          },
          {
            "component": 6,
            "status": getLampSelection(selection: fogLamps),
            "component_life": lifeFogLampsController.text,
            "remaining_km": remainingFogLampsController.text,
            "next_service_odo": nextFogLampsChangeODOlController.text,
          },
        ],
        "fuel": [
          {
            "component": 1,
            "status": getSelection(selection: fuelPump),
            "component_life": lifeFuelPumpController.text,
            "remaining_km": remainingFuelPumpController.text,
            "next_service_odo": nextFuelPumpChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: fuelFilter),
            "component_life": lifeFuelFilterController.text,
            "remaining_km": remainingFuelFilterController.text,
            "next_service_odo": nextFuelFilterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: canister),
            "component_life": lifeCanisterController.text,
            "remaining_km": remainingCanisterController.text,
            "next_service_odo": nextCanisterChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: fuelTank),
            "component_life": lifeFuelTankController.text,
            "remaining_km": remainingFuelTankController.text,
            "next_service_odo": nextFuelTankChangeODOlController.text,
          },
        ],
        "other": [
          {
            "component": 1,
            "status": getSelection(selection: centerLock),
            "remarks": clRemarks ?? "",
            "component_life": lifeCenterLockController.text,
            "remaining_km": remainingCenterLockController.text,
            "next_service_odo": nextCenterLockChangeODOlController.text,
          },
          {
            "component": 2,
            "status": getSelection(selection: windowLifter),
            "remarks": wlRemarks ?? "",
            "component_life": lifeWindowLifterController.text,
            "remaining_km": remainingWindowLifterController.text,
            "next_service_odo": nextWindowLifterChangeODOlController.text,
          },
          {
            "component": 3,
            "status": getSelection(selection: alignment),
            "component_life": lifeAlignmentController.text,
            "remaining_km": remainingAlignmentController.text,
            "next_service_odo": nextAlignmentChangeODOlController.text,
          },
          {
            "component": 4,
            "status": getSelection(selection: wheelBalance),
            "component_life": lifeWheelBalanceController.text,
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
            "component": 8, //Main Battery
            "status": getSelection(selection: mainBatterySelection),
            "ah": mainBatteryAmpere,
            "type": mainBatteryType,
            "brand": mainBatteryBrand
          },
          {
            "component": 9, //Auxilary Battery
            "status": getSelection(selection: auxiliaryBatterySelection),
            "ah": auxiliaryBatteryAmpere,
            "type": auxiliaryBatteryType,
            "brand": auxiliaryBatteryBrand
          },
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

  assignAllValues() {
    // Engine components
    lifeOilController.text = getRemainingData(key: "Engine oil")?.oilLife ?? "";
    remainingOilController.text =
        getRemainingData(key: "Engine oil")?.remainingKm ?? "";
    nextOilChangeODOlController.text =
        getRemainingData(key: "Engine oil")?.nextServiceOdo ?? "";

    lifeOilFilterController.text =
        getRemainingData(key: "Oil filter")?.oilLife ?? "";
    remainingOilFilterController.text =
        getRemainingData(key: "Oil filter")?.remainingKm ?? "";
    oilFilterOdoController.text =
        getRemainingData(key: "Oil filter")?.nextServiceOdo ?? "";

    lifeAirFilterController.text =
        getRemainingData(key: "Air filter")?.oilLife ?? "";
    remainingAirFilterController.text =
        getRemainingData(key: "Air filter")?.remainingKm ?? "";
    nextAirFilterChangeODOlController.text =
        getRemainingData(key: "Air filter")?.nextServiceOdo ?? "";

    lifeAcFilterController.text =
        getRemainingData(key: "Ac filter")?.oilLife ?? "";
    remainingAcFilterController.text =
        getRemainingData(key: "Ac filter")?.remainingKm ?? "";
    nextAcFilterChangeODOlController.text =
        getRemainingData(key: "Ac filter")?.nextServiceOdo ?? "";

    lifeSparkPlugController.text =
        getRemainingData(key: "Spark plug")?.oilLife ?? "";
    remainingSparkPlugController.text =
        getRemainingData(key: "Spark plug")?.remainingKm ?? "";
    nextSparkPlugChangeODOlController.text =
        getRemainingData(key: "Spark plug")?.nextServiceOdo ?? "";

    lifeIgnitionCoilController.text =
        getRemainingData(key: "Ignition coil")?.oilLife ?? "";
    remainingIgnitionCoilController.text =
        getRemainingData(key: "Ignition coil")?.remainingKm ?? "";
    nextIgnitionCoilChangeODOlController.text =
        getRemainingData(key: "Ignition coil")?.nextServiceOdo ?? "";

    lifeValveCowerGasketController.text =
        getRemainingData(key: "Valve cover gasket")?.oilLife ?? "";
    remainingValveCowerGasketController.text =
        getRemainingData(key: "Valve cover gasket")?.remainingKm ?? "";
    nextValveCowerGasketChangeODOlController.text =
        getRemainingData(key: "Valve cover gasket")?.nextServiceOdo ?? "";

    lifePlugSealController.text =
        getRemainingData(key: "Plug seal")?.oilLife ?? "";
    remainingPlugSealController.text =
        getRemainingData(key: "Plug seal")?.remainingKm ?? "";
    nextPlugSealChangeODOlController.text =
        getRemainingData(key: "Plug seal")?.nextServiceOdo ?? "";

    lifeEngineBeltController.text =
        getRemainingData(key: "Engine belt")?.oilLife ?? "";
    remainingEngineBeltController.text =
        getRemainingData(key: "Engine belt")?.remainingKm ?? "";
    nextEngineBeltChangeODOlController.text =
        getRemainingData(key: "Engine belt")?.nextServiceOdo ?? "";

    lifeEngineBeltTentionerController.text =
        getRemainingData(key: "Engine belt tentioner")?.oilLife ?? "";
    remainingEngineBeltTentionerController.text =
        getRemainingData(key: "Engine belt tentioner")?.remainingKm ?? "";
    nextEngineBeltTentionerChangeODOlController.text =
        getRemainingData(key: "Engine belt tentioner")?.nextServiceOdo ?? "";

    lifeIDLPulleyController.text =
        getRemainingData(key: "Idl pulley")?.oilLife ?? "";
    remainingIDLPulleyController.text =
        getRemainingData(key: "Idl pulley")?.remainingKm ?? "";
    nextIDLPulleyChangeODOlController.text =
        getRemainingData(key: "Idl pulley")?.nextServiceOdo ?? "";

    lifeInjectorsController.text =
        getRemainingData(key: "Injectors")?.oilLife ?? "";
    remainingInjectorsController.text =
        getRemainingData(key: "Injectors")?.remainingKm ?? "";
    nextInjectorsChangeODOlController.text =
        getRemainingData(key: "Injectors")?.nextServiceOdo ?? "";

    lifeSelfMotorController.text =
        getRemainingData(key: "Self motor")?.oilLife ?? "";
    remainingSelfMotorController.text =
        getRemainingData(key: "Self motor")?.remainingKm ?? "";
    nextSelfMotorChangeODOlController.text =
        getRemainingData(key: "Self motor")?.nextServiceOdo ?? "";

    lifeEngineMountController.text =
        getRemainingData(key: "Engine mount")?.oilLife ?? "";
    remainingEngineMountController.text =
        getRemainingData(key: "Engine mount")?.remainingKm ?? "";
    nextEngineMountChangeODOlController.text =
        getRemainingData(key: "Engine mount")?.nextServiceOdo ?? "";

    lifeRadiatorController.text =
        getRemainingData(key: "Radiator")?.oilLife ?? "";
    remainingRadiatorController.text =
        getRemainingData(key: "Radiator")?.remainingKm ?? "";
    nextRadiatorController.text =
        getRemainingData(key: "Radiator")?.nextServiceOdo ?? "";

    lifeRadiatorHoseController.text =
        getRemainingData(key: "Radiator hose")?.oilLife ?? "";
    remainingRadiatorHoseController.text =
        getRemainingData(key: "Radiator hose")?.remainingKm ?? "";
    nextRadiatorHoseController.text =
        getRemainingData(key: "Radiator hose")?.nextServiceOdo ?? "";

    lifeThermostatController.text =
        getRemainingData(key: "Thermostat")?.oilLife ?? "";
    remainingThermostatController.text =
        getRemainingData(key: "Thermostat")?.remainingKm ?? "";
    nextThermostatController.text =
        getRemainingData(key: "Thermostat")?.nextServiceOdo ?? "";

    lifeCoolantController.text =
        getRemainingData(key: "Coolant")?.oilLife ?? "";
    remainingCoolantController.text =
        getRemainingData(key: "Coolant")?.remainingKm ?? "";
    nextCoolantController.text =
        getRemainingData(key: "Coolant")?.nextServiceOdo ?? "";

    lifeEngineCoolarController.text =
        getRemainingData(key: "Engine coolar")?.oilLife ?? "";
    remainingEngineCoolarController.text =
        getRemainingData(key: "Engine coolar")?.remainingKm ?? "";
    nextEngineCoolarController.text =
        getRemainingData(key: "Engine coolar")?.nextServiceOdo ?? "";

    lifeRadiatorCapController.text =
        getRemainingData(key: "Radiator cap")?.oilLife ?? "";
    remainingRadiatorCapController.text =
        getRemainingData(key: "Radiator cap")?.remainingKm ?? "";
    nextRadiatorCapController.text =
        getRemainingData(key: "Radiator cap")?.nextServiceOdo ?? "";

    lifeCoolantSpareTankController.text =
        getRemainingData(key: "Coolant spare tank")?.oilLife ?? "";
    remainingCoolantSpareTankController.text =
        getRemainingData(key: "Coolant spare tank")?.remainingKm ?? "";
    nextCoolantSpareTankController.text =
        getRemainingData(key: "Coolant spare tank")?.nextServiceOdo ?? "";

    lifeRadiatorFanMotorController.text =
        getRemainingData(key: "Radiator fan motor")?.oilLife ?? "";
    remainingRadiatorFanMotorController.text =
        getRemainingData(key: "Radiator fan motor")?.remainingKm ?? "";
    nextRadiatorFanMotorController.text =
        getRemainingData(key: "Radiator fan motor")?.nextServiceOdo ?? "";

    lifeEngineCoolantLevelController.text =
        getRemainingData(key: "Engine coolant level")?.oilLife ?? "";
    remainingEngineCoolantLevelController.text =
        getRemainingData(key: "Engine coolant level")?.remainingKm ?? "";
    nextEngineCoolantLevelController.text =
        getRemainingData(key: "Engine coolant level")?.nextServiceOdo ?? "";

    // Gear components
    lifeGearOilController.text =
        getRemainingData(key: "Gear oil")?.oilLife ?? "";
    remainingGearOilController.text =
        getRemainingData(key: "Gear oil")?.remainingKm ?? "";
    nextGearOilChangeODOlController.text =
        getRemainingData(key: "Gear oil")?.nextServiceOdo ?? "";

    lifeGearFilterController.text =
        getRemainingData(key: "Gear filter")?.oilLife ?? "";
    remainingGearFilterController.text =
        getRemainingData(key: "Gear filter")?.remainingKm ?? "";
    nextGearFilterChangeODOlController.text =
        getRemainingData(key: "Gear filter")?.nextServiceOdo ?? "";

    lifeFourWheelOilController.text =
        getRemainingData(key: "4 wheel oil")?.oilLife ?? "";
    remainingFourWheelOilController.text =
        getRemainingData(key: "4 wheel oil")?.remainingKm ?? "";
    nextFourWheelOilChangeODOlController.text =
        getRemainingData(key: "4 wheel oil")?.nextServiceOdo ?? "";

    lifeTransmissionControlModuleController.text =
        getRemainingData(key: "Transmition control module")?.oilLife ?? "";
    remainingTransmissionControlOilController.text =
        getRemainingData(key: "Transmition control module")?.remainingKm ?? "";
    nextTransmissionControlOilChangeODOlController.text =
        getRemainingData(key: "Transmition control module")?.nextServiceOdo ??
            "";

    lifeGearGasketController.text =
        getRemainingData(key: "Gear gasket")?.oilLife ?? "";
    remainingGearGasketController.text =
        getRemainingData(key: "Gear gasket")?.remainingKm ?? "";
    nextGearGasketChangeODOlController.text =
        getRemainingData(key: "Gear gasket")?.nextServiceOdo ?? "";

    lifeGearMountController.text =
        getRemainingData(key: "Gear mount")?.oilLife ?? "";
    remainingGearMountController.text =
        getRemainingData(key: "Gear mount")?.remainingKm ?? "";
    nextGearMountChangeODOlController.text =
        getRemainingData(key: "Gear mount")?.nextServiceOdo ?? "";

    lifeGearCoolarController.text =
        getRemainingData(key: "Gear coolar")?.oilLife ?? "";
    remainingGearCoolarController.text =
        getRemainingData(key: "Gear coolar")?.remainingKm ?? "";
    nextGearCoolarODOController.text =
        getRemainingData(key: "Gear coolar")?.nextServiceOdo ?? "";

    // Differential components
    lifeFrontDifferentialOilController.text =
        getRemainingData(key: "Front differential oil")?.oilLife ?? "";
    frontDifferentialOilLifeController.text =
        getRemainingData(key: "Front differential oil")?.remainingKm ?? "";
    nextFrontDifferentialOilChangeODOlController.text =
        getRemainingData(key: "Front differential oil")?.nextServiceOdo ?? "";

    lifeRearDifferentialOilController.text =
        getRemainingData(key: "Rear differential oil")?.oilLife ?? "";
    rearDifferentialOilLifeController.text =
        getRemainingData(key: "Rear differential oil")?.remainingKm ?? "";
    nextRearDifferentialOilChangeODOlController.text =
        getRemainingData(key: "Rear differential oil")?.nextServiceOdo ?? "";

    lifeDifferentialBushesController.text =
        getRemainingData(key: "Differential bushes")?.oilLife ?? "";
    remainingDifferentialBushesController.text =
        getRemainingData(key: "Differential bushes")?.remainingKm ?? "";
    nextDifferentialBushesChangeODOlController.text =
        getRemainingData(key: "Differential bushes")?.nextServiceOdo ?? "";

    lifeShaftStatusController.text =
        getRemainingData(key: "Shaft status")?.oilLife ?? "";
    remainingShaftStatusController.text =
        getRemainingData(key: "Shaft status")?.remainingKm ?? "";
    nextShaftStatusChangeODOlController.text =
        getRemainingData(key: "Shaft status")?.nextServiceOdo ?? "";

    lifeShaftSealsController.text =
        getRemainingData(key: "Shaft seals")?.oilLife ?? "";
    remainingShaftSealsController.text =
        getRemainingData(key: "Shaft seals")?.remainingKm ?? "";
    nextShaftSealsChangeODOlController.text =
        getRemainingData(key: "Shaft seals")?.nextServiceOdo ?? "";

    // Brake system components
    lifeFrontLeftBreakDiscController.text =
        getRemainingData(key: "Front left break disc")?.componentLife ?? "";
    remainingFrontLeftBreakDiscController.text =
        getRemainingData(key: "Front left break disc")?.remainingKm ?? "";
    nextFrontLeftBreakDiscChangeODOlController.text =
        getRemainingData(key: "Front left break disc")?.nextServiceOdo ?? "";

    lifeFrontRightBreakDiscController.text =
        getRemainingData(key: "Front right break disc")?.componentLife ?? "";
    remainingFrontRightBreakDiscController.text =
        getRemainingData(key: "Front right break disc")?.remainingKm ?? "";
    nextFrontRightBreakDiscChangeODOlController.text =
        getRemainingData(key: "Front right break disc")?.nextServiceOdo ?? "";

    lifeRearLeftBreakDiscController.text =
        getRemainingData(key: "Rear left break disc")?.componentLife ?? "";
    remainingRearLeftBreakDiscController.text =
        getRemainingData(key: "Rear left break disc")?.remainingKm ?? "";
    nextRearLeftBreakDiscChangeODOlController.text =
        getRemainingData(key: "Rear left break disc")?.nextServiceOdo ?? "";

    lifeRearRightBreakDiscController.text =
        getRemainingData(key: "Rear right break disc")?.componentLife ?? "";
    remainingRearRightBreakDiscController.text =
        getRemainingData(key: "Rear right break disc")?.remainingKm ?? "";
    nextRearRightBreakDiscChangeODOlController.text =
        getRemainingData(key: "Rear right break disc")?.nextServiceOdo ?? "";

    lifeFrontBreakPadController.text =
        getRemainingData(key: "Front break pad")?.componentLife ?? "";
    remainingFrontBreakPadController.text =
        getRemainingData(key: "Front break pad")?.remainingKm ?? "";
    nextFrontBreakPadChangeODOlController.text =
        getRemainingData(key: "Front break pad")?.nextServiceOdo ?? "";

    lifeRearBreakPadController.text =
        getRemainingData(key: "Rear break pad")?.componentLife ?? "";
    remainingRearBreakPadController.text =
        getRemainingData(key: "Rear break pad")?.remainingKm ?? "";
    nextRearBreakPadChangeODOlController.text =
        getRemainingData(key: "Rear break pad")?.nextServiceOdo ?? "";

    lifeRearBreakShoeController.text =
        getRemainingData(key: "Rear break shoe")?.componentLife ?? "";
    remainingRearBreakShoeController.text =
        getRemainingData(key: "Rear break shoe")?.remainingKm ?? "";
    nextRearBreakShoeChangeODOlController.text =
        getRemainingData(key: "Rear break shoe")?.nextServiceOdo ?? "";

    lifeBreakFluidController.text =
        getRemainingData(key: "Break fluid")?.componentLife ?? "";
    remainingBreakFluidController.text =
        getRemainingData(key: "Break fluid")?.remainingKm ?? "";
    nextBreakFluidChangeODOlController.text =
        getRemainingData(key: "Break fluid")?.nextServiceOdo ?? "";

    // Suspension system components
    lifeFrontLeftLowerArmController.text =
        getRemainingData(key: "Front left lower arm")?.componentLife ?? "";
    remainingFrontLeftLowerArmController.text =
        getRemainingData(key: "Front left lower arm")?.remainingKm ?? "";
    nextFrontLeftLowerArmChangeODOlController.text =
        getRemainingData(key: "Front left lower arm")?.nextServiceOdo ?? "";

    lifeFrontRightLowerArmController.text =
        getRemainingData(key: "Front right lower arm")?.componentLife ?? "";
    remainingFrontRightLowerArmController.text =
        getRemainingData(key: "Front right lower arm")?.remainingKm ?? "";
    nextFrontRightLowerArmChangeODOlController.text =
        getRemainingData(key: "Front right lower arm")?.nextServiceOdo ?? "";

    lifeRearLeftLowerArmController.text =
        getRemainingData(key: "Rear left lower arm")?.componentLife ?? "";
    remainingRearLeftLowerArmController.text =
        getRemainingData(key: "Rear left lower arm")?.remainingKm ?? "";
    nextRearLeftLowerArmChangeODOlController.text =
        getRemainingData(key: "Rear left lower arm")?.nextServiceOdo ?? "";

    lifeRearRightLowerArmController.text =
        getRemainingData(key: "Rear right lower arm")?.componentLife ?? "";
    remainingRearRightLowerArmController.text =
        getRemainingData(key: "Rear right lower arm")?.remainingKm ?? "";
    nextRearRightLowerArmChangeODOlController.text =
        getRemainingData(key: "Rear right lower arm")?.nextServiceOdo ?? "";

    lifeUpperArmFrontLeftController.text =
        getRemainingData(key: "Upper arm front left")?.componentLife ?? "";
    remainingUpperArmFrontLeftController.text =
        getRemainingData(key: "Upper arm front left")?.remainingKm ?? "";
    nextUpperArmFrontLeftChangeODOlController.text =
        getRemainingData(key: "Upper arm front left")?.nextServiceOdo ?? "";

    lifeUpperArmFrontRightController.text =
        getRemainingData(key: "Upper arm front right")?.componentLife ?? "";
    remainingUpperArmFrontRightController.text =
        getRemainingData(key: "Upper arm front right")?.remainingKm ?? "";
    nextUpperArmFrontRightChangeODOlController.text =
        getRemainingData(key: "Upper arm front right")?.nextServiceOdo ?? "";

    lifeTrailorArmRearController.text =
        getRemainingData(key: "Trailor arm rear")?.componentLife ?? "";
    remainingTrailorArmRearController.text =
        getRemainingData(key: "Trailor arm rear")?.remainingKm ?? "";
    nextTrailorArmRearChangeODOlController.text =
        getRemainingData(key: "Trailor arm rear")?.nextServiceOdo ?? "";

    lifeAxleBootLeftInnerController.text =
        getRemainingData(key: "Axle boot front left inner")?.componentLife ??
            "";
    remainingAxleBootLeftInnerController.text =
        getRemainingData(key: "Axle boot front left inner")?.remainingKm ?? "";
    nextAxleBootLeftInnerChangeODOlController.text =
        getRemainingData(key: "Axle boot front left inner")?.nextServiceOdo ??
            "";

    lifeAxleBootRightInnerController.text =
        getRemainingData(key: "Axle boot front right inner")?.componentLife ??
            "";
    remainingAxleBootRightInnerController.text =
        getRemainingData(key: "Axle boot front right inner")?.remainingKm ?? "";
    nextAxleBootRightInnerChangeODOlController.text =
        getRemainingData(key: "Axle boot front right inner")?.nextServiceOdo ??
            "";

    lifeAxleBootRightOuterController.text =
        getRemainingData(key: "Axle boot front right outer")?.componentLife ??
            "";
    remainingAxleBootRightOuterController.text =
        getRemainingData(key: "Axle boot front right outer")?.remainingKm ?? "";
    nextAxleBootRightOuterChangeODOlController.text =
        getRemainingData(key: "Axle boot front right outer")?.nextServiceOdo ??
            "";

    lifeAxleBootLeftOuterController.text =
        getRemainingData(key: "Axle boot front left outer")?.componentLife ??
            "";
    remainingAxleBootLeftOuterController.text =
        getRemainingData(key: "Axle boot front left outer")?.remainingKm ?? "";
    nextAxleBootLeftOuterChangeODOlController.text =
        getRemainingData(key: "Axle boot front left outer")?.nextServiceOdo ??
            "";

    lifeAbriRearController.text =
        getRemainingData(key: "Axle boot rear left inner")?.componentLife ?? "";
    remainingAbriRearController.text =
        getRemainingData(key: "Axle boot rear left inner")?.remainingKm ?? "";
    nextAbriRearChangeODOController.text =
        getRemainingData(key: "Axle boot rear left inner")?.nextServiceOdo ??
            "";

    lifeAbrrRearController.text =
        getRemainingData(key: "Axle boot rear right inner")?.componentLife ??
            "";
    remainingAbrrRearController.text =
        getRemainingData(key: "Axle boot rear right inner")?.remainingKm ?? "";
    nextAbrrRearChangeODOController.text =
        getRemainingData(key: "Axle boot rear right inner")?.nextServiceOdo ??
            "";

    lifeAbroRearController.text =
        getRemainingData(key: "Axle boot rear right outer")?.componentLife ??
            "";
    remainingAbroRearController.text =
        getRemainingData(key: "Axle boot rear right outer")?.remainingKm ?? "";
    nextAbroRearChangeODOController.text =
        getRemainingData(key: "Axle boot rear right outer")?.nextServiceOdo ??
            "";

    lifeAbloRearController.text =
        getRemainingData(key: "Axle boot rear left outer")?.componentLife ?? "";
    remainingAbloRearController.text =
        getRemainingData(key: "Axle boot rear left outer")?.remainingKm ?? "";
    nextAbloRearChangeODOController.text =
        getRemainingData(key: "Axle boot rear left outer")?.nextServiceOdo ??
            "";

    lifeLinkRodFrontLeftController.text =
        getRemainingData(key: "Link rod front left")?.componentLife ?? "";
    remainingLinkRodFrontLeftController.text =
        getRemainingData(key: "Link rod front left")?.remainingKm ?? "";
    nextLinkRodFrontLeftChangeODOlController.text =
        getRemainingData(key: "Link rod front left")?.nextServiceOdo ?? "";

    lifeLinkRodFrontRightController.text =
        getRemainingData(key: "Link rod front right")?.componentLife ?? "";
    remainingLinkRodFrontRightController.text =
        getRemainingData(key: "Link rod front right")?.remainingKm ?? "";
    nextLinkRodFrontRightChangeODOlController.text =
        getRemainingData(key: "Link rod front right")?.nextServiceOdo ?? "";

    lifeLinkRodRearLeftController.text =
        getRemainingData(key: "Link rod rear left")?.componentLife ?? "";
    remainingLinkRodRearLeftController.text =
        getRemainingData(key: "Link rod rear left")?.remainingKm ?? "";
    nextLinkRodRearLeftChangeODOlController.text =
        getRemainingData(key: "Link rod rear left")?.nextServiceOdo ?? "";

    lifeLinkRodRearRightController.text =
        getRemainingData(key: "Link rod rear right")?.componentLife ?? "";
    remainingLinkRodRearRightController.text =
        getRemainingData(key: "Link rod rear right")?.remainingKm ?? "";
    nextLinkRodRearRightChangeODOlController.text =
        getRemainingData(key: "Link rod rear right")?.nextServiceOdo ?? "";

    lifeBalanceRodBushFrontController.text =
        getRemainingData(key: "Balance rod bush front")?.componentLife ?? "";
    remainingBalanceRodBushFrontController.text =
        getRemainingData(key: "Balance rod bush front")?.remainingKm ?? "";
    nextBalanceRodBushFrontChangeODOlController.text =
        getRemainingData(key: "Balance rod bush front")?.nextServiceOdo ?? "";

    lifeBalanceRodBushRearController.text =
        getRemainingData(key: "Balance rod bush rear")?.componentLife ?? "";
    remainingBalanceRodBushRearController.text =
        getRemainingData(key: "Balance rod bush rear")?.remainingKm ?? "";
    nextBalanceRodBushRearChangeODOlController.text =
        getRemainingData(key: "Balance rod bush rear")?.nextServiceOdo ?? "";

    lifeFshocklController.text =
        getRemainingData(key: "Front left shock absorber")?.componentLife ?? "";
    remainingFshocklController.text =
        getRemainingData(key: "Front left shock absorber")?.remainingKm ?? "";
    nextFshocklChangeODOController.text =
        getRemainingData(key: "Front left shock absorber")?.nextServiceOdo ??
            "";

    lifeFshockrController.text =
        getRemainingData(key: "Front right shock absorber")?.componentLife ??
            "";
    remainingFshockrController.text =
        getRemainingData(key: "Front right shock absorber")?.remainingKm ?? "";
    nextFshockrChangeODOController.text =
        getRemainingData(key: "Front right shock absorber")?.nextServiceOdo ??
            "";

    lifeRshocklController.text =
        getRemainingData(key: "Rear left shock absorber")?.componentLife ?? "";
    remainingRshocklController.text =
        getRemainingData(key: "Rear left shock absorber")?.remainingKm ?? "";
    nextRshocklChangeODOController.text =
        getRemainingData(key: "Rear left shock absorber")?.nextServiceOdo ?? "";

    lifeRshockrController.text =
        getRemainingData(key: "Rear right shock absorber")?.componentLife ?? "";
    remainingRshockrController.text =
        getRemainingData(key: "Rear right shock absorber")?.remainingKm ?? "";
    nextRshockrChangeODOController.text =
        getRemainingData(key: "Rear right shock absorber")?.nextServiceOdo ??
            "";

    lifeWlbearflController.text =
        getRemainingData(key: "Front left wheel bearing")?.componentLife ?? "";
    remainingWlbearflController.text =
        getRemainingData(key: "Front left wheel bearing")?.remainingKm ?? "";
    nextWlbearflChangeODOController.text =
        getRemainingData(key: "Front left wheel bearing")?.nextServiceOdo ?? "";

    lifeWlbearfrController.text =
        getRemainingData(key: "Front right wheel bearing")?.componentLife ?? "";
    remainingWlbearfrController.text =
        getRemainingData(key: "Front right wheel bearing")?.remainingKm ?? "";
    nextWlbearfrChangeODOController.text =
        getRemainingData(key: "Front right wheel bearing")?.nextServiceOdo ??
            "";

    lifeWlbearrlController.text =
        getRemainingData(key: "Rear left wheel bearing")?.componentLife ?? "";
    remainingWlbearrlController.text =
        getRemainingData(key: "Rear left wheel bearing")?.remainingKm ?? "";
    nextWlbearrlChangeODOController.text =
        getRemainingData(key: "Rear left wheel bearing")?.nextServiceOdo ?? "";

    lifeWlbearrrController.text =
        getRemainingData(key: "Rear right wheel bearing")?.componentLife ?? "";
    remainingWlbearrrController.text =
        getRemainingData(key: "Rear right wheel bearing")?.remainingKm ?? "";
    nextWlbearrrChangeODOController.text =
        getRemainingData(key: "Rear right wheel bearing")?.nextServiceOdo ?? "";

    // Steering components
    lifeSteeringBootLeftController.text =
        getRemainingData(key: "Steering boot left")?.componentLife ?? "";
    remainingSteeringBootLeftController.text =
        getRemainingData(key: "Steering boot left")?.remainingKm ?? "";
    nextSteeringBootLeftChangeODOlController.text =
        getRemainingData(key: "Steering boot left")?.nextServiceOdo ?? "";

    lifeSteeringBootRightController.text =
        getRemainingData(key: "Steering boot right")?.componentLife ?? "";
    remainingSteeringBootRightController.text =
        getRemainingData(key: "Steering boot right")?.remainingKm ?? "";
    nextSteeringBootRightChangeODOlController.text =
        getRemainingData(key: "Steering boot right")?.nextServiceOdo ?? "";

    lifeSteeringEndLeftController.text =
        getRemainingData(key: "Steering end left")?.componentLife ?? "";
    remainingSteeringEndLeftController.text =
        getRemainingData(key: "Steering end left")?.remainingKm ?? "";
    nextSteeringEndLeftChangeODOlController.text =
        getRemainingData(key: "Steering end left")?.nextServiceOdo ?? "";

    lifeSteeringEndRightController.text =
        getRemainingData(key: "Steering end right")?.componentLife ?? "";
    remainingSteeringEndRightController.text =
        getRemainingData(key: "Steering end right")?.remainingKm ?? "";
    nextSteeringEndRightChangeODOlController.text =
        getRemainingData(key: "Steering end right")?.nextServiceOdo ?? "";

    lifeBallJointLeftController.text =
        getRemainingData(key: "Ball joint left")?.componentLife ?? "";
    remainingBallJointLeftController.text =
        getRemainingData(key: "Ball joint left")?.remainingKm ?? "";
    nextBallJointLeftChangeODOlController.text =
        getRemainingData(key: "Ball joint left")?.nextServiceOdo ?? "";

    lifeBallJointRightController.text =
        getRemainingData(key: "Ball joint right")?.componentLife ?? "";
    remainingBallJointRightController.text =
        getRemainingData(key: "Ball joint right")?.remainingKm ?? "";
    nextBallJointRightChangeODOlController.text =
        getRemainingData(key: "Ball joint right")?.nextServiceOdo ?? "";

    // AC components
    lifeAcGasController.text =
        getRemainingData(key: "Ac gas")?.componentLife ?? "";
    remainingAcGasController.text =
        getRemainingData(key: "Ac gas")?.remainingKm ?? "";
    nextAcGasChangeODOlController.text =
        getRemainingData(key: "Ac gas")?.nextServiceOdo ?? "";

    lifeCompressorController.text =
        getRemainingData(key: "Compressor")?.componentLife ?? "";
    remainingCompressorController.text =
        getRemainingData(key: "Compressor")?.remainingKm ?? "";
    nextCompressorChangeODOlController.text =
        getRemainingData(key: "Compressor")?.nextServiceOdo ?? "";

    lifeCondenserController.text =
        getRemainingData(key: "Condenser")?.componentLife ?? "";
    remainingCondenserController.text =
        getRemainingData(key: "Condenser")?.remainingKm ?? "";
    nextCondenserChangeODOlController.text =
        getRemainingData(key: "Condenser")?.nextServiceOdo ?? "";

    lifeEvaporatorController.text =
        getRemainingData(key: "Evaporator")?.componentLife ?? "";
    remainingEvaporatorController.text =
        getRemainingData(key: "Evaporator")?.remainingKm ?? "";
    nextEvaporatorChangeODOlController.text =
        getRemainingData(key: "Evaporator")?.nextServiceOdo ?? "";

    lifeExValveController.text =
        getRemainingData(key: "Ex valve")?.componentLife ?? "";
    remainingExValveController.text =
        getRemainingData(key: "Ex valve")?.remainingKm ?? "";
    nextExValveChangeODOlController.text =
        getRemainingData(key: "Ex valve")?.nextServiceOdo ?? "";

    // Light system components
    lifeHeadLightController.text =
        getRemainingData(key: "Head light")?.componentLife ?? "";
    remainingHeadLightController.text =
        getRemainingData(key: "Head light")?.remainingKm ?? "";
    nextHeadLightChangeODOlController.text =
        getRemainingData(key: "Head light")?.nextServiceOdo ?? "";

    lifeParkLightController.text =
        getRemainingData(key: "Park light")?.componentLife ?? "";
    remainingParkLightController.text =
        getRemainingData(key: "Park light")?.remainingKm ?? "";
    nextParkLightChangeODOlController.text =
        getRemainingData(key: "Park light")?.nextServiceOdo ?? "";

    lifeIndicatorsController.text =
        getRemainingData(key: "Indicators")?.componentLife ?? "";
    remainingIndicatorsController.text =
        getRemainingData(key: "Indicators")?.remainingKm ?? "";
    nextIndicatorsChangeODOlController.text =
        getRemainingData(key: "Indicators")?.nextServiceOdo ?? "";

    lifeReverseGearController.text =
        getRemainingData(key: "Reverse gear")?.componentLife ?? "";
    remainingReverseGearController.text =
        getRemainingData(key: "Reverse gear")?.remainingKm ?? "";
    nextReverseGearChangeODOlController.text =
        getRemainingData(key: "Reverse gear")?.nextServiceOdo ?? "";

    lifeDimBrightController.text =
        getRemainingData(key: "Dim , bright")?.componentLife ?? "";
    remainingDimBrightController.text =
        getRemainingData(key: "Dim , bright")?.remainingKm ?? "";
    nextDimBrightChangeODOlController.text =
        getRemainingData(key: "Dim , bright")?.nextServiceOdo ?? "";

    lifeFogLampsController.text =
        getRemainingData(key: "Fog lamps")?.componentLife ?? "";
    remainingFogLampsController.text =
        getRemainingData(key: "Fog lamps")?.remainingKm ?? "";
    nextFogLampsChangeODOlController.text =
        getRemainingData(key: "Fog lamps")?.nextServiceOdo ?? "";

    // Fuel system components
    lifeFuelPumpController.text =
        getRemainingData(key: "Fuel pump")?.componentLife ?? "";
    remainingFuelPumpController.text =
        getRemainingData(key: "Fuel pump")?.remainingKm ?? "";
    nextFuelPumpChangeODOlController.text =
        getRemainingData(key: "Fuel pump")?.nextServiceOdo ?? "";

    lifeFuelFilterController.text =
        getRemainingData(key: "Fuel filter")?.componentLife ?? "";
    remainingFuelFilterController.text =
        getRemainingData(key: "Fuel filter")?.remainingKm ?? "";
    nextFuelFilterChangeODOlController.text =
        getRemainingData(key: "Fuel filter")?.nextServiceOdo ?? "";

    lifeCanisterController.text =
        getRemainingData(key: "Canister")?.componentLife ?? "";
    remainingCanisterController.text =
        getRemainingData(key: "Canister")?.remainingKm ?? "";
    nextCanisterChangeODOlController.text =
        getRemainingData(key: "Canister")?.nextServiceOdo ?? "";

    lifeFuelTankController.text =
        getRemainingData(key: "Fuel tank")?.componentLife ?? "";
    remainingFuelTankController.text =
        getRemainingData(key: "Fuel tank")?.remainingKm ?? "";
    nextFuelTankChangeODOlController.text =
        getRemainingData(key: "Fuel tank")?.nextServiceOdo ?? "";

    // Other accessories
    lifeCenterLockController.text =
        getRemainingData(key: "Center lock")?.componentLife ?? "";
    remainingCenterLockController.text =
        getRemainingData(key: "Center lock")?.remainingKm ?? "";
    nextCenterLockChangeODOlController.text =
        getRemainingData(key: "Center lock")?.nextServiceOdo ?? "";

    lifeWindowLifterController.text =
        getRemainingData(key: "Window lifter")?.componentLife ?? "";
    remainingWindowLifterController.text =
        getRemainingData(key: "Window lifter")?.remainingKm ?? "";
    nextWindowLifterChangeODOlController.text =
        getRemainingData(key: "Window lifter")?.nextServiceOdo ?? "";

    lifeAlignmentController.text =
        getRemainingData(key: "Alignment")?.componentLife ?? "";
    remainingAlignmentController.text =
        getRemainingData(key: "Alignment")?.remainingKm ?? "";
    nextAlignmentChangeODOlController.text =
        getRemainingData(key: "Alignment")?.nextServiceOdo ?? "";

    lifeWheelBalanceController.text =
        getRemainingData(key: "Wheel balance")?.componentLife ?? "";
    remainingWheelBalanceController.text =
        getRemainingData(key: "Wheel balance")?.remainingKm ?? "";
    nextWheelBalanceChangeODOlController.text =
        getRemainingData(key: "Wheel balance")?.nextServiceOdo ?? "";
  }

  Component? getRemainingData({required String key}) {
    final index =
        componentList.indexWhere((element) => (element.component == key));
    return index != -1 ? componentList[index] : null;
  }

  clearAllControllers() {
    //engine
    lifeOilController.clear();
    lifeOilFilterController.clear();
    lifeAirFilterController.clear();
    lifeAcFilterController.clear();
    lifeSparkPlugController.clear();
    lifeIgnitionCoilController.clear();
    lifeValveCowerGasketController.clear();
    lifePlugSealController.clear();
    lifeEngineBeltController.clear();
    lifeEngineBeltTentionerController.clear();
    lifeIDLPulleyController.clear();
    lifeInjectorsController.clear();
    lifeSelfMotorController.clear();
    lifeRadiatorController.clear();
    lifeRadiatorHoseController.clear();
    lifeThermostatController.clear();
    lifeCoolantController.clear();
    lifeEngineCoolarController.clear();
    lifeRadiatorCapController.clear();
    lifeCoolantSpareTankController.clear();
    lifeRadiatorFanMotorController.clear();
    lifeEngineCoolantLevelController.clear();
    lifeEngineMountController.clear();
    // gear
    lifeGearOilController.clear();
    lifeGearFilterController.clear();
    lifeFourWheelOilController.clear();
    lifeTransmissionControlModuleController.clear();
    lifeGearGasketController.clear();
    lifeGearMountController.clear();
    lifeGearCoolarController.clear();
    // differential
    lifeFrontDifferentialOilController.clear();
    lifeShaftStatusController.clear();
    lifeShaftSealsController.clear();
    lifeRearDifferentialOilController.clear();
    lifeDifferentialBushesController.clear();
    // break system
    lifeFrontLeftBreakDiscController.clear();
    lifeFrontRightBreakDiscController.clear();
    lifeRearLeftBreakDiscController.clear();
    lifeRearRightBreakDiscController.clear();
    lifeFrontBreakPadController.clear();
    lifeRearBreakPadController.clear();
    lifeRearBreakShoeController.clear();
    lifeBreakFluidController.clear();
    // suspension system
    lifeFrontLeftLowerArmController.clear();
    lifeFrontRightLowerArmController.clear();
    lifeRearLeftLowerArmController.clear();
    lifeRearRightLowerArmController.clear();
    lifeUpperArmFrontLeftController.clear();
    lifeUpperArmFrontRightController.clear();
    lifeTrailorArmRearController.clear();
    lifeAxleBootLeftInnerController.clear();
    lifeAxleBootRightInnerController.clear();
    lifeAxleBootRightOuterController.clear();
    lifeAxleBootLeftOuterController.clear();
    lifeAbriRearController.clear();
    lifeAbrrRearController.clear();
    lifeAbroRearController.clear();
    lifeAbloRearController.clear();
    lifeLinkRodFrontLeftController.clear();
    lifeLinkRodFrontRightController.clear();
    lifeLinkRodRearLeftController.clear();
    lifeLinkRodRearRightController.clear();
    lifeBalanceRodBushFrontController.clear();
    lifeBalanceRodBushRearController.clear();
    lifeFshocklController.clear();
    lifeFshockrController.clear();
    lifeRshocklController.clear();
    lifeRshockrController.clear();
    lifeWlbearflController.clear();
    lifeWlbearfrController.clear();
    lifeWlbearrlController.clear();
    lifeWlbearrrController.clear();
    // ac compartments
    lifeAcGasController.clear();
    lifeCompressorController.clear();
    lifeCondenserController.clear();
    lifeEvaporatorController.clear();
    lifeExValveController.clear();
    // steering
    lifeSteeringBootLeftController.clear();
    lifeSteeringBootRightController.clear();
    lifeSteeringEndLeftController.clear();
    lifeSteeringEndRightController.clear();
    lifeBallJointLeftController.clear();
    lifeBallJointRightController.clear();
    // light system
    lifeHeadLightController.clear();
    lifeParkLightController.clear();
    lifeIndicatorsController.clear();
    lifeReverseGearController.clear();
    lifeDimBrightController.clear();
    lifeFogLampsController.clear();
    // fuel system
    lifeFuelPumpController.clear();
    lifeFuelFilterController.clear();
    lifeCanisterController.clear();
    lifeFuelTankController.clear();
    // other accessories
    lifeCenterLockController.clear();
    lifeWindowLifterController.clear();
    lifeAlignmentController.clear();
    lifeWheelBalanceController.clear();
// engine
    remainingOilController.clear();
    remainingOilFilterController.clear();
    remainingAirFilterController.clear();
    remainingAcFilterController.clear();
    remainingSparkPlugController.clear();
    remainingIgnitionCoilController.clear();
    remainingValveCowerGasketController.clear();
    remainingPlugSealController.clear();
    remainingEngineBeltController.clear();
    remainingEngineBeltTentionerController.clear();
    remainingIDLPulleyController.clear();
    remainingInjectorsController.clear();
    remainingSelfMotorController.clear();
    remainingRadiatorController.clear();
    remainingRadiatorHoseController.clear();
    remainingThermostatController.clear();
    remainingCoolantController.clear();
    remainingEngineCoolarController.clear();
    remainingRadiatorCapController.clear();
    remainingCoolantSpareTankController.clear();
    remainingRadiatorFanMotorController.clear();
    remainingEngineCoolantLevelController.clear();
    remainingEngineMountController.clear();
    // gear
    remainingGearOilController.clear();
    remainingGearFilterController.clear();
    remainingFourWheelOilController.clear();
    remainingTransmissionControlOilController.clear();
    remainingGearGasketController.clear();
    remainingGearMountController.clear();
    remainingGearCoolarController.clear();
    // differential
    frontDifferentialOilLifeController.clear();
    remainingShaftStatusController.clear();
    remainingShaftSealsController.clear();
    rearDifferentialOilLifeController.clear();
    remainingDifferentialBushesController.clear();
    // break system
    remainingFrontLeftBreakDiscController.clear();
    remainingFrontRightBreakDiscController.clear();
    remainingRearLeftBreakDiscController.clear();
    remainingRearRightBreakDiscController.clear();
    remainingFrontBreakPadController.clear();
    remainingRearBreakPadController.clear();
    remainingRearBreakShoeController.clear();
    remainingBreakFluidController.clear();
    // suspension system
    remainingFrontLeftLowerArmController.clear();
    remainingFrontRightLowerArmController.clear();
    remainingRearLeftLowerArmController.clear();
    remainingRearRightLowerArmController.clear();
    remainingUpperArmFrontLeftController.clear();
    remainingUpperArmFrontRightController.clear();
    remainingTrailorArmRearController.clear();
    remainingAxleBootLeftInnerController.clear();
    remainingAxleBootRightInnerController.clear();
    remainingAxleBootRightOuterController.clear();
    remainingAxleBootLeftOuterController.clear();
    remainingAbriRearController.clear();
    remainingAbrrRearController.clear();
    remainingAbroRearController.clear();
    remainingAbloRearController.clear();
    remainingLinkRodFrontLeftController.clear();
    remainingLinkRodFrontRightController.clear();
    remainingLinkRodRearLeftController.clear();
    remainingLinkRodRearRightController.clear();
    remainingBalanceRodBushFrontController.clear();
    remainingBalanceRodBushRearController.clear();
    remainingFshocklController.clear();
    remainingFshockrController.clear();
    remainingRshocklController.clear();
    remainingRshockrController.clear();
    remainingWlbearflController.clear();
    remainingWlbearfrController.clear();
    remainingWlbearrlController.clear();
    remainingWlbearrrController.clear();
    // ac compartments
    remainingAcGasController.clear();
    remainingCompressorController.clear();
    remainingCondenserController.clear();
    remainingEvaporatorController.clear();
    remainingExValveController.clear();
    // steering
    remainingSteeringBootLeftController.clear();
    remainingSteeringBootRightController.clear();
    remainingSteeringEndLeftController.clear();
    remainingSteeringEndRightController.clear();
    remainingBallJointLeftController.clear();
    remainingBallJointRightController.clear();
    // light system
    remainingHeadLightController.clear();
    remainingParkLightController.clear();
    remainingIndicatorsController.clear();
    remainingReverseGearController.clear();
    remainingDimBrightController.clear();
    remainingFogLampsController.clear();
    // fuel system
    remainingFuelPumpController.clear();
    remainingFuelFilterController.clear();
    remainingCanisterController.clear();
    remainingFuelTankController.clear();
    // other accessories
    remainingCenterLockController.clear();
    remainingWindowLifterController.clear();
    remainingAlignmentController.clear();
    remainingWheelBalanceController.clear();
    // engine
    nextOilChangeODOlController.clear();
    oilFilterOdoController.clear();
    nextAirFilterChangeODOlController.clear();
    nextAcFilterChangeODOlController.clear();
    nextSparkPlugChangeODOlController.clear();
    nextIgnitionCoilChangeODOlController.clear();
    nextValveCowerGasketChangeODOlController.clear();
    nextPlugSealChangeODOlController.clear();
    nextEngineBeltChangeODOlController.clear();
    nextEngineBeltTentionerChangeODOlController.clear();
    nextIDLPulleyChangeODOlController.clear();
    nextInjectorsChangeODOlController.clear();
    nextSelfMotorChangeODOlController.clear();
    nextRadiatorController.clear();
    nextRadiatorHoseController.clear();
    nextThermostatController.clear();
    nextCoolantController.clear();
    nextEngineCoolarController.clear();
    nextRadiatorCapController.clear();
    nextCoolantSpareTankController.clear();
    nextRadiatorFanMotorController.clear();
    nextEngineCoolantLevelController.clear();
    nextEngineMountChangeODOlController.clear();
    // gear
    nextGearOilChangeODOlController.clear();
    nextGearFilterChangeODOlController.clear();
    nextFourWheelOilChangeODOlController.clear();
    nextTransmissionControlOilChangeODOlController.clear();
    nextGearGasketChangeODOlController.clear();
    nextGearMountChangeODOlController.clear();
    nextGearCoolarODOController.clear();
    // differential
    nextFrontDifferentialOilChangeODOlController.clear();
    nextShaftStatusChangeODOlController.clear();
    nextShaftSealsChangeODOlController.clear();
    nextRearDifferentialOilChangeODOlController.clear();
    nextDifferentialBushesChangeODOlController.clear();
    // break system
    nextFrontLeftBreakDiscChangeODOlController.clear();
    nextFrontRightBreakDiscChangeODOlController.clear();
    nextRearLeftBreakDiscChangeODOlController.clear();
    nextRearRightBreakDiscChangeODOlController.clear();
    nextFrontBreakPadChangeODOlController.clear();
    nextRearBreakPadChangeODOlController.clear();
    nextRearBreakShoeChangeODOlController.clear();
    nextBreakFluidChangeODOlController.clear();
    // suspension system
    nextFrontLeftLowerArmChangeODOlController.clear();
    nextFrontRightLowerArmChangeODOlController.clear();
    nextRearLeftLowerArmChangeODOlController.clear();
    nextRearRightLowerArmChangeODOlController.clear();
    nextUpperArmFrontLeftChangeODOlController.clear();
    nextUpperArmFrontRightChangeODOlController.clear();
    nextTrailorArmRearChangeODOlController.clear();
    nextAxleBootLeftInnerChangeODOlController.clear();
    nextAxleBootRightInnerChangeODOlController.clear();
    nextAxleBootRightOuterChangeODOlController.clear();
    nextAxleBootLeftOuterChangeODOlController.clear();
    nextAbriRearChangeODOController.clear();
    nextAbrrRearChangeODOController.clear();
    nextAbroRearChangeODOController.clear();
    nextAbloRearChangeODOController.clear();
    nextLinkRodFrontLeftChangeODOlController.clear();
    nextLinkRodFrontRightChangeODOlController.clear();
    nextLinkRodRearLeftChangeODOlController.clear();
    nextLinkRodRearRightChangeODOlController.clear();
    nextBalanceRodBushFrontChangeODOlController.clear();
    nextBalanceRodBushRearChangeODOlController.clear();
    nextFshocklChangeODOController.clear();
    nextFshockrChangeODOController.clear();
    nextRshocklChangeODOController.clear();
    nextRshockrChangeODOController.clear();
    nextWlbearflChangeODOController.clear();
    nextWlbearfrChangeODOController.clear();
    nextWlbearrlChangeODOController.clear();
    nextWlbearrrChangeODOController.clear();
    // ac compartment
    nextAcGasChangeODOlController.clear();
    nextCompressorChangeODOlController.clear();
    nextCondenserChangeODOlController.clear();
    nextEvaporatorChangeODOlController.clear();
    nextExValveChangeODOlController.clear();
    // steering system
    nextSteeringBootLeftChangeODOlController.clear();
    nextSteeringBootRightChangeODOlController.clear();
    nextSteeringEndLeftChangeODOlController.clear();
    nextSteeringEndRightChangeODOlController.clear();
    nextBallJointLeftChangeODOlController.clear();
    nextBallJointRightChangeODOlController.clear();
    // light system
    nextHeadLightChangeODOlController.clear();
    nextParkLightChangeODOlController.clear();
    nextIndicatorsChangeODOlController.clear();
    nextReverseGearChangeODOlController.clear();
    nextDimBrightChangeODOlController.clear();
    nextFogLampsChangeODOlController.clear();
    // fuel system
    nextFuelPumpChangeODOlController.clear();
    nextFuelFilterChangeODOlController.clear();
    nextCanisterChangeODOlController.clear();
    nextFuelTankChangeODOlController.clear();
    // other accessories
    nextCenterLockChangeODOlController.clear();
    nextWindowLifterChangeODOlController.clear();
    nextAlignmentChangeODOlController.clear();
    nextWheelBalanceChangeODOlController.clear();
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
