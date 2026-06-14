import 'package:json_annotation/json_annotation.dart';

part 'cheque_models.g.dart';

@JsonSerializable(createToJson: false)
class ChequeResponseDto {
  final ChequeHeaderDto chequeHeader;
  final double sumDiscount;
  final List<ChequeLineDto> chequeLines;
  final List<ChequeActionDto> chequeActions;
  final String chPrediction;
  final double sumCashback;
  final String chequeMagicName;
  final List<dynamic> feedbackRates;

  ChequeResponseDto({
    required this.chequeHeader,
    required this.sumDiscount,
    required this.chequeLines,
    required this.chequeActions,
    required this.chPrediction,
    required this.sumCashback,
    required this.chequeMagicName,
    required this.feedbackRates,
  });

  factory ChequeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeResponseDtoFromJson(json);  
}

@JsonSerializable(createToJson: false)
class ChequeHeaderDto {
  final int filId;
  final int chequeId;
  final DateTime created;
  final int loyaltyFactId;
  final int businessCardId;
  final double sumReg;
  final double sumBalance;
  final String filialName;
  final String cityName;
  final int frId;
  final int zId;
  final int frChequeId;
  final int payType;
  final List<dynamic> payTypeArray;
  final String fiscalNumber;
  final String? externalOperationId;

  ChequeHeaderDto({
    required this.filId,
    required this.chequeId,
    required this.created,
    required this.loyaltyFactId,
    required this.businessCardId,
    required this.sumReg,
    required this.sumBalance,
    required this.filialName,
    required this.cityName,
    required this.frId,
    required this.zId,
    required this.frChequeId,
    required this.payType,
    required this.payTypeArray,
    required this.fiscalNumber,
    this.externalOperationId,
  });

  factory ChequeHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeHeaderDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChequeLineDto {
  final int chequeLineId;
  final int lagerId;
  final String lagerNameUA;
  final String lagerUnit;
  final double kolvo;
  final double priceOut;
  final String unitText;
  final String fileName;
  final double sumCashbackLine;
  final AdditionalDataDto additionalData;
  final LikeDto like;

  ChequeLineDto({
    required this.chequeLineId,
    required this.lagerId,
    required this.lagerNameUA,
    required this.lagerUnit,
    required this.kolvo,
    required this.priceOut,
    required this.unitText,
    required this.fileName,
    required this.sumCashbackLine,
    required this.additionalData,
    required this.like,
  });

  factory ChequeLineDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeLineDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AdditionalDataDto {
  final String id;
  final String title;
  final String icon;
  final String ratio;
  final String sectionSlug;
  final String companyId;
  final String externalProductId;
  final String slug;
  final String classifierSapId;
  final String? brandId;
  final String? brandTitle;
  final bool weighted;
  final String departmentName;
  final List<String> barcodes;
  final double weight;
  final bool scanExcise;

  AdditionalDataDto({
    required this.id,
    required this.title,
    required this.icon,
    required this.ratio,
    required this.sectionSlug,
    required this.companyId,
    required this.externalProductId,
    required this.slug,
    required this.classifierSapId,
    this.brandId,
    this.brandTitle,
    required this.weighted,
    required this.departmentName,
    required this.barcodes,
    required this.weight,
    required this.scanExcise,
  });

  factory AdditionalDataDto.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class LikeDto {
  final bool contains;

  LikeDto({required this.contains});

  factory LikeDto.fromJson(Map<String, dynamic> json) =>
      _$LikeDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class ChequeActionDto {
  final int actionType;
  final String? actionTypeCodeName;
  final int actionId;
  final double discpercent;
  final double discount;
  final String? varcharData;

  ChequeActionDto({
    required this.actionType,
    this.actionTypeCodeName,
    required this.actionId,
    required this.discpercent,
    required this.discount,
    this.varcharData,
  });

  factory ChequeActionDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeActionDtoFromJson(json);
}
