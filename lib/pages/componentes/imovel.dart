class Imovel {
    Imovel({
        this.id,
        this.nome,
        this.img,
        this.tamanho,
        this.quarto,
        this.banheiro,
        this.vaga,
        this.aluguel,
        this.condominio,
        this.bairro,
        this.localizacao,
        this.proprietario,
    });

    String id;
    String nome;
    String img;
    String tamanho;
    String quarto;
    String banheiro;
    String vaga;
    String aluguel;
    String condominio;
    String bairro;
    String localizacao;
    String proprietario;

    factory Imovel.fromJson(Map<String, dynamic> json) => Imovel(
        id: json["id"],
        nome: json["nome"],
        img: json["img"],
        tamanho: json["tamanho"],
        quarto: json["quarto"],
        banheiro: json["banheiro"],
        vaga: json["vaga"],
        aluguel: json["aluguel"],
        condominio: json["condominio"],
        bairro: json["bairro"],
        localizacao: json["localizacao"],
        proprietario: json["proprietario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "img": img,
        "tamanho": tamanho,
        "quarto": quarto,
        "banheiro": banheiro,
        "vaga": vaga,
        "aluguel": aluguel,
        "condominio": condominio,
        "bairro": bairro,
        "localizacao": localizacao,
        "proprietario": proprietario,
    };
}
