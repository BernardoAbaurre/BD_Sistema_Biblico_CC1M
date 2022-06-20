create database sistema_biblico; -- criar BD
use sistema_biblico; -- usar BD

-- criar tabelas
CREATE TABLE professias (
                codigo_profecia INT         NOT NULL,
                nome            VARCHAR(30) NOT NULL,
                descricao       TEXT        NOT NULL,
                PRIMARY KEY (codigo_profecia)
);


CREATE TABLE mapas (
                codigo_mapa        INT         NOT NULL,
                nome               VARCHAR(30) NOT NULL,
                regiao             VARCHAR(30) NOT NULL,
                relevo             VARCHAR(30) NOT NULL,
                vegetacao          VARCHAR(30) NOT NULL,
                temperatura_media  SMALLINT    NOT NULL,
                temperatura_maxima SMALLINT    NOT NULL,
                temperatura_minima SMALLINT    NOT NULL,
                PRIMARY KEY (codigo_mapa)
);


CREATE TABLE fatos_relevantes (
                codigo_fato INT         NOT NULL,
                nome        VARCHAR(30) NOT NULL,
                descricao   TEXT        NOT NULL,
                PRIMARY KEY (codigo_fato)
);


CREATE TABLE pessoas (
                codigo_pessoa    INT         NOT NULL,
                nome             VARCHAR(30) NOT NULL,
                idade            INT,
                local_nascimento VARCHAR(30),
                PRIMARY KEY (codigo_pessoa)
);


CREATE TABLE ascendem (
                codigo_pessoa_ascendente  INT NOT NULL,
                codigo_pessoa_descendente INT NOT NULL,
                PRIMARY KEY (codigo_pessoa_ascendente, codigo_pessoa_descendente)
);


CREATE TABLE f_envolvem_p (
                codigo_fato   INT NOT NULL,
                codigo_pessoa INT NOT NULL,
                PRIMARY KEY (codigo_fato, codigo_pessoa)
);


CREATE TABLE local_onde_habitou (
                codigo_local  INT         NOT NULL,
                codigo_pessoa INT         NOT NULL,
                nome_local    VARCHAR(30) NOT NULL,
                PRIMARY KEY (codigo_local, codigo_pessoa)
);


CREATE TABLE datas_relevantes (
                codigo_data INT NOT NULL,
                dia         INT,
                mes         INT,
                ano         INT,
                tempo       VARCHAR(2),
                PRIMARY KEY (codigo_data)
);


CREATE TABLE ocorrem_em (
                codigo_profecia INT NOT NULL,
                codigo_data     INT NOT NULL,
                PRIMARY KEY (codigo_profecia, codigo_data)
);


CREATE TABLE livros (
                codigo_livro         INT         NOT NULL,
                nome                 VARCHAR(30) NOT NULL,
                quantidade_capitulos INT         NOT NULL,
                epoca                VARCHAR(30) NOT NULL,
                abreviatura          VARCHAR(30) NOT NULL,
                PRIMARY KEY (codigo_livro)
);


CREATE TABLE planos_de_leitura (
                codigo_plano INT  NOT NULL,
                objetivo     TEXT NOT NULL,
                duracao      TIME NOT NULL,
                codigo_livro INT  NOT NULL,
                PRIMARY KEY (codigo_plano)
);


CREATE TABLE escrevem (
                codigo_pessoa INT NOT NULL,
                codigo_livro  INT NOT NULL,
                PRIMARY KEY (codigo_pessoa, codigo_livro)
);


CREATE TABLE capitulos (
                codigo_capitulo       INT         NOT NULL,
                nome                  VARCHAR(30) NOT NULL,
                quantidade_versiculos INT         NOT NULL,
                categoria             VARCHAR(30) NOT NULL,
                reflexao              TEXT        NOT NULL,
                codigo_livro          INT         NOT NULL,
                PRIMARY KEY (codigo_capitulo)
);


CREATE TABLE versiculos (
                codigo_versiculo INT         NOT NULL,
                nome             VARCHAR(30) NOT NULL,
                texto            TEXT        NOT NULL,
                objetivo         TEXT        NOT NULL,
                reflexao         TEXT        NOT NULL,
                codigo_capitulo  INT         NOT NULL,
                PRIMARY KEY (codigo_versiculo)
);


