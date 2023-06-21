class SalerType {
  final int id;
  final String name;

  SalerType({required this.id, required this.name});
}

load_salertype() {
  List<SalerType> list_types = [
    SalerType(id: 1, name: 'Ágio'),
    SalerType(id: 2, name: 'Troca'),
    SalerType(id: 3, name: 'Ä vista'),
    SalerType(id: 4, name: 'Negociável'),
  ];
  
  return list_types;
}
