class Transaction {
  final String id;
  final String userId;
  final String ts;
  final double amount;
  final String currency;
  final String? accountRef;
  final String channel;
  final String rawMsgId;
  final String hash;
  final String type;
  final String category;
  final double confidence;
  final String meta;

  Transaction({
    required this.id,
    required this.userId,
    required this.ts,
    required this.amount,
    required this.currency,
    this.accountRef,
    required this.channel,
    required this.rawMsgId,
    required this.hash,
    required this.type,
    required this.category,
    required this.confidence,
    required this.meta,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      ts: json['ts'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      accountRef: json['account_ref'],
      channel: json['channel'],
      rawMsgId: json['raw_msg_id'],
      hash: json['hash'],
      type: json['type'],
      category: json['category'],
      confidence: (json['confidence'] as num).toDouble(),
      meta: json['meta'],
    );
  }
}
