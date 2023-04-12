class Plantao {
  final int id;
  final DateTime data;
  final String local;
  final String plantonista;
  final String tipoPlantonista;
  final String status;

  Plantao(
      {required this.id,
      required this.data,
      required this.local,
      required this.tipoPlantonista,
      required this.plantonista,
      required this.status});
}
