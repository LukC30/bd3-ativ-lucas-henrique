DELIMITER $
CREATE PROCEDURE LISTA_ALUNOS_SALA()
BEGIN
select a.id_aluno, a.nome, a.telefone_aluno, a.telefone_responsavel, a.email, b.nome as nome_sala, b.sigla as sigla_sala, c.sigla
from tbl_aluno a
inner join tbl_turma b on a.id_turma = b.id_turma
inner join tbl_disciplinas c on c.id_turma = b.id_turma;



END
$

CALL LISTA_ALUNOS_SALA();


DELIMITER $
CREATE PROCEDURE LISTA_ALUNO_SALA(IN ID_ALUNO_PARAM INT)
BEGIN
select a.id_aluno, a.nome, a.telefone_aluno, a.telefone_responsavel, a.email, b.nome as nome_sala, b.sigla as sigla_sala, c.sigla
from tbl_aluno a
inner join tbl_turma b on a.id_turma = b.id_turma
inner join tbl_disciplinas c on c.id_turma = b.id_turma
WHERE A.ID_ALUNO = ID_ALUNO_PARAM;


END
$

CALL LISTA_ALUNO_SALA(2);

DELIMITER $$$
CREATE PROCEDURE CONTAGEM_ALUNOS (OUT TOTAL_ALUNO INT)
BEGIN
SELECT COUNT(ID_ALUNO) INTO TOTAL_ALUNO FROM TBL_ALUNO;

END

$$$

CALL CONTAGEM_ALUNOS(@CONTAGEM_ALUNOXD);
SELECT @CONTAGEM_ALUNOXD;