CREATE TABLE orientam (
                codigo_data      INT NOT NULL,
                codigo_versiculo INT NOT NULL,
                PRIMARY KEY (codigo_data, codigo_versiculo)
);


CREATE TABLE possuem (
                codigo_versiculo INT NOT NULL,
                codigo_fato      INT NOT NULL,
                PRIMARY KEY (codigo_versiculo, codigo_fato)
);


CREATE TABLE aparecem (
                codigo_profecia  INT NOT NULL,
                codigo_versiculo INT NOT NULL,
                PRIMARY KEY (codigo_profecia, codigo_versiculo)
);


CREATE TABLE v_envolvem_m (
                codigo_versiculo INT NOT NULL,
                codigo_mapa      INT NOT NULL,
                PRIMARY KEY (codigo_versiculo, codigo_mapa)
);

-- fazer relacionamentos

ALTER TABLE aparecem ADD CONSTRAINT professias_aparecem_fk
FOREIGN KEY (codigo_profecia)
REFERENCES professias (codigo_profecia)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ocorrem_em ADD CONSTRAINT professias_ocorrem_em_fk
FOREIGN KEY (codigo_profecia)
REFERENCES professias (codigo_profecia)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE v_envolvem_m ADD CONSTRAINT mapas_envolvem_fk
FOREIGN KEY (codigo_mapa)
REFERENCES mapas (codigo_mapa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE possuem ADD CONSTRAINT fatos_relevantes_possuem_fk
FOREIGN KEY (codigo_fato)
REFERENCES fatos_relevantes (codigo_fato)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE f_envolvem_p ADD CONSTRAINT fatos_relevantes_f_envolvem_p_fk
FOREIGN KEY (codigo_fato)
REFERENCES fatos_relevantes (codigo_fato)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE local_onde_habitou ADD CONSTRAINT pessoas_local_onde_habitou_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE f_envolvem_p ADD CONSTRAINT pessoas_f_envolvem_p_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ascendem ADD CONSTRAINT pessoas_ascendem_fk
FOREIGN KEY (codigo_pessoa_ascendente)
REFERENCES pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ascendem ADD CONSTRAINT pessoas_ascendem_fk1
FOREIGN KEY (codigo_pessoa_descendente)
REFERENCES pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE escrevem ADD CONSTRAINT pessoas_escrevem_fk
FOREIGN KEY (codigo_pessoa)
REFERENCES pessoas (codigo_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ocorrem_em ADD CONSTRAINT datas_relevantes_ocorrem_em_fk
FOREIGN KEY (codigo_data)
REFERENCES datas_relevantes (codigo_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE orientam ADD CONSTRAINT datas_relevantes_orientam_fk
FOREIGN KEY (codigo_data)
REFERENCES datas_relevantes (codigo_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE capitulos ADD CONSTRAINT livros_capitulos_fk
FOREIGN KEY (codigo_livro)
REFERENCES livros (codigo_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE escrevem ADD CONSTRAINT livros_escrevem_fk
FOREIGN KEY (codigo_livro)
REFERENCES livros (codigo_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE planos_de_leitura ADD CONSTRAINT livros_planos_de_leitura_fk
FOREIGN KEY (codigo_livro)
REFERENCES livros (codigo_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE versiculos ADD CONSTRAINT capitulos_versiculos_fk
FOREIGN KEY (codigo_capitulo)
REFERENCES capitulos (codigo_capitulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE v_envolvem_m ADD CONSTRAINT versiculos_envolvem_fk
FOREIGN KEY (codigo_versiculo)
REFERENCES versiculos (codigo_versiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aparecem ADD CONSTRAINT versiculos_aparecem_fk
FOREIGN KEY (codigo_versiculo)
REFERENCES versiculos (codigo_versiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE possuem ADD CONSTRAINT versiculos_possuem_fk
FOREIGN KEY (codigo_versiculo)
REFERENCES versiculos (codigo_versiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE orientam ADD CONSTRAINT versiculos_orientam_fk
FOREIGN KEY (codigo_versiculo)
REFERENCES versiculos (codigo_versiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- regras de integridade
alter table datas_relevantes
add constraint CHK_tempo check (tempo = 'AC' or tempo = 'DC');
