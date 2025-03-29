create database universidade;
use universidade;

create table tbl_departamentos (
numero_depto int not null,
nome_depto varchar(40) not null,
constraint pk_depto primary key (numero_depto)
);


create table tbl_professores (
id_professor int not null,
numero_depto int not null,
nome_professor varchar(50) not null,
email_professor varchar(50) not null,
constraint pk_professor primary key (id_professor),
constraint fk_professor_depto foreign key (numero_depto) references tbl_departamentos (numero_depto)
);


create table tbl_projetos (
id_projetos int not null,
numero_depto int not null,
nome_projeto varchar(50) not null,
data_inicio_projeto DATE not null,
data_fim_projeto DATE,
valor_projeto DECIMAL (10,2) not null,
constraint pk_projetos primary key (id_projetos),
constraint fk_projeto_depto foreign key (numero_depto) references tbl_departamentos (numero_depto)
);


create table tbl_disciplinas (
id_disciplina int not null,
numero_depto int not null,
nome_disciplina varchar(50) not null,
creditos_disciplina int not null,
constraint pk_disciplina primary key (id_disciplina),
constraint fk_disciplina_depto foreign key (numero_depto) references tbl_departamentos (numero_depto)
);


create table tbl_turmas (
id_turma int not null,
semestre_turma int not null,
id_disciplina int not null,
id_professor int not null,
turno_turma varchar(50) not null,
sala_turma int not null,
constraint pk_turma primary key (id_turma),
constraint fk_disciplina_turma foreign key (id_disciplina) references tbl_disciplinas (id_disciplina),
constraint fk_professor_turma foreign key (id_professor) references tbl_professores (id_professor)
);


create table tbl_alunos (
id_aluno int not null,
nome_aluno varchar (50),
email_aluno varchar (50),
telefone_aluno int not null,
constraint pk_aluno primary key (id_aluno)
);

create table tbl_matriculas (
id_matricula int not null,
id_disciplina int not null,
id_turma int not null,
id_aluno int not null,
data_matricula DATE not null,
valor_matricula double not null,
data_vencimento_matricula DATE not null,
status_matricula boolean not null,
constraint pk_matricula primary key (id_matricula),
constraint fk_matricula_turma foreign key (id_turma) references tbl_turmas (id_turma),
constraint fk_disciplina_matricula foreign key (id_disciplina) references tbl_disciplinas(id_disciplina),
constraint fk_matricula_aluno foreign key (id_aluno) references tbl_alunos (id_aluno)
);


insert into tbl_departamentos (numero_depto, nome_depto) values (1, "Ciências Tecnologicas");
insert into tbl_departamentos (numero_depto, nome_depto) values (2, "Exatas");
insert into tbl_departamentos (numero_depto, nome_depto) values (3, "Saúde");

insert into tbl_professores (id_professor, numero_depto, nome_professor, email_professor) values (1, 1, "Max", "max@gmail.com" );
insert into tbl_professores (id_professor, numero_depto, nome_professor, email_professor) values (2, 1, "Stelio", "stelio@gmail.com" );
insert into tbl_professores (id_professor, numero_depto, nome_professor, email_professor) values (3, 3, "Marcia", "marcia@gmail.com" );

insert into tbl_disciplinas (id_disciplina, numero_depto, nome_disciplina, creditos_disciplina) values (1, 1, "Banco de dados", 4);
insert into tbl_disciplinas (id_disciplina, numero_depto, nome_disciplina, creditos_disciplina) values (2, 1, "Engenharia de Requisitos", 4);
insert into tbl_disciplinas (id_disciplina, numero_depto, nome_disciplina, creditos_disciplina) values (3, 3, "Matemática", 2);
insert into tbl_disciplinas (id_disciplina, numero_depto, nome_disciplina, creditos_disciplina) values (4, 3, "Python", 8);
insert into tbl_disciplinas (id_disciplina, numero_depto, nome_disciplina, creditos_disciplina) values (5, 1, "Arquitetura de Computadores", 4);


insert into tbl_turmas (id_turma, semestre_turma, id_disciplina, turno_turma, sala_turma, id_professor) values (1, 20242, 1, "Noturno", 113, 1);
insert into tbl_turmas (id_turma, semestre_turma, id_disciplina, turno_turma, sala_turma, id_professor) values (2, 20242, 2, "Noturno", 216, 2);
insert into tbl_turmas (id_turma, semestre_turma, id_disciplina, turno_turma, sala_turma, id_professor) values (3, 20242, 3, "Noturno", 216, 3);
insert into tbl_turmas (id_turma, semestre_turma, id_disciplina, turno_turma, sala_turma, id_professor) values (4, 20242, 4, "Noturno", 216, 1);
insert into tbl_turmas (id_turma, semestre_turma, id_disciplina, turno_turma, sala_turma, id_professor) values (5, 20242, 5, "Matutino", 110, 2);

insert into tbl_projetos (id_projetos, numero_depto, nome_projeto, data_inicio_projeto, data_fim_projeto, valor_projeto) values (1, 1, "Gestão", "2023-10-05", null, 50);
insert into tbl_projetos (id_projetos, numero_depto, nome_projeto, data_inicio_projeto, data_fim_projeto, valor_projeto) values (2, 2, "Desenvolvimento", "2024-01-10", null, 70);

insert into tbl_matriculas (id_matricula, id_turma, id_aluno, data_matricula, valor_matricula, data_vencimento_matricula, status_matricula, id_disciplina) values (2, 1, 1, "2024-08-11", 200.00, "2024-07-10", 1, 1);

insert into tbl_alunos (id_aluno, nome_aluno, email_aluno, telefone_aluno) values (1, "Rayssa", "rayssab0408@gmail.com", 996108948);
insert into tbl_alunos (id_aluno, nome_aluno, email_aluno, telefone_aluno) values (2, "Fábio", "fabio@gmail.com", 99234567);
insert into tbl_alunos (id_aluno, nome_aluno, email_aluno, telefone_aluno) values (3, "Alice", "alice8@gmail.com", 950383743);


select *
from tbl_departamentos;


select nome_disciplina
       creditos_disciplina
from tbl_disciplinas;


select id_professor
       email_professor
from tbl_professores;


select id_disciplina,
       nome_disciplina,
      creditos_disciplina
from tbl_disciplinas
where creditos_disciplina>4;


select id_disciplina,
      id_turma,
      id_aluno
from tbl_matriculas
where id_aluno = 1;


select *
from tbl_turmas
where id_professor = 1
and sala_turma = 113;


select * 
from tbl_turmas 
where sala_turma = 216;

select * 
from tbl_turmas 
where id_professor = 1 OR sala_turma = 216;

select * 
from tbl_alunos 
order by nome_aluno desc;

select * 
from tbl_disciplinas 
order by creditos_disciplina desc;

select * 
from tbl_matriculas 
where id_aluno = 1 order by valor_matricula desc;

select id_disciplina, turno_turma, sala_turma 
from tbl_turmas 
where turno_turma = "Noturno" AND sala_turma = 216;

select id_disciplina, turno_turma, sala_turma, id_professor 
from tbl_turmas where turno_turma = "Noturno" AND sala_turma = 216 order by id_professor;
select count(*) from tbl_matriculas; 
