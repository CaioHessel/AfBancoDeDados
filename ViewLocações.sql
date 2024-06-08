CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `dbaf`.`locacoesfeitas` AS
    SELECT 
        `l`.`Cod_Locacao` AS `Cod_Locacao`,
        `l`.`Placa` AS `Placa`,
        `v`.`Veiculo` AS `Veiculo`,
        `v`.`Cor` AS `Cor`,
        `v`.`Diaria` AS `Diaria`,
        `l`.`CPF` AS `CPF`,
        `c`.`Cliente` AS `Cliente`,
        `c`.`Nascimento` AS `Nascimento`,
        `l`.`Dias` AS `Dias`,
        `l`.`Total` AS `Total`
    FROM
        ((`dbaf`.`locacao` `l`
        JOIN `dbaf`.`veiculo` `v` ON ((`l`.`Placa` = `v`.`Placa`)))
        JOIN `dbaf`.`cliente` `c` ON ((`l`.`CPF` = `c`.`CPF`)))