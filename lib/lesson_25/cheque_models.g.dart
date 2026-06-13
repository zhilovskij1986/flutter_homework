// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeResponseDto _$ChequeResponseDtoFromJson(Map<String, dynamic> json) =>
    ChequeResponseDto(
      chequeHeader: ChequeHeaderDto.fromJson(
        json['chequeHeader'] as Map<String, dynamic>,
      ),
      sumDiscount: (json['sumDiscount'] as num).toDouble(),
      chequeLines: (json['chequeLines'] as List<dynamic>)
          .map((e) => ChequeLineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chequeActions: (json['chequeActions'] as List<dynamic>)
          .map((e) => ChequeActionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chPrediction: json['chPrediction'] as String,
      sumCashback: (json['sumCashback'] as num).toDouble(),
      chequeMagicName: json['chequeMagicName'] as String,
      feedbackRates: json['feedbackRates'] as List<dynamic>,
    );

ChequeHeaderDto _$ChequeHeaderDtoFromJson(Map<String, dynamic> json) =>
    ChequeHeaderDto(
      filId: (json['filId'] as num).toInt(),
      chequeId: (json['chequeId'] as num).toInt(),
      created: DateTime.parse(json['created'] as String),
      loyaltyFactId: (json['loyaltyFactId'] as num).toInt(),
      businessCardId: (json['businessCardId'] as num).toInt(),
      sumReg: (json['sumReg'] as num).toDouble(),
      sumBalance: (json['sumBalance'] as num).toDouble(),
      filialName: json['filialName'] as String,
      cityName: json['cityName'] as String,
      frId: (json['frId'] as num).toInt(),
      zId: (json['zId'] as num).toInt(),
      frChequeId: (json['frChequeId'] as num).toInt(),
      payType: (json['payType'] as num).toInt(),
      payTypeArray: json['payTypeArray'] as List<dynamic>,
      fiscalNumber: json['fiscalNumber'] as String,
      externalOperationId: json['externalOperationId'] as String?,
    );

ChequeLineDto _$ChequeLineDtoFromJson(Map<String, dynamic> json) =>
    ChequeLineDto(
      chequeLineId: (json['chequeLineId'] as num).toInt(),
      lagerId: (json['lagerId'] as num).toInt(),
      lagerNameUA: json['lagerNameUA'] as String,
      lagerUnit: json['lagerUnit'] as String,
      kolvo: (json['kolvo'] as num).toDouble(),
      priceOut: (json['priceOut'] as num).toDouble(),
      unitText: json['unitText'] as String,
      fileName: json['fileName'] as String,
      sumCashbackLine: (json['sumCashbackLine'] as num).toDouble(),
      additionalData: AdditionalDataDto.fromJson(
        json['additionalData'] as Map<String, dynamic>,
      ),
      like: LikeDto.fromJson(json['like'] as Map<String, dynamic>),
    );

AdditionalDataDto _$AdditionalDataDtoFromJson(Map<String, dynamic> json) =>
    AdditionalDataDto(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      ratio: json['ratio'] as String,
      sectionSlug: json['sectionSlug'] as String,
      companyId: json['companyId'] as String,
      externalProductId: json['externalProductId'] as String,
      slug: json['slug'] as String,
      classifierSapId: json['classifierSapId'] as String,
      brandId: json['brandId'] as String?,
      brandTitle: json['brandTitle'] as String?,
      weighted: json['weighted'] as bool,
      departmentName: json['departmentName'] as String,
      barcodes: (json['barcodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      weight: (json['weight'] as num).toDouble(),
      scanExcise: json['scanExcise'] as bool,
    );

LikeDto _$LikeDtoFromJson(Map<String, dynamic> json) =>
    LikeDto(contains: json['contains'] as bool);

ChequeActionDto _$ChequeActionDtoFromJson(Map<String, dynamic> json) =>
    ChequeActionDto(
      actionType: (json['actionType'] as num).toInt(),
      actionTypeCodeName: json['actionTypeCodeName'] as String?,
      actionId: (json['actionId'] as num).toInt(),
      discpercent: (json['discpercent'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      varcharData: json['varcharData'] as String?,
    );
