CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCurso`(
    IN p_nome_curso VARCHAR(45),
    IN p_tempo_duracao INT,
    IN p_area_id INT
)
BEGIN 
    INSERT INTO Curso (nome_curso, tempo_duracao, Area_id_area)
    VALUES (p_nome_curso, p_tempo_duracao, p_area_id);
END