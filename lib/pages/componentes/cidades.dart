class Localizacao {
    String id;
    String nome;
    
    Localizacao({
      this.id,
      this.nome,
    });

  factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
    id: json["id"],
    nome: json["nome"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
  };
}