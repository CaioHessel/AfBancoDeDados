CREATE DEFINER=`root`@`localhost` PROCEDURE `realizaMatricula`(

    IN p_nome_completo VARCHAR(100),
    IN p_idade_aluno INT,
    IN p_curso_id INT,
    IN p_endereco_aluno VARCHAR(100)
)
BEGIN
    DECLARE v_email_aluno VARCHAR(100);
    DECLARE v_aluno_id INT;
    DECLARE v_ra_aluno INT;


    IF EXISTS (SELECT 1 FROM Matricula WHERE Alunos_id_alunos = (SELECT id_alunos FROM Alunos WHERE nome_aluno = p_nome_completo)) THEN
        SELECT 'O aluno já está matriculado em outro curso.' AS Message;
    ELSE
       
        SET v_email_aluno = CONCAT(SUBSTRING_INDEX(p_nome_completo, ' ', 1), '.', SUBSTRING_INDEX(p_nome_completo, ' ', -1), '@facens.com');

        
        SET v_ra_aluno = (SELECT COALESCE(MAX(ra_aluno), 199999) FROM Alunos) + 1;

       
        INSERT INTO Alunos (nome_aluno, idade_aluno, curso_aluno, endereco_aluno, ra_aluno, email)
        VALUES (p_nome_completo, p_idade_aluno, p_curso_id, p_endereco_aluno, v_ra_aluno, v_email_aluno);

        
        SET v_aluno_id = LAST_INSERT_ID();

        
        INSERT INTO Matricula (Curso_id_curso, Alunos_id_alunos)
        VALUES (p_curso_id, v_aluno_id);

        SELECT CONCAT('Matrícula realizada com sucesso para o aluno ', p_nome_completo) AS Message;
    END IF;
END