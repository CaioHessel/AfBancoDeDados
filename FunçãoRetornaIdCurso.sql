CREATE DEFINER=`root`@`localhost` FUNCTION `buscaIdCurso`(
    p_nome_curso VARCHAR(45),
    p_nome_area VARCHAR(60)
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE v_curso_id INT;
    
    SELECT id_curso INTO v_curso_id
    FROM Curso c
    INNER JOIN Area a ON c.Area_id_area = a.id_area
    WHERE c.nome_curso = p_nome_curso AND a.nome_area = p_nome_area;
    
    RETURN v_curso_id;
END